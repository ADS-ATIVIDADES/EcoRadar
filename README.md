# EcoRadar

EcoRadar é um aplicativo Flutter focado em sustentabilidade e preservação ambiental. Ele oferece notícias sobre temas ecológicos, um mapa interativo para explorar locais relacionados ao meio ambiente e monitoramento de sensores do dispositivo para promover conscientização sobre o impacto ambiental.

## Funcionalidades

- **Notícias Sustentáveis**: Lista de notícias sobre plantas urbanas, reciclagem, energia solar, desmatamento e preservação de áreas verdes.
- **Mapa Interativo**: Integração com Google Maps para visualizar locais de interesse ambiental (inicialmente focado em São Paulo, Brasil).
- **Monitoramento de Acelerômetro**: Exibe dados em tempo real do acelerômetro do dispositivo (X, Y, Z) para demonstrar interação com sensores.
- **Tratamento de Erros**: Implementação robusta de try-catch para lidar com falhas no carregamento de imagens e dados.
- **Interface Responsiva**: Design limpo com Material Design, ícones ecológicos e navegação intuitiva.

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
├── main.dart                 # Arquivo principal do app
├── Parte_1_APP.dart          # Versão inicial básica
├── Parte_2_APP.dart          # Adiciona logo e dados estruturados
├── Parte_3_APP_MAPS.dart     # Integra mapa
├── Parte_4_APP_ACELEROMETROS.dart  # Adiciona acelerômetro
└── Parte_5_APP_EXCEÇÕES.dart      # Adiciona tratamento de erros

assets/
└── images/
    └── ecoradar.PNG          # Logo do app

pubspec.yaml                  # Configurações e dependências
README.md                     # Este arquivo
```

## Desenvolvimento

O projeto evoluiu em etapas:
- **Parte 1**: Navegação básica com títulos de notícias.
- **Parte 2**: UI aprimorada com logo e conteúdo completo.
- **Parte 3**: Integração de mapa.
- **Parte 4**: Monitoramento de sensores.
- **Parte 5**: Tratamento de exceções para robustez.

## Próximos Passos (TODO)

- [ ] **Integração com APIs de Notícias**: Conectar a APIs externas (ex.: NewsAPI ou APIs ambientais) para buscar notícias em tempo real sobre sustentabilidade.
- [ ] **Banco de Dados Local (SQLite)**: Implementar SQLite para salvar notícias localmente, permitindo acesso offline e cache de dados.
- [ ] **Notificações Push**: Adicionar notificações para novas notícias ou alertas ambientais.
- [ ] **Testes Unitários**: Expandir cobertura de testes para todas as funcionalidades.

## Licença

Este projeto é para fins educacionais e não possui licença específica.
