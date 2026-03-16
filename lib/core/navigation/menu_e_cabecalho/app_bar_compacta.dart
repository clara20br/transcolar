// lib/core/navigation/menu_e_cabecalho/app_bar_compacta.dart
import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class AppBarCompacta extends StatelessWidget implements PreferredSizeWidget {
  final String tituloPagina;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String nomeUsuario;
  final String caminhoAvatar;
  final VoidCallback? aoPressionarPesquisa;

  const AppBarCompacta({
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
      backgroundColor: AppColors.verdeEscuro,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
      ),
      title: Text(tituloPagina, style: const TextStyle(color: Colors.white)),
      actions: [
        if (aoPressionarPesquisa != null)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: aoPressionarPesquisa,
          ),
      ],
    );
  }
}