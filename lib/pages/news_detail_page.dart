import 'package:flutter/material.dart';
import '../services/database.dart';

class NewsDetailPage extends StatefulWidget {
  final Article news;

  NewsDetailPage({required this.news});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late AppDatabase database;
  List<Category> categories = [];
  List<Industry> industries = [];
  List<Entity> entities = [];
  Source? source;
  Author? author;
  List<Media> medias = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    _loadArticleDetails();
  }

  Future<void> _loadArticleDetails() async {
    try {
      final loadedCategories =
          await database.getCategoriesByArticleId(widget.news.id);
      final loadedIndustries =
          await database.getIndustriesByArticleId(widget.news.id);
      final loadedEntities =
          await database.getEntitiesByArticleId(widget.news.id);
      final loadedSource = await database.getSourceByArticleId(widget.news.id);
      final loadedAuthor = await database.getAuthorByArticleId(widget.news.id);
      final loadedMedias = await database.getMediasByArticleId(widget.news.id);

      setState(() {
        categories = loadedCategories;
        industries = loadedIndustries;
        entities = loadedEntities;
        source = loadedSource;
        author = loadedAuthor;
        medias = loadedMedias;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar detalhes: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.news.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem principal do artigo
                  if (widget.news.image != null &&
                      widget.news.image!.isNotEmpty)
                    Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(widget.news.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  // Galeria de imagens adicionais
                  if (medias.isNotEmpty) ...[
                    Text(
                      'Imagens Relacionadas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: medias.length,
                        itemBuilder: (context, index) {
                          final media = medias[index];
                          return Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(media.url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Informações básicas
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Fonte
                          if (source != null) ...[
                            Row(
                              children: [
                                Icon(Icons.public,
                                    color: Colors.blue, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Fonte: ${source!.domain}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[700],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],

                          // Autor
                          if (author != null) ...[
                            Row(
                              children: [
                                Icon(Icons.person,
                                    color: Colors.purple, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Autor: ${author!.name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple[700],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],

                          // Data de publicação
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.orange, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Publicado em: ${_formatDate(widget.news.publishedAt)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),

                          // Estatísticas
                          if (widget.news.wordsCount != null ||
                              widget.news.sentencesCount != null) ...[
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.analytics,
                                    color: Colors.teal, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  '${widget.news.wordsCount ?? 0} palavras, ${widget.news.sentencesCount ?? 0} frases',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],

                          // Sentimento
                          if (widget.news.sentimentOverallPolarity != null) ...[
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  widget.news.sentimentOverallPolarity ==
                                          'positive'
                                      ? Icons.sentiment_satisfied
                                      : widget.news.sentimentOverallPolarity ==
                                              'negative'
                                          ? Icons.sentiment_dissatisfied
                                          : Icons.sentiment_neutral,
                                  color: widget.news.sentimentOverallPolarity ==
                                          'positive'
                                      ? Colors.green
                                      : widget.news.sentimentOverallPolarity ==
                                              'negative'
                                          ? Colors.red
                                          : Colors.grey,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Sentimento: ${widget.news.sentimentOverallPolarity}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Categorias
                  if (categories.isNotEmpty) ...[
                    Text(
                      'Categorias',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: categories
                          .map((category) => Chip(
                                label: Text(category.name),
                                backgroundColor: Colors.green[100],
                                labelStyle: TextStyle(color: Colors.green[800]),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Indústrias
                  if (industries.isNotEmpty) ...[
                    Text(
                      'Indústrias',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: industries
                          .map((industry) => Chip(
                                label: Text(industry.name),
                                backgroundColor: Colors.blue[100],
                                labelStyle: TextStyle(color: Colors.blue[800]),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Entidades
                  if (entities.isNotEmpty) ...[
                    Text(
                      'Entidades Mencionadas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: entities
                          .map((entity) => Chip(
                                label: Text(entity.name),
                                backgroundColor: Colors.purple[100],
                                labelStyle:
                                    TextStyle(color: Colors.purple[800]),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Descrição
                  if (widget.news.description != null &&
                      widget.news.description!.isNotEmpty) ...[
                    Text(
                      'Resumo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.news.description!,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],

                  // Corpo da notícia
                  Text(
                    'Conteúdo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.news.body,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),

                  // Link para notícia completa
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Abrir link no navegador
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Link: ${widget.news.href}')),
                        );
                      },
                      icon: Icon(Icons.link),
                      label: Text('Ver notícia completa'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}
