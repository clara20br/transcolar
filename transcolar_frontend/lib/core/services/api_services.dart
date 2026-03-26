// core/services/api_services.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api';
  final http.Client _client = http.Client();

  Future<List<ClienteModel>> getClientes() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/clientes'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ClienteModel.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao carregar clientes: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro na requisição: $e');
      // Dados mockados para teste
      return _getMockClientes();
    }
  }

  Future<ClienteModel> createCliente(ClienteModel cliente) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/clientes'),
        headers: _getHeaders(),
        body: json.encode(cliente.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ClienteModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro ao criar cliente: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao criar cliente: $e');
      return cliente.copyWith(id: DateTime.now().millisecondsSinceEpoch);
    }
  }

  Future<ClienteModel> updateCliente(ClienteModel cliente) async {
    try {
      final response = await _client.put(
        Uri.parse('$baseUrl/clientes/${cliente.id}'),
        headers: _getHeaders(),
        body: json.encode(cliente.toJson()),
      );

      if (response.statusCode == 200) {
        return ClienteModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro ao atualizar cliente: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao atualizar cliente: $e');
      return cliente;
    }
  }

  Future<void> deleteCliente(int id) async {
    try {
      final response = await _client.delete(
        Uri.parse('$baseUrl/clientes/$id'),
        headers: _getHeaders(),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Erro ao excluir cliente: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao excluir cliente: $e');
      throw Exception('Erro ao excluir cliente: $e');
    }
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  List<ClienteModel> _getMockClientes() {
    return [
      ClienteModel(
        id: 1,
        nome: 'João Silva',
        cpfCnpj: '12345678901',
        email: 'joao@email.com',
        telefone: '(11) 1234-5678',
        celular: '(11) 91234-5678',
        endereco: 'Rua das Flores',
        numero: '123',
        bairro: 'Centro',
        cidade: 'São Paulo',
        uf: 'SP',
        cep: '01234-567',
        ativo: true,
      ),
      ClienteModel(
        id: 2,
        nome: 'Maria Santos',
        cpfCnpj: '98765432100',
        email: 'maria@email.com',
        telefone: '(11) 8765-4321',
        celular: '(11) 98765-4321',
        endereco: 'Av. Principal',
        numero: '456',
        bairro: 'Jardim',
        cidade: 'São Paulo',
        uf: 'SP',
        cep: '98765-432',
        ativo: true,
      ),
    ];
  }

  void dispose() {
    _client.close();
  }
}