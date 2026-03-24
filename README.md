# Sistema de Controle de Horário Escolar

Sistema em Flutter para gestão de escolas com 300+ alunos e 30+ professores.

## Funcionalidades

### Administrador
- Dashboard com estatísticas
- Cadastro de professores e alunos
- Gestão de horários e disciplinas
- Gerenciamento de faltas e observações

### Professor
- Ver suas aulas agendadas
- Postar tarefas para turmas
- Enviar recados/observações
- Lembretes de aulas (10 e 5 minutos antes)

### Aluno
- Ver aulas do dia
- Ver tarefas pendentes
- Receber recados dos professores
- Lembretes de aulas

## Login Padrão
- Código: `COD-1000`
- Senha: `admin123`

## Como Rodar

### Desktop (Chrome)
```bash
flutter pub get
flutter run -d chrome
```

### Build Web
```bash
flutter build web
```

### Build APK
```bash
flutter build apk --release
```

## Deploy no Vercel

1. Fazer push para GitHub
2. Importar projeto no Vercel
3. Build command: `flutter build web`
4. Output directory: `build/web`

## Estrutura do Projeto

```
lib/
├── main.dart
├── models/
│   ├── usuario.dart
│   ├── aula.dart
│   ├── falta.dart
│   └── observacao.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   └── dashboard/
│       ├── admin/
│       ├── professor/
│       └── aluno/
└── services/
    └── database_service.dart
```
