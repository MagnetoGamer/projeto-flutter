# Instruções de Setup do Git e GitHub

## Pré-requisitos
1. Instalar Git: https://git-scm.com/download/win
2. Instalar GitHub CLI: https://cli.github.com/
3. Instalar Git Flow: https://github.com/nvie/gitflow

## Passos para Configuração

### 1. Inicializar repositório Git
```bash
git init
```

### 2. Configurar Git Flow
```bash
git flow init
```
Durante a inicialização, aceite os valores padrão pressionando Enter para todas as perguntas.

### 3. Adicionar arquivos ao Git
```bash
git add .
git commit -m "Initial commit: Projeto Flutter com arquitetura Hexagonal"
```

### 4. Criar repositório no GitHub
Substitua `seu_usuario` pelo seu usuário do GitHub:
```bash
gh repo create seu_usuario/projeto-flutter --private --source=. --remote=origin
```

### 5. Fazer push inicial
```bash
git push -u origin main
```

### 6. Adicionar colaborador
```bash
gh repo edit --add-collaborator moacyrfc
```

## Alternativa Manual (sem GitHub CLI)

Se não tiver o GitHub CLI instalado:

1. Crie um repositório manualmente no GitHub
2. Adicione o remote:
```bash
git remote add origin https://github.com/seu_usuario/projeto-flutter.git
```
3. Faça o push:
```bash
git push -u origin main
```
4. Adicione o colaborador através da interface web do GitHub (Settings > Collaborators)

