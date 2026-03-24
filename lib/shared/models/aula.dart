class Aula {
  int id;
  final int professorId;
  final String disciplina;
  final String turma;
  final String diaSemana;
  final String horarioInicio;
  final String horarioFim;
  final String? livroMaterial;
  final String? sala;
  final String? observacoes;
  final DateTime criadoEm;

  Aula({
    required this.id,
    required this.professorId,
    required this.disciplina,
    required this.turma,
    required this.diaSemana,
    required this.horarioInicio,
    required this.horarioFim,
    this.livroMaterial,
    this.sala,
    this.observacoes,
    required this.criadoEm,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'professorId': professorId,
      'disciplina': disciplina,
      'turma': turma,
      'diaSemana': diaSemana,
      'horarioInicio': horarioInicio,
      'horarioFim': horarioFim,
      'livroMaterial': livroMaterial,
      'sala': sala,
      'observacoes': observacoes,
      'criadoEm': criadoEm.toIso8601String(),
    };
  }

  factory Aula.fromMap(Map<String, dynamic> map) {
    return Aula(
      id: map['id'] ?? 0,
      professorId: map['professorId'] ?? 0,
      disciplina: map['disciplina'] ?? '',
      turma: map['turma'] ?? '',
      diaSemana: map['diaSemana'] ?? '',
      horarioInicio: map['horarioInicio'] ?? '',
      horarioFim: map['horarioFim'] ?? '',
      livroMaterial: map['livroMaterial'],
      sala: map['sala'],
      observacoes: map['observacoes'],
      criadoEm: DateTime.parse(map['criadoEm'] ?? DateTime.now().toIso8601String()),
    );
  }
}

class Tarefa {
  int id;
  final int professorId;
  final String disciplina;
  final String turma;
  final String descricao;
  final DateTime dataPublicacao;
  final DateTime? dataEntrega;
  final String? arquivoUrl;
  bool ativo;

  Tarefa({
    required this.id,
    required this.professorId,
    required this.disciplina,
    required this.turma,
    required this.descricao,
    required this.dataPublicacao,
    this.dataEntrega,
    this.arquivoUrl,
    this.ativo = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'professorId': professorId,
      'disciplina': disciplina,
      'turma': turma,
      'descricao': descricao,
      'dataPublicacao': dataPublicacao.toIso8601String(),
      'dataEntrega': dataEntrega?.toIso8601String(),
      'arquivoUrl': arquivoUrl,
      'ativo': ativo,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'] ?? 0,
      professorId: map['professorId'] ?? 0,
      disciplina: map['disciplina'] ?? '',
      turma: map['turma'] ?? '',
      descricao: map['descricao'] ?? '',
      dataPublicacao: DateTime.parse(map['dataPublicacao'] ?? DateTime.now().toIso8601String()),
      dataEntrega: map['dataEntrega'] != null ? DateTime.parse(map['dataEntrega']) : null,
      arquivoUrl: map['arquivoUrl'],
      ativo: map['ativo'] ?? true,
    );
  }
}
