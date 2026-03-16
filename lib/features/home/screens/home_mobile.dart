import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/navigation/menu_e_cabecalho/app_bar_compacta.dart';
import 'package:transcolar_frontend/core/navigation/menu_e_cabecalho/menu_responsivo.dart';
import 'package:transcolar_frontend/core/navigation/menu_route.dart';
import 'package:transcolar_frontend/core/services/clock_services.dart';
import 'package:transcolar_frontend/core/services/user_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class HomeMobile extends StatelessWidget {
  final MenuRoute currentRoute;
  final ValueChanged<MenuRoute> onMenuTap;
  final VoidCallback onExitTap;
  final VoidCallback onSearchPressed;
  final Widget currentPage;
  final String currentTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeMobile({
    super.key,
    required this.currentRoute,
    required this.onMenuTap,
    required this.onExitTap,
    required this.onSearchPressed,
    required this.currentPage,
    required this.currentTitle,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    print('📱 HomeMobile.build()');
    context.watch<ClockService>();
    final user = context.watch<UserService>();
    print('👤 Usuário: ${user.nome}');

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCompacta(
        tituloPagina: currentTitle,
        scaffoldKey: scaffoldKey,
        nomeUsuario: user.nome,
        caminhoAvatar: user.avatar,
        aoPressionarPesquisa: onSearchPressed,
      ),
      drawer: MenuResponsivo(
        currentRoute: currentRoute,
        onMenuTap: onMenuTap,
        onExitTap: onExitTap,
        inDrawer: true,
      ),
      body: currentPage,
      backgroundColor: AppColors.begeFundo,
    );
  }
}