import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/services/api_services.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';

class ClienteProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<ClienteModel> _clientes = [];
  bool _isLoading = false;
  String? _errorMessage;
  ClienteModel? _selectedCliente;

  List<ClienteModel> get clientes => _clientes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ClienteModel? get selectedCliente => _selectedCliente;

  Future<void> carregarClientes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final clientesJson = await _apiService.getClientes();
      _clientes = clientesJson;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('Erro ao carregar clientes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> salvarCliente(ClienteModel cliente) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      if (cliente.id == null) {
        await _apiService.createCliente(cliente);
      } else {
        await _apiService.updateCliente(cliente);
      }
      
      await carregarClientes();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('Erro ao salvar cliente: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> excluirCliente(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _apiService.deleteCliente(id);
      await carregarClientes();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('Erro ao excluir cliente: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selecionarCliente(ClienteModel? cliente) {
    _selectedCliente = cliente;
    notifyListeners();
  }

  void limparSelecao() {
    _selectedCliente = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }
}