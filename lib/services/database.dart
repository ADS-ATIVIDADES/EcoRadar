import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import '../models/news.dart';

part 'database.g.dart'; // Gerado automaticamente

@DriftDatabase(tables: [
  NewsTable,
  Authors,
  Sources,
  Categories,
  Industries,
  Entities,
  Medias,
  Articles,
  ArticleCategories,
  ArticleIndustries,
  ArticleEntities,
  IntegrationControl,
  SyncLogs
])
class AppDatabase extends _$AppDatabase {
  // Singleton pattern
  static AppDatabase? _instance;

  AppDatabase._() : super(_openConnection());

  factory AppDatabase() {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            // Migrar do schema 1 para 2: adicionar todas as novas tabelas
            await m.createTable(authors);
            await m.createTable(sources);
            await m.createTable(categories);
            await m.createTable(industries);
            await m.createTable(entities);
            await m.createTable(medias);
            await m.createTable(articles);
            await m.createTable(articleCategories);
            await m.createTable(articleIndustries);
            await m.createTable(articleEntities);
            await m.createTable(integrationControl);
          }
          if (from <= 2) {
            // Migrar para schema 3: adicionar tabela SyncLogs
            await m.createTable(syncLogs);
          }
        },
      );

  // CRUD simples
  Future<List<NewsTableData>> getAllNews() => select(newsTable).get();
  Future<List<NewsTableData>> getNewsPage(int offset, int limit) =>
      (select(newsTable)..limit(limit, offset: offset)).get();
  Future<int> insertNews(NewsTableCompanion news) =>
      into(newsTable).insert(news);
  Future<bool> updateNews(NewsTableCompanion news) =>
      update(newsTable).replace(news);
  Future<int> deleteNews(int id) =>
      (delete(newsTable)..where((tbl) => tbl.id.equals(id))).go();

  // Authors CRUD
  Future<List<Author>> getAllAuthors() => select(authors).get();
  Future<int> insertAuthor(AuthorsCompanion author) =>
      into(authors).insert(author);
  Future<Author?> getAuthorById(int id) =>
      (select(authors)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Sources CRUD
  Future<List<Source>> getAllSources() => select(sources).get();
  Future<int> insertSource(SourcesCompanion source) =>
      into(sources).insert(source);
  Future<Source?> getSourceById(int id) =>
      (select(sources)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Categories CRUD
  Future<List<Category>> getAllCategories() => select(categories).get();
  Future<int> insertCategory(CategoriesCompanion category) =>
      into(categories).insert(category);
  Future<Category?> getCategoryById(String id) =>
      (select(categories)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Industries CRUD
  Future<List<Industry>> getAllIndustries() => select(industries).get();
  Future<int> insertIndustry(IndustriesCompanion industry) =>
      into(industries).insert(industry);
  Future<Industry?> getIndustryById(int id) =>
      (select(industries)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Entities CRUD
  Future<List<Entity>> getAllEntities() => select(entities).get();
  Future<int> insertEntity(EntitiesCompanion entity) =>
      into(entities).insert(entity);
  Future<Entity?> getEntityById(int id) =>
      (select(entities)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Medias CRUD
  Future<List<Media>> getMediasByArticleId(int articleId) =>
      (select(medias)..where((tbl) => tbl.articleId.equals(articleId))).get();
  Future<int> insertMedia(MediasCompanion media) => into(medias).insert(media);

  // Articles CRUD
  Future<List<Article>> getAllArticles() => select(articles).get();
  Future<List<Article>> getArticlesPage(int offset, int limit) =>
      (select(articles)
            ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)])
            ..limit(limit, offset: offset))
          .get();
  Future<int> insertArticle(ArticlesCompanion article) =>
      into(articles).insert(article);
  Future<Article?> getArticleById(int id) =>
      (select(articles)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<bool> articleExists(int id) =>
      (select(articles)..where((tbl) => tbl.id.equals(id)))
          .get()
          .then((value) => value.isNotEmpty);

  // Junction tables CRUD
  Future<int> insertArticleCategory(ArticleCategoriesCompanion ac) =>
      into(articleCategories).insert(ac);
  Future<int> insertArticleIndustry(ArticleIndustriesCompanion ai) =>
      into(articleIndustries).insert(ai);
  Future<int> insertArticleEntity(ArticleEntitiesCompanion ae) =>
      into(articleEntities).insert(ae);

  // Junction tables queries
  Future<ArticleCategory?> getArticleCategory(
          int articleId, String categoryId) =>
      (select(articleCategories)
            ..where((tbl) =>
                tbl.articleId.equals(articleId) &
                tbl.categoryId.equals(categoryId)))
          .getSingleOrNull();
  Future<ArticleIndustry?> getArticleIndustry(int articleId, int industryId) =>
      (select(articleIndustries)
            ..where((tbl) =>
                tbl.articleId.equals(articleId) &
                tbl.industryId.equals(industryId)))
          .getSingleOrNull();
  Future<ArticleEntity?> getArticleEntity(int articleId, int entityId) =>
      (select(articleEntities)
            ..where((tbl) =>
                tbl.articleId.equals(articleId) &
                tbl.entityId.equals(entityId)))
          .getSingleOrNull();

  // IntegrationControl CRUD
  Future<IntegrationControlData?> getLastIntegrationControl() =>
      (select(integrationControl)
            ..orderBy([(t) => OrderingTerm.desc(t.id)])
            ..limit(1))
          .getSingleOrNull();
  Future<int> insertIntegrationControl(IntegrationControlCompanion control) =>
      into(integrationControl).insert(control);
  Future<bool> updateIntegrationControl(IntegrationControlCompanion control) =>
      update(integrationControl).replace(control);

  // SyncLogs CRUD
  Future<List<SyncLog>> getAllSyncLogs() => select(syncLogs).get();
  Future<List<SyncLog>> getSyncLogsPage(int offset, int limit) =>
      (select(syncLogs)
            ..limit(limit, offset: offset)
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();
  Future<int> insertSyncLog(SyncLogsCompanion log) =>
      into(syncLogs).insert(log);
  Future<int> deleteOldSyncLogs(DateTime beforeDate) => (delete(syncLogs)
        ..where((tbl) => tbl.timestamp.isSmallerThanValue(beforeDate)))
      .go();

  // Article details queries
  Future<List<Category>> getCategoriesByArticleId(int articleId) async {
    final categoryIds = await (select(articleCategories)
          ..where((tbl) => tbl.articleId.equals(articleId)))
        .map((row) => row.categoryId)
        .get();
    return (select(categories)..where((tbl) => tbl.id.isIn(categoryIds))).get();
  }

  Future<List<Industry>> getIndustriesByArticleId(int articleId) async {
    final industryIds = await (select(articleIndustries)
          ..where((tbl) => tbl.articleId.equals(articleId)))
        .map((row) => row.industryId)
        .get();
    return (select(industries)..where((tbl) => tbl.id.isIn(industryIds))).get();
  }

  Future<List<Entity>> getEntitiesByArticleId(int articleId) async {
    final entityIds = await (select(articleEntities)
          ..where((tbl) => tbl.articleId.equals(articleId)))
        .map((row) => row.entityId)
        .get();
    return (select(entities)..where((tbl) => tbl.id.isIn(entityIds))).get();
  }

  Future<Source?> getSourceByArticleId(int articleId) async {
    final article = await getArticleById(articleId);
    if (article?.sourceId != null) {
      return (select(sources)
            ..where((tbl) => tbl.id.equals(article!.sourceId!)))
          .getSingleOrNull();
    }
    return null;
  }

  Future<Author?> getAuthorByArticleId(int articleId) async {
    final article = await getArticleById(articleId);
    if (article?.authorId != null) {
      return (select(authors)
            ..where((tbl) => tbl.id.equals(article!.authorId!)))
          .getSingleOrNull();
    }
    return null;
  }

  Future<void> clearAllArticles() async {
    await transaction(() async {
      // Delete in order to respect foreign key constraints
      await (delete(articleEntities)).go();
      await (delete(articleIndustries)).go();
      await (delete(articleCategories)).go();
      await (delete(medias)).go();
      await (delete(articles)).go();
    });
  }

  Future<Map<String, dynamic>?> getIntegrationLogs() async {
    final control = await getLastIntegrationControl();
    if (control == null) {
      return null;
    }

    final articlesCount =
        await (select(articles)).get().then((list) => list.length);
    final lastSync = control.lastAutoSyncAt;

    return {
      'lastAutoSyncAt': lastSync?.toIso8601String(),
      'articlesCount': articlesCount,
      'hasResponseData': control.responseJson != null,
    };
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'news.db'));
    return NativeDatabase(file);
  });
}
