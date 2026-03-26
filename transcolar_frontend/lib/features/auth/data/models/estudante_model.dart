// lib/features/auth/data/models/estudante_model.dart
class EstudanteModel {
  final int? id;
  final String nome;
  final String cpf;
  final DateTime dataNascimento;
  final bool possuiDoenca;
  final String? doencaDescricao;
  final int clienteId; // Relacionamento com o cliente/responsável

  EstudanteModel({
    this.id,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.possuiDoenca,
    this.doencaDescricao,
    required this.clienteId,
  });

  factory EstudanteModel.fromJson(Map<String, dynamic> json) {
    return EstudanteModel(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      dataNascimento: DateTime.parse(json['dataNascimento']),
      possuiDoenca: json['possuiDoenca'],
      doencaDescricao: json['doencaDescricao'],
      clienteId: json['clienteId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento.toIso8601String(),
      'possuiDoenca': possuiDoenca,
      if (doencaDescricao != null) 'doencaDescricao': doencaDescricao,
      'clienteId': clienteId,
    };
  }
}