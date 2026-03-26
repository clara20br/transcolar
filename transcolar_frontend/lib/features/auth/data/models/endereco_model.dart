// lib/features/auth/data/models/endereco_model.dart
class EnderecoModel {
  final int? id;
  final String cep;
  final String uf;
  final String municipio;
  final String bairro;
  final String logradouro;
  final String numero;
  final String? complemento;
  final int clienteId;

  EnderecoModel({
    this.id,
    required this.cep,
    required this.uf,
    required this.municipio,
    required this.bairro,
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.clienteId,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
      id: json['id'],
      cep: json['cep'],
      uf: json['uf'],
      municipio: json['municipio'],
      bairro: json['bairro'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      complemento: json['complemento'],
      clienteId: json['clienteId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cep': cep,
      'uf': uf,
      'municipio': municipio,
      'bairro': bairro,
      'logradouro': logradouro,
      'numero': numero,
      if (complemento != null) 'complemento': complemento,
      'clienteId': clienteId,
    };
  }
}