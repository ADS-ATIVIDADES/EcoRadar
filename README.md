# EcoRadar

EcoRadar é um aplicativo Flutter focado em sustentabilidade e preservação ambiental. Ele oferece notícias sobre temas ecológicos armazenadas localmente em SQLite.

## Funcionalidades

- **Notícias Sustentáveis**: Lista de notícias sobre plantas urbanas, reciclagem, energia solar, desmatamento e preservação de áreas verdes, armazenadas offline.
- **Banco de Dados Local**: Integração com SQLite via Drift para persistência de dados.
- **Tratamento de Erros**: Implementação robusta de try-catch para lidar com falhas no carregamento de imagens e dados.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de apps multiplataforma.
- **Dart**: Linguagem de programação.
- **Drift**: ORM para SQLite com geração de código.
- **SQLite**: Banco de dados local.
- **Assets**: Imagens e recursos locais.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de apps multiplataforma.
- **Dart**: Linguagem de programação.
- **Google Maps Flutter**: Para integração de mapas.
- **Sensors Plus**: Para acesso aos sensores do dispositivo.
- **Assets**: Imagens e recursos locais.

## Como Executar

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
- [Dart SDK](https://dart.dev/get-dart) instalado.
- Um editor como VS Code com extensão Flutter.
- Para o mapa: Chave de API do Google Maps (opcional para desenvolvimento local).

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/ADS-ATIVIDADES/EcoRadar.git
   cd EcoRadar
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o app:
   - Para web (recomendado em ambientes headless):
     ```bash
     flutter run -d web-server
     ```
   - Para Linux:
     ```bash
     flutter run -d linux
     ```
   - Para outros dispositivos, use `flutter devices` para listar e `flutter run -d <device>`.

4. Abra no navegador (para web-server): Acesse `http://localhost:45041` (ou a porta indicada no terminal).

## Estrutura do Projeto

```
lib/
├── main.dart                 # Arquivo principal do app (main e EcoradarApp)
├── models/
│   └── news.dart             # Definição da tabela News
├── services/
│   └── database.dart         # AppDatabase com métodos CRUD
└── pages/
    ├── home_page.dart        # HomePage com logo e notícias
    ├── news_list_page.dart   # Lista de notícias do banco
    └── news_detail_page.dart # Detalhes da notícia
```

## Desenvolvimento

O projeto foi refatorado para separar o código em arquivos organizados por responsabilidade: modelos em `models/`, páginas em `pages/`, e o app principal em `main.dart`. Isso melhora a manutenção e escalabilidade.

## Integração com Banco de Dados Local (SQLite)

O app usa o pacote **Drift** para gerenciar SQLite localmente, armazenando notícias offline.

### Como Usar
1. Execute `flutter pub run build_runner build` para gerar código.
2. O banco é criado automaticamente no diretório de dados do app.
3. Use `AppDatabase` para operações: `getAllNews()`, `insertNews()`, etc.

## Próximos Passos (TODO)

- [x] **Integração com APIs de Notícias**: Conectar a APIs externas (ex.: NewsAPI ou APIs ambientais) para buscar notícias em tempo real sobre sustentabilidade.
- [x] **Banco de Dados Local (SQLite)**: Implementar SQLite para salvar notícias localmente, permitindo acesso offline e cache de dados.
- [ ] **Notificações Push**: Adicionar notificações para novas notícias ou alertas ambientais.
- [ ] **Testes Unitários**: Expandir cobertura de testes para todas as funcionalidades.
- [ ] **Integração com APIs Externas**: Buscar notícias de APIs reais em vez de dados hardcoded.

## Licença

Este projeto é para fins educacionais e não possui licença específica.
