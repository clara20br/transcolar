// lib/features/Clientes/data/service/auth_api_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transcolar_frontend/core/config/api_config.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/endereco_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/estudante_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/responsavel_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/usuario_auth_model.dart';

class AuthApiService {
  final http.Client _client = http.Client();

  String get baseUrl => ApiConfig.baseUrl;

  Future<Map<String, dynamic>> cadastroCompleto({
    required ClienteModel cliente,
    required UsuarioAuthModel usuario,
    required EnderecoModel endereco,
    required List<EstudanteModel> estudantes,
    required List<ResponsavelModel> responsaveis,
  }) async {
    try {
      // 1. Cadastrar cliente
      final clienteResponse = await _client.post(
        Uri.parse('$baseUrl/api/clientes'),
        headers: _getHeaders(),
        body: json.encode(cliente.toJson()),
      );

      if (clienteResponse.statusCode != 200 && clienteResponse.statusCode != 201) {
        throw Exception('Erro ao cadastrar cliente: ${clienteResponse.statusCode}');
      }

      final clienteData = json.decode(clienteResponse.body);
      final clienteId = clienteData['id'];

      // 2. Cadastrar usuário - criar novo objeto com clienteId
      final usuarioComId = UsuarioAuthModel(
        id: usuario.id,
        email: usuario.email,
        senha: usuario.senha,
        clienteId: clienteId,
      );
      
      final usuarioResponse = await _client.post(
        Uri.parse('$baseUrl/api/usuarios'),
        headers: _getHeaders(),
        body: json.encode(usuarioComId.toJson()),
      );

      if (usuarioResponse.statusCode != 200 && usuarioResponse.statusCode != 201) {
        throw Exception('Erro ao cadastrar usuário: ${usuarioResponse.statusCode}');
      }

      // 3. Cadastrar endereço - criar novo objeto com clienteId
      final enderecoComId = EnderecoModel(
        id: endereco.id,
        cep: endereco.cep,
        uf: endereco.uf,
        municipio: endereco.municipio,
        bairro: endereco.bairro,
        logradouro: endereco.logradouro,
        numero: endereco.numero,
        complemento: endereco.complemento,
        clienteId: clienteId,
      );
      
      final enderecoResponse = await _client.post(
        Uri.parse('$baseUrl/api/enderecos'),
        headers: _getHeaders(),
        body: json.encode(enderecoComId.toJson()),
      );

      if (enderecoResponse.statusCode != 200 && enderecoResponse.statusCode != 201) {
        throw Exception('Erro ao cadastrar endereço: ${enderecoResponse.statusCode}');
      }

      // 4. Cadastrar estudantes - criar novos objetos com clienteId
      for (var estudante in estudantes) {
        final estudanteComId = EstudanteModel(
          id: estudante.id,
          nome: estudante.nome,
          cpf: estudante.cpf,
          dataNascimento: estudante.dataNascimento,
          possuiDoenca: estudante.possuiDoenca,
          doencaDescricao: estudante.doencaDescricao,
          clienteId: clienteId,
        );
        
        final estudanteResponse = await _client.post(
          Uri.parse('$baseUrl/api/estudantes'),
          headers: _getHeaders(),
          body: json.encode(estudanteComId.toJson()),
        );

        if (estudanteResponse.statusCode != 200 && estudanteResponse.statusCode != 201) {
          throw Exception('Erro ao cadastrar estudante: ${estudanteResponse.statusCode}');
        }
      }

      // 5. Cadastrar responsáveis - criar novos objetos com clienteId
      for (var responsavel in responsaveis) {
        final responsavelComId = ResponsavelModel(
          id: responsavel.id,
          nome: responsavel.nome,
          cpf: responsavel.cpf,
          email: responsavel.email,
          telefone: responsavel.telefone,
          clienteId: clienteId,
        );
        
        final responsavelResponse = await _client.post(
          Uri.parse('$baseUrl/api/responsaveis'),
          headers: _getHeaders(),
          body: json.encode(responsavelComId.toJson()),
        );

        if (responsavelResponse.statusCode != 200 && responsavelResponse.statusCode != 201) {
          throw Exception('Erro ao cadastrar responsável: ${responsavelResponse.statusCode}');
        }
      }

      return {
        'success': true,
        'clienteId': clienteId,
        'message': 'Cadastro realizado com sucesso!',
      };
    } catch (e) {
      debugPrint('Erro no cadastro completo: $e');
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> login(String email, String senha) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/api/login'),
        headers: _getHeaders(),
        body: json.encode({
          'email': email,
          'senha': senha,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'user': data,
        };
      } else {
        return {
          'success': false,
          'message': 'E-mail ou senha inválidos',
        };
      }
    } catch (e) {
      debugPrint('Erro no login: $e');
      return {
        'success': false,
        'message': 'Erro ao conectar com o servidor',
      };
    }
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  void dispose() {
    _client.close();
  }
}