import 'dart:convert';
import 'package:drift/drift.dart';
import 'apitube_service.dart';
import 'database.dart';

class SyncService {
  final AppDatabase database;
  final ApitubeService apiService;

  SyncService(this.database, this.apiService);

  double? _safeDoubleConvert(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    return null;
  }

  int? _safeIntConvert(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is num) return value.toInt();
    return null;
  }

  Future<bool> shouldSyncAuto() async {
    final control = await database.getLastIntegrationControl();
    if (control == null || control.lastAutoSyncAt == null) {
      return true;
    }

    final lastSync = control.lastAutoSyncAt!;
    final now = DateTime.now();
    final difference = now.difference(lastSync);
    return difference.inHours >= 6;
  }

  Future<void> syncNews({bool isManual = false}) async {
    final startTime = DateTime.now();
    int articlesProcessed = 0;
    int articlesInserted = 0;
    int articlesSkipped = 0;
    String? errorDetails;

    try {
      if (!isManual && !await shouldSyncAuto()) {
        print(
            'Sincronização automática pulada: menos de 6 horas desde a última.');
        return;
      }

      print('Iniciando sincronização...');
      final apiResponse = await apiService.fetchNews();
      if (apiResponse == null) {
        print('Falha ao obter dados da API.');
        throw Exception('Falha ao obter dados da API');
      }

      print('Resposta da API recebida. Processando dados...');
      final results = apiResponse['results'] as List<dynamic>?;
      if (results == null) {
        print('Nenhum resultado encontrado na resposta da API.');
        throw Exception('Nenhum resultado encontrado na resposta da API');
      }

      print(
          'Encontrados ${results.length} artigos. Iniciando processamento...');
      articlesProcessed = results.length;

      await database.transaction(() async {
        for (final item in results) {
          final articleId = item['id'] as int;
          if (await database.articleExists(articleId)) {
            articlesSkipped++;
            print('Artigo $articleId já existe, pulando.');
          } else {
            await _processArticle(item as Map<String, dynamic>);
            articlesInserted++;
          }
        }
      });

      // Atualizar controle de integração
      final control = await database.getLastIntegrationControl();
      final companion = IntegrationControlCompanion(
        id: control != null ? Value(control.id) : const Value.absent(),
        lastAutoSyncAt: Value(DateTime.now()),
        responseJson: Value(jsonEncode(apiResponse)),
      );

      if (control != null) {
        await database.updateIntegrationControl(companion);
      } else {
        await database.insertIntegrationControl(companion);
      }

      print('Sincronização concluída com sucesso.');
    } catch (e, stackTrace) {
      errorDetails = '$e\n$stackTrace';
      print('ERRO na sincronização: $e');
      rethrow;
    } finally {
      // Registrar log detalhado
      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      final status = errorDetails != null ? 'error' : 'success';

      await database.insertSyncLog(SyncLogsCompanion(
        timestamp: Value(startTime),
        type: Value(isManual ? 'manual' : 'auto'),
        status: Value(status),
        message: Value(errorDetails != null
            ? 'Erro na sincronização'
            : 'Sincronização concluída com sucesso'),
        articlesProcessed: Value(articlesProcessed),
        articlesInserted: Value(articlesInserted),
        articlesSkipped: Value(articlesSkipped),
        errorDetails: Value(errorDetails),
        durationMs: Value(duration.inMilliseconds),
      ));

      print('Log de sincronização registrado: $status');
    }
  }

  Future<void> _processArticle(Map<String, dynamic> item) async {
    final articleId = item['id'] as int;

    // Verificar deduplicação
    if (await database.articleExists(articleId)) {
      print('Artigo $articleId já existe, pulando.');
      return;
    }

    print('Processando artigo ID: $articleId - ${item['title']}');

    try {
      // Processar author
      int? authorId;
      if (item['author'] != null) {
        final authorData = item['author'] as Map<String, dynamic>;
        authorId = authorData['id'] as int?;
        if (authorId != null &&
            await database.getAuthorById(authorId) == null) {
          await database.insertAuthor(AuthorsCompanion(
            id: Value(authorId),
            name: Value(authorData['name'] as String? ?? ''),
            email: const Value.absent(),
          ));
          print('Autor inserido: $authorId');
        }
      }

      // Processar source
      int? sourceId;
      if (item['source'] != null) {
        final sourceData = item['source'] as Map<String, dynamic>;
        sourceId = sourceData['id'] as int?;
        if (sourceId != null &&
            await database.getSourceById(sourceId) == null) {
          await database.insertSource(SourcesCompanion(
            id: Value(sourceId),
            domain: Value(sourceData['domain'] as String? ?? ''),
            homePageUrl: Value(sourceData['home_page_url'] as String? ?? ''),
            type: Value(sourceData['type'] as String? ?? ''),
            rankingsOpr: Value(_safeIntConvert(
                (sourceData['rankings'] as Map<String, dynamic>?)?['opr'])),
            locationCountryName: Value((sourceData['location']
                as Map<String, dynamic>?)?['country_name'] as String?),
            locationCountryCode: Value((sourceData['location']
                as Map<String, dynamic>?)?['country_code'] as String?),
            favicon: Value(sourceData['favicon'] as String?),
          ));
          print('Fonte inserida: $sourceId');
        }
      }

      // Inserir article
      print('Inserindo artigo $articleId...');
      await database.insertArticle(ArticlesCompanion(
        id: Value(articleId),
        href: Value(item['href'] as String? ?? ''),
        publishedAt: Value(DateTime.parse(item['published_at'] as String)),
        title: Value(item['title'] as String? ?? ''),
        description: Value(item['description'] as String?),
        body: Value(item['body'] as String? ?? ''),
        language: Value(item['language'] as String? ?? ''),
        image: Value(item['image'] as String?),
        authorId: Value(authorId),
        sourceId: Value(sourceId),
        sentimentOverallScore: Value(_safeDoubleConvert((item['sentiment']
            as Map<String, dynamic>?)?['overall']?['score'])),
        sentimentOverallPolarity: Value((item['sentiment']
            as Map<String, dynamic>?)?['overall']?['polarity'] as String?),
        isDuplicate: Value(item['is_duplicate'] as bool? ?? false),
        isPaywall: Value(item['is_paywall'] as bool? ?? false),
        sentencesCount: Value(_safeIntConvert(item['sentences_count'])),
        paragraphsCount: Value(_safeIntConvert(item['paragraphs_count'])),
        wordsCount: Value(_safeIntConvert(item['words_count'])),
        charactersCount: Value(_safeIntConvert(item['characters_count'])),
      ));
      print('Artigo inserido: $articleId');

      // Processar categories
      if (item['categories'] != null) {
        final categories = item['categories'] as List<dynamic>;
        for (final cat in categories) {
          final catData = cat as Map<String, dynamic>;
          final catId = catData['id'] as String;
          if (await database.getCategoryById(catId) == null) {
            await database.insertCategory(CategoriesCompanion(
              id: Value(catId),
              name: Value(catData['name'] as String? ?? ''),
              score: Value(_safeDoubleConvert(catData['score'])),
              taxonomy: Value(catData['taxonomy'] as String?),
            ));
          }
          // Verificar se a relação já existe antes de inserir
          if (await database.getArticleCategory(articleId, catId) == null) {
            await database.insertArticleCategory(ArticleCategoriesCompanion(
              articleId: Value(articleId),
              categoryId: Value(catId),
            ));
          }
        }
        print('Categorias processadas para artigo $articleId');
      }

      // Processar industries
      if (item['industries'] != null) {
        final industries = item['industries'] as List<dynamic>;
        for (final ind in industries) {
          final indData = ind as Map<String, dynamic>;
          final indId = indData['id'] as int;
          if (await database.getIndustryById(indId) == null) {
            await database.insertIndustry(IndustriesCompanion(
              id: Value(indId),
              name: Value(indData['name'] as String? ?? ''),
            ));
          }
          // Verificar se a relação já existe antes de inserir
          if (await database.getArticleIndustry(articleId, indId) == null) {
            await database.insertArticleIndustry(ArticleIndustriesCompanion(
              articleId: Value(articleId),
              industryId: Value(indId),
            ));
          }
        }
        print('Indústrias processadas para artigo $articleId');
      }

      // Processar entities
      if (item['entities'] != null) {
        final entities = item['entities'] as List<dynamic>;
        final processedEntityIds =
            <int>{}; // Para evitar duplicatas no mesmo artigo
        for (final ent in entities) {
          final entData = ent as Map<String, dynamic>;
          final entId = entData['id'] as int;

          // Pular se já processamos esta entidade neste artigo
          if (processedEntityIds.contains(entId)) {
            continue;
          }
          processedEntityIds.add(entId);

          if (await database.getEntityById(entId) == null) {
            await database.insertEntity(EntitiesCompanion(
              id: Value(entId),
              name: Value(entData['name'] as String? ?? ''),
              types:
                  Value((entData['types'] as List<dynamic>?)?.join(',') ?? ''),
              language: Value(entData['language'] as String?),
              frequency: Value(_safeIntConvert(entData['frequency'])),
              wikipediaUrl: Value((entData['links']
                  as Map<String, dynamic>?)?['wikipedia'] as String?),
              wikidataUrl: Value((entData['links']
                  as Map<String, dynamic>?)?['wikidata'] as String?),
            ));
          }
          // Verificar se a relação já existe antes de inserir
          if (await database.getArticleEntity(articleId, entId) == null) {
            await database.insertArticleEntity(ArticleEntitiesCompanion(
              articleId: Value(articleId),
              entityId: Value(entId),
            ));
          }
        }
        print('Entidades processadas para artigo $articleId');
      }

      // Processar medias
      if (item['media'] != null) {
        final medias = item['media'] as List<dynamic>;
        for (final med in medias) {
          final medData = med as Map<String, dynamic>;
          await database.insertMedia(MediasCompanion(
            url: Value(medData['url'] as String? ?? ''),
            type: Value(medData['type'] as String? ?? ''),
            format: Value(medData['format'] as String?),
            articleId: Value(articleId),
          ));
        }
        print('Mídias processadas para artigo $articleId');
      }

      print('Processamento concluído para artigo $articleId');
    } catch (e, stackTrace) {
      print('ERRO ao processar artigo $articleId: $e');
      print('Stack trace: $stackTrace');
      print('Dados do artigo: $item');
      rethrow;
    }
  }
}
