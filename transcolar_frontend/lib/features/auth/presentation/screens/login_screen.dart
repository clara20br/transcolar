// lib/features/auth/presentation/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';
import 'package:transcolar_frontend/features/auth/presentation/providers/auth_provider.dart';
import 'package:transcolar_frontend/features/auth/presentation/screens/cadastro_screen.dart';
import 'package:transcolar_frontend/features/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_emailController.text.trim().isEmpty ||
        _senhaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
          backgroundColor: AppColors.erro,
        ),
      );
      return;
    }

    final auth = context.read<AuthProvider>();
    final success = await auth.login(
      _emailController.text.trim(),
      _senhaController.text.trim(),
    );

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(auth.errorMessage ?? 'Erro ao fazer login'),
          backgroundColor: AppColors.erro,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveService(context);

    return Scaffold(
      backgroundColor: AppColors.pretoPrincipal,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(r.espaco * 4),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: r.isMobile ? double.infinity : 450,
            ),
            child: Card(
              color: AppColors.fundoCard,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.all(r.espaco * 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.school,
                      size: r.s(80),
                      color: AppColors.amareloMel,
                    ),
                    SizedBox(height: r.espaco * 3),
                    Text(
                      'Transcolar',
                      style: AppTextStyles.exibicao(context),
                    ),
                    SizedBox(height: r.espaco),
                    Text(
                      'Sistema de Transporte Escolar',
                      style: AppTextStyles.body(context),
                    ),
                    SizedBox(height: r.espaco * 4),

                    // Campo Email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: AppColors.textoBranco),
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: AppColors.textoCinza),
                        prefixIcon: Icon(Icons.email, color: AppColors.amareloMel),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.cinzaMedio),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.cinzaMedio),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.amareloMel, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: r.espaco * 2),

                    // Campo Senha
                    TextFormField(
                      controller: _senhaController,
                      obscureText: _obscurePassword,
                      style: TextStyle(color: AppColors.textoBranco),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: AppColors.textoCinza),
                        prefixIcon: Icon(Icons.lock, color: AppColors.amareloMel),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.textoCinza,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.cinzaMedio),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.cinzaMedio),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.amareloMel, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: r.espaco * 3),

                    // Botão Login
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<AuthProvider>(
                        builder: (context, auth, child) {
                          return ElevatedButton(
                            onPressed: auth.isLoading ? null : _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.amareloMel,
                              foregroundColor: AppColors.pretoPrincipal,
                              padding: EdgeInsets.symmetric(vertical: r.espaco * 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: auth.isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.pretoPrincipal,
                                    ),
                                  )
                                : Text(
                                    'ENTRAR',
                                    style: AppTextStyles.button(context),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: r.espaco * 2),

                    // Link para cadastro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta?',
                          style: AppTextStyles.body(context),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CadastroScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Cadastre-se',
                            style: AppTextStyles.bodyBold(context).copyWith(
                              color: AppColors.amareloMel,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}