// lib/features/Clientes/data/models/estudante_model.dart
class EstudanteModel {
  final int? id;
  final String nome;
  final String cpf;
  final String dataNascimento;
  final String? escola;
  final String? turno;
  final String? problema;
  final bool possuiDoenca;
  final String? doencaDescricao;
  final int? clienteId;

  EstudanteModel({
    this.id,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    this.escola,
    this.turno,
    this.problema,
    this.possuiDoenca = false,
    this.doencaDescricao,
    this.clienteId,
  });

  factory EstudanteModel.fromJson(Map<String, dynamic> json) {
    return EstudanteModel(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      dataNascimento: json['dataNascimento'] ?? '',
      escola: json['escola'],
      turno: json['turno'],
      problema: json['problema'],
      possuiDoenca: json['possuiDoenca'] ?? false,
      doencaDescricao: json['doencaDescricao'],
      clienteId: json['clienteId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
      if (escola != null) 'escola': escola,
      if (turno != null) 'turno': turno,
      if (problema != null) 'problema': problema,
      'possuiDoenca': possuiDoenca,
      if (doencaDescricao != null) 'doencaDescricao': doencaDescricao,
      if (clienteId != null) 'clienteId': clienteId,
    };
  }
}