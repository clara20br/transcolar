// features/clientes/data/models/cliente_model.dart
class Cliente {
  final int? id;
  final String nome;
  final String telefone;
  final String email;

  Cliente({this.id, required this.nome, required this.telefone, required this.email});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nome: json['nome'],
      telefone: json['telefone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }
}