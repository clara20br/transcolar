// lib/features/Clientes/data/models/usuario_auth_model.dart
class UsuarioAuthModel {
  final int? id;
  final String email;
  final String senha;
  final int clienteId;

  UsuarioAuthModel({
    this.id,
    required this.email,
    required this.senha,
    required this.clienteId,
  });

  factory UsuarioAuthModel.fromJson(Map<String, dynamic> json) {
    return UsuarioAuthModel(
      id: json['id'],
      email: json['email'],
      senha: json['senha'],
      clienteId: json['clienteId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'senha': senha,
      'clienteId': clienteId,
    };
  }
}