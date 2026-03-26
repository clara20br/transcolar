import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/services/api_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';

class ClienteCadastroScreen extends StatefulWidget {
  final ClienteModel? cliente;

  const ClienteCadastroScreen({
    super.key,
    this.cliente,
  });

  @override
  State<ClienteCadastroScreen> createState() => _ClienteCadastroScreenState();
}

class _ClienteCadastroScreenState extends State<ClienteCadastroScreen> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.cliente?.nome ?? '');
    _emailController = TextEditingController(text: widget.cliente?.email ?? '');
    _telefoneController = TextEditingController(text: widget.cliente?.telefone ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveService(context);

    return Scaffold(
      backgroundColor: AppColors.fundoSecundario,
      appBar: AppBar(
        title: Text(
          widget.cliente == null ? 'Novo Cliente' : 'Editar Cliente',
          style: AppTextStyles.titulo(context),
        ),
        backgroundColor: AppColors.fundoPrincipal,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(r.espaco * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              controller: _nomeController,
              label: 'Nome do Cliente',
              icon: Icons.person,
              r: r,
            ),
            SizedBox(height: r.espaco * 2),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              r: r,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: r.espaco * 2),
            _buildTextField(
              controller: _telefoneController,
              label: 'Telefone',
              icon: Icons.phone,
              r: r,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: r.espaco * 4),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvarCliente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.amareloMel,
                  padding: EdgeInsets.symmetric(vertical: r.espaco * 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.s(12)),
                  ),
                ),
                child: Text(
                  'SALVAR',
                  style: TextStyle(
                    color: AppColors.pretoPrincipal,
                    fontWeight: FontWeight.bold,
                    fontSize: r.corpo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ResponsiveService r,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: AppColors.textoBranco,
        fontSize: r.corpo,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.textoCinza,
          fontSize: r.corpo,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.amareloMel,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r.s(8)),
          borderSide: BorderSide(
            color: AppColors.amareloMel.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r.s(8)),
          borderSide: BorderSide(
            color: AppColors.amareloMel,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: AppColors.fundoCard,
      ),
    );
  }

  void _salvarCliente() {
    if (_nomeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira o nome do cliente')),
      );
      return;
    }

    // Implementar lógica de salvamento aqui
    Navigator.pop(context, true);
  }
}

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
