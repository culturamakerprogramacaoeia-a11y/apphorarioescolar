# Sistema de Controle de Horário Escolar

## Configuração do Firebase

Para que o sistema funcione online (com dados sincronizados entre todos os usuários), siga estes passos:

### 1. Criar Projeto no Firebase
1. Acesse: https://console.firebase.google.com/
2. Clique em "Adicionar projeto"
3. Dê um nome ao projeto (ex: "escola-controle")
4. Desative o Google Analytics (opcional) e clique em "Criar projeto"

### 2. Registrar o App

#### Para Android:
1. Na tela do projeto, clique no ícone do Android
2. Informe o nome do pacote: `com.controlehorario.controle_horario`
3. Opcional: SHA-1 (para produção)
4. Clique em "Registrar app"

#### Para Web:
1. Clique no ícone Web (</>)
2. Dê um apelido ao app
3. Copie o código de configuração
4. Clique em "Registrar"

### 3. Baixar Arquivos de Configuração

- **Android**: Baixe `google-services.json` e cole na pasta `android/app/`
- **Web**: Copie o código de configuração

### 4. Configurar o App

No Firebase Console:
1. Vá em Authentication > Método de login
2. Ative "Email/Senha"

No Cloud Firestore:
1. Vá em Firestore Database
2. Clique "Criar banco de dados"
3. Selecione "Iniciar no modo de teste"
4. Escolha a localização

### 5. Instalar Dependências

No terminal, na pasta do projeto:

```bash
flutter pub get
```

### 6. Rodar o App

```bash
flutter run
```

## Funcionalidades Implementadas

### Administrador
- [x] Dashboard com estatísticas
- [x] Cadastro de professores (com disciplina, horário, dias de aula)
- [x] Cadastro de alunos (individual e via CSV)
- [x] Gerenciamento de turmas
- [x] Lista de usuários com códigos

### Professor
- [x] Dashboard pessoal
- [x] Cadastro de aulas (disciplina, turma, horário, sala, livro)
- [x] Lançar tarefas para turmas
- [x] Notificações aos alunos

### Aluno
- [x] Dashboard com aulas do dia
- [x] Ver livro/material necessário
- [x] Ver tarefas pendentes
- [x] Receber notificações

### Sistema
- [x] Login por email/senha
- [x] Geração automática de códigos
- [x] Notificações em tempo real
- [x] Importação de alunos via CSV

## Para Teste Local (sem Firebase)

Se quiser testar sem configurar Firebase, as telas básicas funcionam.

## Estrutura do Projeto

```
lib/
├── main.dart
├── models/
│   ├── usuario.dart
│   └── aula.dart
├── services/
│   └── firebase_service.dart
└── screens/
    ├── splash_screen.dart
    ├── login_screen.dart
    └── dashboard/
        ├── admin/
        ├── professor/
        └── aluno/
```
