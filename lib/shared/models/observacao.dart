class Observacao {
  int id;
  final int remetenteId;
  final int? destinatarioId; // Se nulo, pode ser um aviso geral ou para turma
  final String? turma;       // Usado caso a mensagem seja para uma turma inteira
  final String conteudo;
  final DateTime dataEnvio;
  bool visualizada;

  Observacao({
    required this.id,
    required this.remetenteId,
    this.destinatarioId,
    this.turma,
    required this.conteudo,
    required this.dataEnvio,
    this.visualizada = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remetenteId': remetenteId,
      'destinatarioId': destinatarioId,
      'turma': turma,
      'conteudo': conteudo,
      'dataEnvio': dataEnvio.toIso8601String(),
      'visualizada': visualizada,
    };
  }

  factory Observacao.fromMap(Map<String, dynamic> map) {
    return Observacao(
      id: map['id'] ?? 0,
      remetenteId: map['remetenteId'] ?? 0,
      destinatarioId: map['destinatarioId'],
      turma: map['turma'],
      conteudo: map['conteudo'] ?? '',
      dataEnvio: DateTime.parse(map['dataEnvio'] ?? DateTime.now().toIso8601String()),
      visualizada: map['visualizada'] ?? false,
    );
  }
}
