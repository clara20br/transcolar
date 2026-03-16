// 📁 core/services/api_service.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform, SocketException;
import 'dart:math';

// import 'package:transcolar_frontend/features/estudantes/data/models/estudante_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';
class ApiService {
  final http.Client client = http.Client();

  // ==================== URL BASE ====================
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8080/api'; // Web
    } else if (Platform.isAndroid && kDebugMode) {
      return 'http://10.0.2.2:8080/api'; // Android emulator
    } else if (Platform.isIOS && kDebugMode) {
      return 'http://localhost:8080/api'; // iOS simulator
    } else {
      return 'http://localhost:8080/api'; // Produção
    }
  }

  // ==================== HEADERS ====================
  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // ==================== TRATAMENTO DE RESPOSTA ====================
  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) return null;
      return json.decode(response.body);
    } else {
      final errorMessage = _getErrorMessage(statusCode, response.body);
      throw Exception(errorMessage);
    }
  }

  String _getErrorMessage(int statusCode, String responseBody) {
    try {
      final errorJson = json.decode(responseBody);
      return errorJson['message'] ??
          errorJson['error'] ??
          _getDefaultErrorMessage(statusCode);
    } catch (_) {
      return _getDefaultErrorMessage(statusCode);
    }
  }

  String _getDefaultErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Requisição inválida';
      case 401:
        return 'Não autorizado';
      case 403:
        return 'Acesso proibido';
      case 404:
        return 'Recurso não encontrado';
      case 409:
        return 'Conflito de dados';
      case 422:
        return 'Dados inválidos';
      case 500:
        return 'Erro interno do servidor';
      case 502:
      case 503:
      case 504:
        return 'Servidor temporariamente indisponível';
      default:
        return 'Falha na requisição: $statusCode';
    }
  }

  // ==================== CORE REQUEST ====================
  Future<dynamic> _makeRequest(Future<http.Response> Function() request) async {
    int attempts = 0;
    const int maxAttempts = 3;

    final mensagens = [
      '🚌 Localizando o ônibus escolar...',
      '🎒 Preparando a lista de estudantes...',
      '📍 Calculando as melhores rotas...',
      '👨‍🏫 Organizando os motoristas...',
      '📋 Carregando informações de transporte...',
      '🛣️ Traçando o caminho até a escola...',
      '⏰ Verificando horários das viagens...',
      '🚍 O transporte escolar está chegando...',
      '📱 Sincronizando dados do Transcolar...',
      '🌟 Preparando seu painel de controle...',
    ];

    while (attempts < maxAttempts) {
      attempts++;

      try {
        if (kDebugMode) {
          final mensagem = mensagens[Random().nextInt(mensagens.length)];
          print('📡 Tentativa $attempts de $maxAttempts');
          print('   $mensagem');
        }

        final timeout = Duration(
          seconds: attempts == 1 ? 30 : attempts == 2 ? 45 : 60,
        );

        final response = await request().timeout(timeout);
        return _handleResponse(response);
        
      } on TimeoutException {
        if (attempts < maxAttempts) {
          if (kDebugMode) {
            print('⏱️ Demorou demais... tentando novamente em ${attempts * 2}s');
          }
          await Future.delayed(Duration(seconds: attempts * 2));
          continue;
        }
        throw Exception(
          '⏰ O servidor está demorando para responder.\n'
          'Verifique se o backend está rodando em: $baseUrl',
        );
      } on SocketException {
        throw Exception('📡 Sem conexão com a internet.\n'
            'Verifique sua rede e tente novamente.');
      } catch (e) {
        throw Exception('Erro inesperado: $e');
      }
    }

    throw Exception('Falha após $maxAttempts tentativas.');
  }

  // ==================== CLIENTES (PAIS/RESPONSÁVEIS) ====================
 Future<List<Cliente>> getClientes() async { 
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/clientes'), headers: headers),
    );
    return (data as List).map((json) => Cliente.fromJson(json)).toList();
  }

  Future<Cliente> getCliente(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/clientes/$id'), headers: headers),
    );
    return Cliente.fromJson(data);
  }

  Future<Cliente> createCliente(Cliente cliente) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/clientes'),
        headers: headers,
        body: json.encode(cliente.toJson()),
      ),
    );

    return Cliente.fromJson(data);
  }

  Future<Cliente> updateCliente(Cliente cliente) async {
    if (cliente.id == null) {
      throw Exception('ID do cliente não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/clientes/${cliente.id}'),
        headers: headers,
        body: json.encode(cliente.toJson()),
      ),
    );
    return Cliente.fromJson(data);
  }

  Future<void> deleteCliente(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/clientes/$id'), headers: headers),
    );
  }
