// lib/features/auth/presentation/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/endereco_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/estudante_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/responsavel_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/usuario_auth_model.dart';
import 'package:transcolar_frontend/features/auth/data/services/auth_api_service.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApiService _apiService = AuthApiService();
  
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _currentUser;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Map<String, dynamic>? get currentUser => _currentUser;

  Future<bool> cadastrar({
    required ClienteModel cliente,
    required String email,
    required String senha,
    required EnderecoModel endereco,
    required List<EstudanteModel> estudantes,
    required List<ResponsavelModel> responsaveis,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final usuario = UsuarioAuthModel(
        id: 0,
        email: email,
        senha: senha,
        clienteId: 0,
      );

      final result = await _apiService.cadastroCompleto(
        cliente: cliente,
        usuario: usuario,
        endereco: endereco,
        estudantes: estudantes,
        responsaveis: responsaveis,
      );

      if (result['success']) {
        return true;
      } else {
        _errorMessage = result['message'];
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String senha) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _apiService.login(email, senha);
      
      if (result['success']) {
        _currentUser = result['user'];
        return true;
      } else {
        _errorMessage = result['message'];
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }
}