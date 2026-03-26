// lib/features/auth/data/models/responsavel_model.dart
class ResponsavelModel {
  final int? id;
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final int clienteId; // Relacionamento com o cliente principal

  ResponsavelModel({
    this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.clienteId,
  });

  factory ResponsavelModel.fromJson(Map<String, dynamic> json) {
    return ResponsavelModel(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      telefone: json['telefone'],
      clienteId: json['clienteId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
      'clienteId': clienteId,
    };
  }
}