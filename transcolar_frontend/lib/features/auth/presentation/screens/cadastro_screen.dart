// lib/features/auth/presentation/screens/cadastro_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/endereco_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/estudante_model.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/responsavel_model.dart';
import 'package:transcolar_frontend/features/auth/presentation/providers/auth_provider.dart';
import 'package:transcolar_frontend/features/auth/presentation/screens/login_screen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  
  // ========== ACESSO ==========
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  
  // ========== ENDEREÇO ==========
  final _cepController = TextEditingController();
  final _ufController = TextEditingController();
  final _municipioController = TextEditingController();
  final _bairroController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _numeroController = TextEditingController();
  final _complementoController = TextEditingController();
  
  // ========== ESTUDANTE ==========
  final _estudanteNomeController = TextEditingController();
  final _estudanteDateController = TextEditingController();
  final _estudanteCpfController = TextEditingController();
  String? _selectedEscola;
  String? _selectedTurno;
  bool _temProblemasSaude = false;
  final _problemaSaudeController = TextEditingController();
  
  // ========== RESPONSÁVEL ==========
  final _responsavelNomeController = TextEditingController();
  final _responsavelCpfController = TextEditingController();
  final _responsavelEmailController = TextEditingController();
  final _responsavelTelefoneController = TextEditingController();
  String? _estadoCivil;
  
  // Endereço do segundo responsável (se divorciado)
  final _segundoEndCepController = TextEditingController();
  final _segundoEndUfController = TextEditingController();
  final _segundoEndMunicipioController = TextEditingController();
  final _segundoEndBairroController = TextEditingController();
  final _segundoEndLogradouroController = TextEditingController();
  final _segundoEndNumeroController = TextEditingController();
  final _segundoEndComplementoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    _cepController.dispose();
    _ufController.dispose();
    _municipioController.dispose();
    _bairroController.dispose();
    _logradouroController.dispose();
    _numeroController.dispose();
    _complementoController.dispose();
    _estudanteNomeController.dispose();
    _estudanteDateController.dispose();
    _estudanteCpfController.dispose();
    _problemaSaudeController.dispose();
    _responsavelNomeController.dispose();
    _responsavelCpfController.dispose();
    _responsavelEmailController.dispose();
    _responsavelTelefoneController.dispose();
    _segundoEndCepController.dispose();
    _segundoEndUfController.dispose();
    _segundoEndMunicipioController.dispose();
    _segundoEndBairroController.dispose();
    _segundoEndLogradouroController.dispose();
    _segundoEndNumeroController.dispose();
    _segundoEndComplementoController.dispose();
    super.dispose();
  }

  void _proxima() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _anterior() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finalizarCadastro() async {
    if (_validarForm()) {
      final authProvider = context.read<AuthProvider>();
      
      final cliente = ClienteModel(
        id: null,
        nome: _responsavelNomeController.text,
        cpfCnpj: _responsavelCpfController.text,
        email: _emailController.text,
        telefone: _responsavelTelefoneController.text,
      );
      
      final endereco = EnderecoModel(
        id: null,
        cep: _cepController.text,
        uf: _ufController.text,
        municipio: _municipioController.text,
        bairro: _bairroController.text,
        logradouro: _logradouroController.text,
        numero: _numeroController.text,
        complemento: _complementoController.text,
        clienteId: 0,
      );
      
      final estudante = EstudanteModel(
        id: null,
        nome: _estudanteNomeController.text,
        dataNascimento: _estudanteDateController.text,
        cpf: _estudanteCpfController.text,
        escola: _selectedEscola ?? '',
        turno: _selectedTurno ?? '',
        problema: _temProblemasSaude ? _problemaSaudeController.text : '',
        clienteId: 0,
      );
      
      final responsavel = ResponsavelModel(
        id: null,
        nome: _responsavelNomeController.text,
        cpf: _responsavelCpfController.text,
        email: _responsavelEmailController.text,
        telefone: _responsavelTelefoneController.text,
        estadoCivil: _estadoCivil ?? 'solteiro',
        clienteId: 0,
      );
      
      final success = await authProvider.cadastrar(
        cliente: cliente,
        email: _emailController.text,
        senha: _senhaController.text,
        endereco: endereco,
        estudantes: [estudante],
        responsaveis: [responsavel],
      );
      
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authProvider.errorMessage ?? 'Erro ao cadastrar')),
        );
      }
    }
  }

  bool _validarForm() {
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      _mostrarErro('Preenchha email e senha');
      return false;
    }
    if (_senhaController.text != _confirmarSenhaController.text) {
      _mostrarErro('As senhas não coincidem');
      return false;
    }
    if (_logradouroController.text.isEmpty || _numeroController.text.isEmpty) {
      _mostrarErro('Preencha o endereço');
      return false;
    }
    if (_estudanteNomeController.text.isEmpty || _selectedEscola == null) {
      _mostrarErro('Preencha os dados do estudante');
      return false;
    }
    if (_responsavelNomeController.text.isEmpty) {
      _mostrarErro('Preencha os dados do responsável');
      return false;
    }
    return true;
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem), backgroundColor: AppColors.erro),
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveService(context);
    
    return Scaffold(
      backgroundColor: AppColors.fundoSecundario,
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: AppColors.fundoPrincipal,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => setState(() => _currentPage = page),
        children: [
          _telaAcesso(r),
          _telaEndereco(r),
          _telaEstudante(r),
          _telaResponsavel(r),
        ],
      ),
      bottomNavigationBar: _buildNavegacao(r),
    );
  }

  Widget _buildNavegacao(ResponsiveService r) {
    return Container(
      padding: EdgeInsets.all(r.espaco * 1.5),
      decoration: BoxDecoration(
        color: AppColors.fundoCard,
        border: Border(top: BorderSide(color: AppColors.cinzaMedio)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: _currentPage > 0 ? _anterior : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cinzaMedio,
              disabledBackgroundColor: AppColors.cinzaMedio.withValues(alpha: 0.5),
              padding: EdgeInsets.symmetric(horizontal: r.espaco * 2, vertical: r.espaco),
            ),
            child: Text('← Anterior', style: TextStyle(fontSize: r.corpo * 0.9)),
          ),
          Text(
            'Etapa ${_currentPage + 1}/4',
            style: AppTextStyles.body(context),
          ),
          ElevatedButton(
            onPressed: _currentPage < 3 ? _proxima : _finalizarCadastro,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.amareloMel,
              padding: EdgeInsets.symmetric(horizontal: r.espaco * 2, vertical: r.espaco),
            ),
            child: Text(
              _currentPage < 3 ? 'Próxima →' : 'Finalizar',
              style: TextStyle(color: AppColors.pretoPrincipal, fontSize: r.corpo * 0.9),
            ),
          ),
        ],
      ),
    );
  }

  // ========== TELA 1: ACESSO ==========
  Widget _telaAcesso(ResponsiveService r) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(r.espaco * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dados de Acesso', style: AppTextStyles.titulo(context)),
          SizedBox(height: r.espaco * 2.5),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            r: r,
            type: TextInputType.emailAddress,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildPasswordField(
            controller: _senhaController,
            label: 'Senha',
            obscure: _obscurePassword,
            onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
            r: r,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildPasswordField(
            controller: _confirmarSenhaController,
            label: 'Confirmar Senha',
            obscure: _obscureConfirmPassword,
            onToggle: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
            r: r,
            height: 50,
          ),
        ],
      ),
    );
  }

  // ========== TELA 2: ENDEREÇO ==========
  Widget _telaEndereco(ResponsiveService r) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(r.espaco * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Localização', style: AppTextStyles.titulo(context)),
          SizedBox(height: r.espaco * 2.5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildTextField(
                  controller: _cepController,
                  label: 'CEP',
                  icon: Icons.location_on,
                  r: r,
                  type: TextInputType.number,
                  height: 50,
                  inputFormatters: [_CepInputFormatter()],
                ),
              ),
              SizedBox(width: r.espaco),
              Expanded(
                child: _buildTextField(
                  controller: _ufController,
                  label: 'UF',
                  icon: Icons.map,
                  r: r,
                  height: 50,
                  maxLength: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildTextField(
            controller: _municipioController,
            label: 'Município',
            icon: Icons.location_city,
            r: r,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildTextField(
                  controller: _bairroController,
                  label: 'Bairro',
                  icon: Icons.place,
                  r: r,
                  height: 50,
                ),
              ),
              SizedBox(width: r.espaco),
              Expanded(
                child: _buildTextField(
                  controller: _numeroController,
                  label: 'Nº',
                  icon: Icons.numbers,
                  r: r,
                  type: TextInputType.number,
                  height: 50,
                ),
              ),
            ],
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildTextField(
            controller: _logradouroController,
            label: 'Logradouro',
            icon: Icons.streetview,
            r: r,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildTextField(
            controller: _complementoController,
            label: 'Complemento (opcional)',
            icon: Icons.note,
            r: r,
            height: 45,
          ),
        ],
      ),
    );
  }

  // ========== TELA 3: ESTUDANTE ==========
  Widget _telaEstudante(ResponsiveService r) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(r.espaco * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informações do Estudante', style: AppTextStyles.titulo(context)),
          SizedBox(height: r.espaco * 2.5),
          _buildTextField(
            controller: _estudanteNomeController,
            label: 'Nome Completo',
            icon: Icons.person,
            r: r,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildTextField(
                  controller: _estudanteDateController,
                  label: 'Data Nasc.',
                  icon: Icons.calendar_today,
                  r: r,
                  type: TextInputType.datetime,
                  height: 50,
                  inputFormatters: [_DataInputFormatter()],
                ),
              ),
              SizedBox(width: r.espaco),
              Expanded(
                child: _buildTextField(
                  controller: _estudanteCpfController,
                  label: 'CPF',
                  icon: Icons.card_giftcard,
                  r: r,
                  type: TextInputType.number,
                  height: 50,
                  inputFormatters: [_CpfInputFormatter()],
                ),
              ),
            ],
          ),
          SizedBox(height: r.espaco * 1.5),
          Text('Escola', style: AppTextStyles.body(context)),
          SizedBox(height: r.espaco * 0.5),
          _buildDropdown(
            value: _selectedEscola,
            items: const ['Escola A', 'Escola B', 'Escola C'],
            icon: Icons.school,
            onChanged: (value) => setState(() => _selectedEscola = value),
            r: r,
          ),
          SizedBox(height: r.espaco * 1.5),
          Text('Turno', style: AppTextStyles.body(context)),
          SizedBox(height: r.espaco * 0.5),
          _buildDropdown(
            value: _selectedTurno,
            items: const ['Matutino', 'Vespertino', 'Noturno'],
            icon: Icons.schedule,
            onChanged: (value) => setState(() => _selectedTurno = value),
            r: r,
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildCheckbox(
            value: _temProblemasSaude,
            label: 'Possui problemas de saúde?',
            onChanged: (value) => setState(() => _temProblemasSaude = value ?? false),
            r: r,
          ),
          if (_temProblemasSaude) ...[
            SizedBox(height: r.espaco * 1.5),
            _buildTextField(
              controller: _problemaSaudeController,
              label: 'Descreva o problema',
              icon: Icons.health_and_safety,
              r: r,
              maxLines: 2,
              height: 60,
            ),
          ],
        ],
      ),
    );
  }

  // ========== TELA 4: RESPONSÁVEL ==========
  Widget _telaResponsavel(ResponsiveService r) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(r.espaco * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsável', style: AppTextStyles.titulo(context)),
          SizedBox(height: r.espaco * 2.5),
          _buildTextField(
            controller: _responsavelNomeController,
            label: 'Nome Completo',
            icon: Icons.person,
            r: r,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _responsavelCpfController,
                  label: 'CPF',
                  icon: Icons.card_giftcard,
                  r: r,
                  type: TextInputType.number,
                  height: 50,
                  inputFormatters: [_CpfInputFormatter()],
                ),
              ),
              SizedBox(width: r.espaco),
              Expanded(
                child: _buildTextField(
                  controller: _responsavelTelefoneController,
                  label: 'Telefone',
                  icon: Icons.phone,
                  r: r,
                  type: TextInputType.phone,
                  height: 50,
                  inputFormatters: [_TelefoneInputFormatter()],
                ),
              ),
            ],
          ),
          SizedBox(height: r.espaco * 1.5),
          _buildTextField(
            controller: _responsavelEmailController,
            label: 'Email',
            icon: Icons.email,
            r: r,
            type: TextInputType.emailAddress,
            height: 50,
          ),
          SizedBox(height: r.espaco * 1.5),
          Text('Estado Civil', style: AppTextStyles.body(context)),
          SizedBox(height: r.espaco * 0.5),
          _buildDropdown(
            value: _estadoCivil,
            items: const ['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)'],
            icon: Icons.favorite,
            onChanged: (value) => setState(() {
              _estadoCivil = value?.toLowerCase();
            }),
            r: r,
          ),
          if (_estadoCivil == 'divorciado(a)') ...[
            SizedBox(height: r.espaco * 2),
            Divider(color: AppColors.amareloMel, thickness: 2),
            SizedBox(height: r.espaco * 2),
            Text('Endereço do Outro Responsável', style: AppTextStyles.subtitulo(context)),
            SizedBox(height: r.espaco * 1.5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildTextField(
                    controller: _segundoEndCepController,
                    label: 'CEP',
                    icon: Icons.location_on,
                    r: r,
                    type: TextInputType.number,
                    height: 50,
                    inputFormatters: [_CepInputFormatter()],
                  ),
                ),
                SizedBox(width: r.espaco),
                Expanded(
                  child: _buildTextField(
                    controller: _segundoEndUfController,
                    label: 'UF',
                    icon: Icons.map,
                    r: r,
                    height: 50,
                    maxLength: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: r.espaco * 1.5),
            _buildTextField(
              controller: _segundoEndLogradouroController,
              label: 'Logradouro',
              icon: Icons.streetview,
              r: r,
              height: 50,
            ),
            SizedBox(height: r.espaco * 1.5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildTextField(
                    controller: _segundoEndBairroController,
                    label: 'Bairro',
                    icon: Icons.place,
                    r: r,
                    height: 50,
                  ),
                ),
                SizedBox(width: r.espaco),
                Expanded(
                  child: _buildTextField(
                    controller: _segundoEndNumeroController,
                    label: 'Nº',
                    icon: Icons.numbers,
                    r: r,
                    type: TextInputType.number,
                    height: 50,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // ========== WIDGETS AUXILIARES ==========
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ResponsiveService r,
    TextInputType type = TextInputType.text,
    int maxLines = 1,
    double height = 50,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        style: TextStyle(
          color: AppColors.textoBranco,
          fontSize: r.corpo,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: AppColors.textoCinza, fontSize: r.corpo * 0.9),
          prefixIcon: Icon(icon, color: AppColors.amareloMel, size: r.corpo),
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: r.espaco * 0.5, horizontal: r.espaco),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel.withValues(alpha: 0.3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel, width: 2),
          ),
          filled: true,
          fillColor: AppColors.fundoCard,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback onToggle,
    required ResponsiveService r,
    double height = 50,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(
          color: AppColors.textoBranco,
          fontSize: r.corpo,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: AppColors.textoCinza, fontSize: r.corpo * 0.9),
          prefixIcon: const Icon(Icons.lock, color: AppColors.amareloMel),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.amareloMel,
              size: r.corpo,
            ),
            onPressed: onToggle,
            constraints: BoxConstraints(minWidth: 40),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: r.espaco * 0.5, horizontal: r.espaco),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel.withValues(alpha: 0.3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel, width: 2),
          ),
          filled: true,
          fillColor: AppColors.fundoCard,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required IconData icon,
    required Function(String?) onChanged,
    required ResponsiveService r,
  }) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.amareloMel, size: r.corpo),
          contentPadding: EdgeInsets.symmetric(vertical: r.espaco * 0.5, horizontal: r.espaco),
          isDense: true,
          filled: true,
          fillColor: AppColors.fundoCard,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel.withValues(alpha: 0.3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(r.s(6)),
            borderSide: BorderSide(color: AppColors.amareloMel, width: 2),
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item, style: TextStyle(fontSize: r.corpo * 0.95)),
          );
        }).toList(),
        onChanged: onChanged,
        style: TextStyle(color: AppColors.textoBranco, fontSize: r.corpo),
        dropdownColor: AppColors.fundoCard,
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required String label,
    required Function(bool?) onChanged,
    required ResponsiveService r,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.amareloMel.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(r.s(6)),
        color: AppColors.fundoCard,
      ),
      child: CheckboxListTile(
        title: Text(label, style: TextStyle(fontSize: r.corpo * 0.95)),
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.amareloMel,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.symmetric(horizontal: r.espaco),
        dense: true,
      ),
    );
  }
}

// ========== FORMATADORES ==========
class _CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    
    if (text.isEmpty) return newValue;
    if (text.length <= 3) {
      return newValue.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    if (text.length <= 6) {
      final formatted = '${text.substring(0, 3)}.${text.substring(3)}';
      return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    if (text.length <= 9) {
      final formatted = '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6)}';
      return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    final formatted = '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9, 11)}';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _TelefoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    
    if (text.isEmpty) return newValue;
    if (text.length <= 2) {
      final formatted = '($text';
      return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    if (text.length <= 7) {
      final formatted = '(${text.substring(0, 2)}) ${text.substring(2)}';
      return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    final formatted = '(${text.substring(0, 2)}) ${text.substring(2, 7)}-${text.substring(7, 11)}';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    
    if (text.isEmpty) return newValue;
    if (text.length <= 5) {
      return newValue.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    final formatted = '${text.substring(0, 5)}-${text.substring(5, 8)}';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    
    if (text.isEmpty) return newValue;
    if (text.length <= 2) {
      return newValue.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    if (text.length <= 4) {
      final formatted = '${text.substring(0, 2)}/${text.substring(2)}';
      return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    final formatted = '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4, 8)}';
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
