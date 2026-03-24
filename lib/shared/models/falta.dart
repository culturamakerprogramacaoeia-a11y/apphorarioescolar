class Falta {
  int id;
  final int alunoId;
  final int aulaId;
  final DateTime data;
  bool justificada;
  String? observacao;

  Falta({
    required this.id,
    required this.alunoId,
    required this.aulaId,
    required this.data,
    this.justificada = false,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alunoId': alunoId,
      'aulaId': aulaId,
      'data': data.toIso8601String(),
      'justificada': justificada,
      'observacao': observacao,
    };
  }

  factory Falta.fromMap(Map<String, dynamic> map) {
    return Falta(
      id: map['id'] ?? 0,
      alunoId: map['alunoId'] ?? 0,
      aulaId: map['aulaId'] ?? 0,
      data: DateTime.parse(map['data'] ?? DateTime.now().toIso8601String()),
      justificada: map['justificada'] ?? false,
      observacao: map['observacao'],
    );
  }
}
