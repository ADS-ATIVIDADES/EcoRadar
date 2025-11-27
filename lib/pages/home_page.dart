import 'package:flutter/material.dart';
import 'news_list_page.dart';
import '../services/database.dart';
import '../services/sync_service.dart';
import '../services/apitube_service.dart';
import '../config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppDatabase database;
  late SyncService syncService;
  bool _isSyncing = false;
  final GlobalKey<NewsListPageState> _newsListKey =
      GlobalKey<NewsListPageState>();

  @override
  void initState() {
    super.initState();
    database = AppDatabase();
    syncService = SyncService(database, ApitubeService());
    _autoSync();
  }

  Future<void> _autoSync() async {
    setState(() {
      _isSyncing = true;
    });
    try {
      await syncService.syncNews();
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }

  Future<void> _manualSync() async {
    setState(() {
      _isSyncing = true;
    });
    try {
      await syncService.syncNews(isManual: true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sincronização concluída!')),
      );
      // Atualizar a lista de notícias
      _newsListKey.currentState?.refresh();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro na sincronização: $e')),
      );
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }

  Future<void> _showIntegrationLogs() async {
    final logs = await database.getIntegrationLogs();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logs de Integração'),
        content: logs != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Última sincronização automática:'),
                  Text(logs['lastAutoSyncAt'] ?? 'Nunca',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Total de artigos: ${logs['articlesCount']}'),
                  SizedBox(height: 8),
                  Text('Dados de resposta salvos: '
                      '${logs['hasResponseData'] ? 'Sim' : 'Não'}'),
                ],
              )
            : Text('Nenhuma integração realizada ainda.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _showAllSyncLogs() async {
    final logs = await database.getAllSyncLogs();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Histórico de Sincronização'),
        content: Container(
          width: double.maxFinite,
          height: 400,
          child: logs.isEmpty
              ? Center(child: Text('Nenhum log de sincronização encontrado.'))
              : ListView.builder(
                  itemCount: logs.length,
                  itemBuilder: (context, index) {
                    final log = logs[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  log.status == 'success'
                                      ? Icons.check_circle
                                      : Icons.error,
                                  color: log.status == 'success'
                                      ? Colors.green
                                      : Colors.red,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  log.timestamp.toString().split('.')[0],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  log.type,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              log.message,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Processados: ${log.articlesProcessed}',
                                  style: TextStyle(fontSize: 11),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Inseridos: ${log.articlesInserted}',
                                  style: TextStyle(fontSize: 11),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Ignorados: ${log.articlesSkipped}',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            if (log.durationMs != null) ...[
                              SizedBox(height: 2),
                              Text(
                                'Duração: ${log.durationMs}ms',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                            if (log.errorDetails != null) ...[
                              SizedBox(height: 2),
                              Text(
                                'Erro: ${log.errorDetails}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.red[600],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _clearArticles() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Limpeza'),
        content: Text(
          'Tem certeza que deseja limpar todos os artigos? '
          'Esta ação não pode ser desfeita.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Limpar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await database.clearAllArticles();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos os artigos foram removidos!')),
      );
      // Atualizar a lista de notícias
      _newsListKey.currentState?.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Config.debugBanner
          ? AppBar(
              backgroundColor: Colors.transparent,
              title: Text(' '),
              actions: [
                if (_isSyncing)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                else
                  IconButton(
                    icon: Icon(Icons.sync),
                    onPressed: _manualSync,
                    tooltip: 'Sincronizar Notícias',
                  ),
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: _showIntegrationLogs,
                  tooltip: 'Ver Logs de Integração',
                ),
                IconButton(
                  icon: Icon(Icons.history),
                  onPressed: _showAllSyncLogs,
                  tooltip: 'Ver Histórico de Sincronização',
                ),
                IconButton(
                  icon: Icon(Icons.delete_forever, color: Colors.red),
                  onPressed: _clearArticles,
                  tooltip: 'Limpar Todos os Artigos',
                ),
                SizedBox(width: 60),
              ],
            )
          : null,
      body: Column(
        children: [
          SizedBox(height: 16),
          // Exibição da logo como asset com tratamento de erro
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                try {
                  return Image.asset(
                    'assets/images/ecoradar.png', // Caminho da imagem
                    height: 250,
                  );
                } catch (e) {
                  // Exibe mensagem de erro se a imagem falhar
                  return Text(
                    'Erro ao carregar a logo. Verifique o caminho.',
                    style: TextStyle(color: Colors.red),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: NewsListPage(key: _newsListKey)), // Lista de notícias
        ],
      ),
    );
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }
}
