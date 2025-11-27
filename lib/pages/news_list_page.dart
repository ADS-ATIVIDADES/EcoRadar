import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/database.dart';
import 'news_detail_page.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  NewsListPageState createState() => NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {
  late AppDatabase database;
  final ScrollController _scrollController = ScrollController();
  final int _pageSize = 10;
  final List<Article> _news = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    _loadMoreNews();
    _scrollController.addListener(_onScroll);
  }

  // Método público para recarregar dados
  void refresh() {
    setState(() {
      _news.clear();
      _currentPage = 0;
      _hasMore = true;
      _isLoading = false;
    });
    _loadMoreNews();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading &&
        _hasMore) {
      _loadMoreNews();
    }
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Hoje, ${DateFormat('HH:mm').format(dateTime)}';
    } else if (difference.inDays == 1) {
      return 'Ontem, ${DateFormat('HH:mm').format(dateTime)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} dias atrás';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

  Future<void> _loadMoreNews() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newNews =
          await database.getArticlesPage(_currentPage * _pageSize, _pageSize);
      setState(() {
        _news.addAll(newNews);
        _currentPage++;
        _hasMore = newNews.length == _pageSize;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Opcional: mostrar erro
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_news.isEmpty && !_isLoading) {
      return Center(child: Text('Nenhuma notícia disponível.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _news.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _news.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final newsItem = _news[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: const Icon(Icons.eco, color: Colors.green, size: 32),
            title: Text(
              newsItem.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              _formatDate(newsItem.publishedAt),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            trailing: const Icon(Icons.arrow_forward, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: newsItem),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    database.close();
    super.dispose();
  }
}
