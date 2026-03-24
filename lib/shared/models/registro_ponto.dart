class RegistroPonto {
  int id;
  final int usuarioId;
  final DateTime dataHora;
  final bool isEntrada;

  RegistroPonto({
    required this.id,
    required this.usuarioId,
    required this.dataHora,
    required this.isEntrada,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'dataHora': dataHora.toIso8601String(),
      'isEntrada': isEntrada,
    };
  }

  factory RegistroPonto.fromMap(Map<String, dynamic> map) {
    return RegistroPonto(
      id: map['id'] ?? 0,
      usuarioId: map['usuarioId'] ?? 0,
      dataHora: DateTime.parse(map['dataHora'] ?? DateTime.now().toIso8601String()),
      isEntrada: map['isEntrada'] ?? true,
    );
  }
}