/*
  // ==================== ESTUDANTES ====================
  Future<List<Estudante>> getEstudantes() async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/estudantes'), headers: headers),
    );
    return (data as List).map((json) => Estudante.fromJson(json)).toList();
  }

  Future<List<Estudante>> getEstudantesByCliente(int clienteId) async {
    final data = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/clientes/$clienteId/estudantes'),
        headers: headers,
      ),
    );
    return (data as List).map((json) => Estudante.fromJson(json)).toList();
  }

  Future<Estudante> getEstudante(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/estudantes/$id'), headers: headers),
    );
    return Estudante.fromJson(data);
  }

  Future<Estudante> createEstudante(Estudante estudante) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/estudantes'),
        headers: headers,
        body: json.encode(estudante.toJson()),
      ),
    );
    return Estudante.fromJson(data);
  }

  Future<Estudante> updateEstudante(Estudante estudante) async {
    if (estudante.id == null) {
      throw Exception('ID do estudante não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/estudantes/${estudante.id}'),
        headers: headers,
        body: json.encode(estudante.toJson()),
      ),
    );
    return Estudante.fromJson(data);
  }

  Future<void> deleteEstudante(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/estudantes/$id'), headers: headers),
    );
  }


  

  // ==================== MOTORISTAS ====================
  Future<List<Motorista>> getMotoristas() async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/motoristas'), headers: headers),
    );
    return (data as List).map((json) => Motorista.fromJson(json)).toList();
  }

  Future<Motorista> getMotorista(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/motoristas/$id'), headers: headers),
    );
    return Motorista.fromJson(data);
  }

  Future<Motorista> createMotorista(Motorista motorista) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/motoristas'),
        headers: headers,
        body: json.encode(motorista.toJson()),
      ),
    );
    return Motorista.fromJson(data);
  }

  Future<Motorista> updateMotorista(Motorista motorista) async {
    if (motorista.id == null) {
      throw Exception('ID do motorista não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/motoristas/${motorista.id}'),
        headers: headers,
        body: json.encode(motorista.toJson()),
      ),
    );
    return Motorista.fromJson(data);
  }

  Future<void> deleteMotorista(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/motoristas/$id'), headers: headers),
    );
  }

  // ==================== VEÍCULOS ====================
  Future<List<Veiculo>> getVeiculos() async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/veiculos'), headers: headers),
    );
    return (data as List).map((json) => Veiculo.fromJson(json)).toList();
  }

  Future<Veiculo> getVeiculo(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/veiculos/$id'), headers: headers),
    );
    return Veiculo.fromJson(data);
  }

  Future<Veiculo> createVeiculo(Veiculo veiculo) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/veiculos'),
        headers: headers,
        body: json.encode(veiculo.toJson()),
      ),
    );
    return Veiculo.fromJson(data);
  }

  Future<Veiculo> updateVeiculo(Veiculo veiculo) async {
    if (veiculo.id == null) {
      throw Exception('ID do veículo não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/veiculos/${veiculo.id}'),
        headers: headers,
        body: json.encode(veiculo.toJson()),
      ),
    );
    return Veiculo.fromJson(data);
  }

  Future<void> deleteVeiculo(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/veiculos/$id'), headers: headers),
    );
  }

  // ==================== ROTAS ====================
  Future<List<Rota>> getRotas() async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/rotas'), headers: headers),
    );
    return (data as List).map((json) => Rota.fromJson(json)).toList();
  }

  Future<Rota> getRota(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/rotas/$id'), headers: headers),
    );
    return Rota.fromJson(data);
  }

  Future<Rota> createRota(Rota rota) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/rotas'),
        headers: headers,
        body: json.encode(rota.toJson()),
      ),
    );
    return Rota.fromJson(data);
  }

  Future<Rota> updateRota(Rota rota) async {
    if (rota.id == null) {
      throw Exception('ID da rota não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/rotas/${rota.id}'),
        headers: headers,
        body: json.encode(rota.toJson()),
      ),
    );
    return Rota.fromJson(data);
  }

  Future<void> deleteRota(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/rotas/$id'), headers: headers),
    );
  }

  // ==================== VIAGENS ====================
  Future<List<Viagem>> getViagens() async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/viagens'), headers: headers),
    );
    return (data as List).map((json) => Viagem.fromJson(json)).toList();
  }

  Future<List<Viagem>> getViagensByData(DateTime data) async {
    final dataFormatada = data.toIso8601String().split('T').first;
    final response = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/viagens?data=$dataFormatada'),
        headers: headers,
      ),
    );
    return (response as List).map((json) => Viagem.fromJson(json)).toList();
  }

  Future<Viagem> getViagem(int id) async {
    final data = await _makeRequest(
      () => client.get(Uri.parse('$baseUrl/viagens/$id'), headers: headers),
    );
    return Viagem.fromJson(data);
  }

  Future<Viagem> createViagem(Viagem viagem) async {
    final data = await _makeRequest(
      () => client.post(
        Uri.parse('$baseUrl/viagens'),
        headers: headers,
        body: json.encode(viagem.toJson()),
      ),
    );
    return Viagem.fromJson(data);
  }

  Future<Viagem> updateViagem(Viagem viagem) async {
    if (viagem.id == null) {
      throw Exception('ID da viagem não pode ser nulo');
    }
    
    final data = await _makeRequest(
      () => client.put(
        Uri.parse('$baseUrl/viagens/${viagem.id}'),
        headers: headers,
        body: json.encode(viagem.toJson()),
      ),
    );
    return Viagem.fromJson(data);
  }

  Future<void> deleteViagem(int id) async {
    await _makeRequest(
      () => client.delete(Uri.parse('$baseUrl/viagens/$id'), headers: headers),
    );
  }

  // ==================== PONTOS DE PARADA ====================
  Future<List<PontoParada>> getPontosParada(int rotaId) async {
    final data = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/rotas/$rotaId/pontos'),
        headers: headers,
      ),
    );
    return (data as List).map((json) => PontoParada.fromJson(json)).toList();
  }

  // ==================== ACOMPANHAMENTO EM TEMPO REAL ====================
  Future<LocalizacaoVeiculo> getLocalizacaoVeiculo(int veiculoId) async {
    final data = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/veiculos/$veiculoId/localizacao'),
        headers: headers,
      ),
    );
    return LocalizacaoVeiculo.fromJson(data);
  }

  Future<StatusViagem> getStatusViagem(int viagemId) async {
    final data = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/viagens/$viagemId/status'),
        headers: headers,
      ),
    );
    return StatusViagem.fromJson(data);
  }


  // ==================== NOTIFICAÇÕES ====================
  Future<List<Notificacao>> getNotificacoes(int clienteId) async {
    final data = await _makeRequest(
      () => client.get(
        Uri.parse('$baseUrl/clientes/$clienteId/notificacoes'),
        headers: headers,
      ),
    );
    return (data as List).map((json) => Notificacao.fromJson(json)).toList();
  }

  Future<void> marcarNotificacaoLida(int notificacaoId) async {
    await _makeRequest(
      () => client.patch(
        Uri.parse('$baseUrl/notificacoes/$notificacaoId/lida'),
        headers: headers,
      ),
    );
  }
*/
  // ==================== DISPOSE ====================
  void dispose() {
    client.close();
  }
}
