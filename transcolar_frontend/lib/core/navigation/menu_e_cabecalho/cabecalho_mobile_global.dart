// 📁 features/home/components/cabecalho_mobile_global.dart
import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';


/// 📱 CABEÇALHO MOBILE - Componente especializado para mobile
/// CARACTERÍSTICAS:
/// - AppBar padrão do Material Design
/// - Exibe: Logo + Nome do usuário
/// - Botão de menu para abrir drawer
/// - Botão de pesquisa opcional
/// - Usado em layouts mobile
class CabecalhoMobile extends StatelessWidget implements PreferredSizeWidget {
  final String tituloPagina;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String nomeUsuario;
  final String caminhoAvatar;
  final VoidCallback? aoPressionarPesquisa;

  const CabecalhoMobile({
    super.key,
    required this.tituloPagina,
    required this.scaffoldKey,
    required this.nomeUsuario,
    required this.caminhoAvatar,
    this.aoPressionarPesquisa,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.amareloDourado,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      // 🍔 Ícone do menu para abrir drawer
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
        tooltip: 'Abrir menu',
      ),
      // 🏢 Título personalizado
      title: _construirTituloPersonalizado(),
      // 🔍 Ações: Botão de pesquisa
      actions: [
        if (aoPressionarPesquisa != null)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: aoPressionarPesquisa,
            tooltip: 'Pesquisar',
          ),
      ],
    );
  }

  /// 🏢 Constrói título personalizado com logo e informações do usuário
  Widget _construirTituloPersonalizado() {
    return Row(
      children: [
        // Logo pequena
        _construirLogo(),
        const SizedBox(width: 12),
        // Nome do usuário
        _construirInformacoesUsuario(),
      ],
    );
  }

  /// 🏢 Logo do aplicativo
  Widget _construirLogo() {
    return Image.asset(
      'assets/imagens/logo_colorida.png',
      height: 40,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.directions_bus, color: AppColors.amareloPrincipal, size: 40),
    );
  }

  /// 👤 Informações do usuário (primeiro nome)
  Widget _construirInformacoesUsuario() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome do sistema
          const Text(
            'Transcolar',
            style: TextStyle(fontSize: 14, color: Colors.white70),
            overflow: TextOverflow.ellipsis,
          ),
          // Nome do usuário (primeiro nome)
          Text(
            _obterPrimeiroNome(nomeUsuario),
            style: const TextStyle(fontSize: 12, color: Colors.white70),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// 📝 Extrai apenas o primeiro nome do usuário
  String _obterPrimeiroNome(String nomeCompleto) {
    return nomeCompleto.split(' ').first;
  }
}