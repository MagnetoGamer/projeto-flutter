# Projeto Flutter - Arquitetura Hexagonal

## 📋 Descrição do Projeto

Este projeto é uma aplicação Flutter desenvolvida utilizando a arquitetura Hexagonal (também conhecida como Ports and Adapters), que promove a separação de responsabilidades e facilita a testabilidade e manutenibilidade do código.

A aplicação permite gerenciar personagens e filmes, além de oferecer funcionalidades de chat em tempo real. O projeto foi desenvolvido seguindo os princípios SOLID e Clean Architecture.

## 🏗️ Arquitetura

O projeto utiliza a arquitetura Hexagonal, dividida em três camadas principais:

- **Domain (Domínio)**: Contém as entidades, repositórios (interfaces) e casos de uso. É a camada mais interna e não depende de nenhuma outra camada.
- **Infrastructure (Infraestrutura)**: Implementa os repositórios definidos no domínio, contém os data sources (APIs remotas e armazenamento local) e os mappers.
- **Application (Aplicação)**: Contém os providers (gerenciamento de estado) e serviços da aplicação.

## 📦 Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento multiplataforma
- **GoRouter**: Roteamento declarativo e type-safe
- **Provider**: Gerenciamento de estado reativo
- **GetIt**: Injeção de dependências
- **HTTP**: Cliente HTTP para requisições de API
- **SharedPreferences**: Armazenamento local de dados

## 📱 Requisitos Funcionais

### RF01 - Autenticação de Usuário
O sistema deve permitir que usuários façam login na aplicação para acessar as funcionalidades.

### RF02 - Listagem de Personagens
O sistema deve exibir uma lista de personagens com informações básicas (nome, foto, descrição).

### RF03 - Detalhes de Personagem
O sistema deve exibir informações detalhadas de um personagem selecionado, incluindo histórico, características e filmes relacionados.

### RF04 - Listagem de Filmes
O sistema deve exibir uma lista de filmes com informações básicas (título, poster, ano de lançamento).

### RF05 - Detalhes de Filme
O sistema deve exibir informações detalhadas de um filme selecionado, incluindo sinopse, elenco e avaliações.

### RF06 - Chat em Tempo Real
O sistema deve permitir que usuários enviem e recebam mensagens de chat em tempo real.

### RF07 - Histórico de Chat
O sistema deve armazenar e exibir o histórico de mensagens do chat.

## 📖 Histórias de Usuário

### HU01 - Como usuário, eu quero fazer login na aplicação
**Critérios de Aceite:**
- Deve existir uma tela de login com campos de email e senha
- Deve validar os campos antes de permitir o login
- Deve exibir mensagens de erro apropriadas
- Após login bem-sucedido, deve redirecionar para a tela inicial

### HU02 - Como usuário, eu quero visualizar uma lista de personagens
**Critérios de Aceite:**
- Deve exibir uma lista scrollável de personagens
- Cada personagem deve mostrar nome e foto
- Deve permitir busca/filtro de personagens
- Ao clicar em um personagem, deve navegar para a tela de detalhes

### HU03 - Como usuário, eu quero visualizar detalhes de um personagem
**Critérios de Aceite:**
- Deve exibir informações completas do personagem
- Deve mostrar filmes relacionados ao personagem
- Deve permitir navegação para detalhes dos filmes relacionados
- Deve ter botão para voltar à lista

### HU04 - Como usuário, eu quero visualizar uma lista de filmes
**Critérios de Aceite:**
- Deve exibir uma lista scrollável de filmes
- Cada filme deve mostrar título, poster e ano
- Deve permitir busca/filtro de filmes
- Ao clicar em um filme, deve navegar para a tela de detalhes

### HU05 - Como usuário, eu quero visualizar detalhes de um filme
**Critérios de Aceite:**
- Deve exibir informações completas do filme (sinopse, diretor, elenco)
- Deve mostrar personagens relacionados ao filme
- Deve permitir navegação para detalhes dos personagens relacionados
- Deve ter botão para voltar à lista

### HU06 - Como usuário, eu quero enviar mensagens no chat
**Critérios de Aceite:**
- Deve ter uma interface de chat intuitiva
- Deve permitir digitar e enviar mensagens
- Deve exibir minhas mensagens de forma diferenciada das outras
- Deve atualizar a interface em tempo real

### HU07 - Como usuário, eu quero visualizar o histórico de mensagens
**Critérios de Aceite:**
- Deve carregar mensagens anteriores ao abrir o chat
- Deve manter as mensagens mesmo após fechar e reabrir o chat
- Deve exibir timestamp das mensagens
- Deve manter scroll automático para a última mensagem

## 🚀 Como Executar

1. Certifique-se de ter o Flutter instalado (SDK >=3.0.0)
2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o projeto:
```bash
flutter run
```

## 📁 Estrutura do Projeto

```
lib/
├── core/              # Configurações e utilitários centrais
├── domain/            # Camada de domínio (entidades, repositórios, use cases)
├── infrastructure/    # Camada de infraestrutura (implementações, APIs, mappers)
├── application/       # Camada de aplicação (providers, serviços)
├── pages/             # Páginas da aplicação
├── routes/            # Configuração de rotas
└── main.dart          # Ponto de entrada da aplicação
```

## 👥 Contribuidores

- Desenvolvido como projeto de estudo em arquitetura Hexagonal

## 📄 Licença

Este projeto é de uso educacional.

