import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/buttons_style.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';
import 'package:transcolar_frontend/features/Clientes/presentation/screens/cliente_cadastro_form.dart';

class ClienteListScreen extends StatefulWidget {
  const ClienteListScreen({super.key});

  @override
  State<ClienteListScreen> createState() => _ClienteListScreenState();
}

class _ClienteListScreenState extends State<ClienteListScreen> {
  @override
  Widget build(BuildContext context) {
    final r = ResponsiveService(context);

    return Scaffold(
      backgroundColor: AppColors.fundoSecundario,
      appBar: AppBar(
        title: Text(
          'Clientes',
          style: AppTextStyles.titulo(context),
        ),
        backgroundColor: AppColors.fundoPrincipal,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          // Botão de cadastro responsivo
          if (r.isMobile)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _navegarParaCadastro(),
              tooltip: 'Novo cliente',
            ),
        ],
        bottom: r.isMobile
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: _buildBotaoCadastroMobile(r),
                ),
              )
            : null,
      ),
      floatingActionButton: r.isMobile
          ? null
          : FloatingActionButton(
              onPressed: () => _navegarParaCadastro(),
              backgroundColor: AppColors.amareloMel,
              foregroundColor: AppColors.amareloMelEscuro,
              child: const Icon(Icons.add),
              tooltip: 'Novo cliente',
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 80,
              color: AppColors.cinzaMedio,
            ),
            const SizedBox(height: 16),
            Text(
              'Clientes',
              style: AppTextStyles.subtitulo(context),
            ),
            const SizedBox(height: 8),
            Text(
              'Clique no botão + para cadastrar um novo cliente',
              style: AppTextStyles.body(context),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _navegarParaCadastro(),
              style: ButtonStyles.cadastroButton,
              child: const Text('CADASTRAR CLIENTE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotaoCadastroMobile(ResponsiveService r) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _navegarParaCadastro(),
        icon: const Icon(Icons.add),
        label: const Text('NOVO CLIENTE'),
        style: ButtonStyles.cadastroButton,
      ),
    );
  }

  void _navegarParaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClienteCadastroScreen(),
      ),
    );
  }
}