# Rick and Morty Dex

Rick and Morty Dex é um aplicativo Flutter para consulta de personagens da série Rick and Morty. Ele permite visualizar informações básicas dos personagens, como nome, imagem e detalhes adicionais.

## Funcionalidades

- Listagem de personagens da série Rick and Morty.
- Visualização dos detalhes de cada personagem.
- Funcionalidade de busca rápida dos personagens.
- Interface simples e intuitiva.

## Tecnologias Utilizadas

- Flutter
- Dart
- MobX (para gerenciamento de estado)
- API pública Rick and Morty (https://rickandmortyapi.com/)

## Como executar o projeto

### Pré-requisitos

- Flutter na versão 3.29.0

### Passos

1. Clone o repositório:

   ```bash
   git clone https://github.com/silva-luiz/rick_and_morty_dex.git
   cd rick_and_morty_dex
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Rode o aplicativo (exemplo para Android):
   ```bash
   flutter run
   ```

## Estrutura do projeto

O projeto está estruturado na arquitetura MVVM, contendo as seguintes camadas:

## Estrutura do projeto

- `lib/` – código principal do aplicativo Flutter
- `lib/app/` – contém o `AppWidget` e a configuração principal do app
- `lib/app/core/http/` – camada HTTP, onde está localizado o `DioClient` para requisições e logs
- `lib/app/modules/` – camada onde estão os módulos, organizados da seguinte forma:
  - `home/model/` – modelos de dados específicos do módulo Home
  - `home/repository/` – camada de repositório para acesso a dados do módulo Home
  - `home/view/` – telas e widgets visuais do módulo Home
  - `home/viewmodel/` – lógica e gerenciamento de estado do módulo Home usando o MobX
  - `shared/colors/` – definições das cores do aplicativo
  - `shared/extensions/` – extensões utilizadas no projeto
  - `shared/widgets/` – widgets reutilizáveis e componentes compartilhados

## Bônus

O App possui um 'Easter Egg' na tela inicial.

## Licença

Este projeto está licenciado sob a licença MIT.

---

**Luiz Silva**

---
