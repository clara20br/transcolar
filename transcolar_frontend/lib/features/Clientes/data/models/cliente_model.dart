
class ClienteModel {
  final int? id;
  final String nome;
  final String cpfCnpj;
  final String email;
  final String telefone;
  final String? celular;
  final String? endereco;
  final String? numero;
  final String? complemento;
  final String? bairro;
  final String? cidade;
  final String? uf;
  final String? cep;
  final bool ativo;
  final DateTime? dataCadastro;

  ClienteModel({
    this.id,
    required this.nome,
    required this.cpfCnpj,
    required this.email,
    required this.telefone,
    this.celular,
    this.endereco,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.uf,
    this.cep,
    this.ativo = true,
    this.dataCadastro,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) {
    return ClienteModel(
      id: json['id'],
      nome: json['nome'] ?? '',
      cpfCnpj: json['cpfCnpj'] ?? '',
      email: json['email'] ?? '',
      telefone: json['telefone'] ?? '',
      celular: json['celular'],
      endereco: json['endereco'],
      numero: json['numero'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      uf: json['uf'],
      cep: json['cep'],
      ativo: json['ativo'] ?? true,
      dataCadastro: json['dataCadastro'] != null
          ? DateTime.parse(json['dataCadastro'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'cpfCnpj': cpfCnpj,
      'email': email,
      'telefone': telefone,
      if (celular != null) 'celular': celular,
      if (endereco != null) 'endereco': endereco,
      if (numero != null) 'numero': numero,
      if (complemento != null) 'complemento': complemento,
      if (bairro != null) 'bairro': bairro,
      if (cidade != null) 'cidade': cidade,
      if (uf != null) 'uf': uf,
      if (cep != null) 'cep': cep,
      'ativo': ativo,
      if (dataCadastro != null) 'dataCadastro': dataCadastro!.toIso8601String(),
    };
  }

  ClienteModel copyWith({
    int? id,
    String? nome,
    String? cpfCnpj,
    String? email,
    String? telefone,
    String? celular,
    String? endereco,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? uf,
    String? cep,
    bool? ativo,
    DateTime? dataCadastro,
  }) {
    return ClienteModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      celular: celular ?? this.celular,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      uf: uf ?? this.uf,
      cep: cep ?? this.cep,
      ativo: ativo ?? this.ativo,
      dataCadastro: dataCadastro ?? this.dataCadastro,
    );
  }
}