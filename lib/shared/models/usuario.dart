enum TipoUsuario { administrador, professor, aluno }

class Usuario {
  int id;
  final String nome;
  final String email;
  final String matricula;
  final String codigo;
  final String senha;
  final TipoUsuario tipo;
  final DateTime criadoEm;
  bool ativo;
  String? fotoUrl;
  Map<String, dynamic>? dadosEspecificos;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.matricula,
    required this.codigo,
    required this.senha,
    required this.tipo,
    required this.criadoEm,
    this.ativo = true,
    this.fotoUrl,
    this.dadosEspecificos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'matricula': matricula,
      'codigo': codigo,
      'senha': senha,
      'tipo': tipo.index,
      'criadoEm': criadoEm.toIso8601String(),
      'ativo': ativo,
      'fotoUrl': fotoUrl,
      'dadosEspecificos': dadosEspecificos,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      matricula: map['matricula'] ?? '',
      codigo: map['codigo'] ?? '',
      senha: map['senha'] ?? '',
      tipo: TipoUsuario.values[map['tipo'] ?? 0],
      criadoEm: DateTime.parse(map['criadoEm'] ?? DateTime.now().toIso8601String()),
      ativo: map['ativo'] ?? true,
      fotoUrl: map['fotoUrl'],
      dadosEspecificos: map['dadosEspecificos'] != null ? Map<String, dynamic>.from(map['dadosEspecificos']) : null,
    );
  }

  bool get isAdmin => tipo == TipoUsuario.administrador;
  bool get isProfessor => tipo == TipoUsuario.professor;
  bool get isAluno => tipo == TipoUsuario.aluno;
}

class ProfessorDados {
  final String disciplina;
  final List<String> diasAula;
  final String horarioEntrada;
  final String horarioSaida;
  final String? diaPlanejamento;
  List<String> turmas;
  final String? livroAtual;
  List<String> livrosDidaticos;

  ProfessorDados({
    required this.disciplina,
    required this.diasAula,
    required this.horarioEntrada,
    required this.horarioSaida,
    this.diaPlanejamento,
    this.turmas = const [],
    this.livroAtual,
    this.livrosDidaticos = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'disciplina': disciplina,
      'diasAula': diasAula,
      'horarioEntrada': horarioEntrada,
      'horarioSaida': horarioSaida,
      'diaPlanejamento': diaPlanejamento,
      'turmas': turmas,
      'livroAtual': livroAtual,
      'livrosDidaticos': livrosDidaticos,
    };
  }

  factory ProfessorDados.fromMap(Map<String, dynamic> map) {
    return ProfessorDados(
      disciplina: map['disciplina'] ?? '',
      diasAula: List<String>.from(map['diasAula'] ?? []),
      horarioEntrada: map['horarioEntrada'] ?? '',
      horarioSaida: map['horarioSaida'] ?? '',
      diaPlanejamento: map['diaPlanejamento'],
      turmas: List<String>.from(map['turmas'] ?? []),
      livroAtual: map['livroAtual'],
      livrosDidaticos: List<String>.from(map['livrosDidaticos'] ?? []),
    );
  }
}

class AlunoDados {
  final String turma;
  final int ano;
  List<String> disciplinas;
  final String? codigoResponsavel;
  List<String> alergias;
  final String? observacoes;

  AlunoDados({
    required this.turma,
    required this.ano,
    this.disciplinas = const [],
    this.codigoResponsavel,
    this.alergias = const [],
    this.observacoes,
  });

  Map<String, dynamic> toMap() {
    return {
      'turma': turma,
      'ano': ano,
      'disciplinas': disciplinas,
      'codigoResponsavel': codigoResponsavel,
      'alergias': alergias,
      'observacoes': observacoes,
    };
  }

  factory AlunoDados.fromMap(Map<String, dynamic> map) {
    return AlunoDados(
      turma: map['turma'] ?? '',
      ano: map['ano'] ?? DateTime.now().year,
      disciplinas: List<String>.from(map['disciplinas'] ?? []),
      codigoResponsavel: map['codigoResponsavel'],
      alergias: List<String>.from(map['alergias'] ?? []),
      observacoes: map['observacoes'],
    );
  }
}
