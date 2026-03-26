import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/navigation/menu_e_cabecalho/cabecalho_desktop_global.dart';
import 'package:transcolar_frontend/core/navigation/menu_e_cabecalho/menu_responsivo.dart';
import 'package:transcolar_frontend/core/navigation/menu_route.dart';
import 'package:transcolar_frontend/core/services/user_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
class HomeTablet extends StatelessWidget {
  final MenuRoute currentRoute;
  final ValueChanged<MenuRoute> onMenuTap;
  final VoidCallback onExitTap;
  final VoidCallback onSearchPressed;
  final Widget currentPage;
  final String currentTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeTablet({
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
    final user = context.watch<UserService>();

    return Scaffold(
      backgroundColor: AppColors.pretoSuave,
      body: Row(
        children: [
          Container(
            width: 80,
            child: MenuResponsivo(
              currentRoute: currentRoute,
              onMenuTap: onMenuTap,
              onExitTap: onExitTap,
              inDrawer: false,
              compactMode: true,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CabecalhoDesktop(
                  nomeUsuario: user.nome,
                  caminhoAvatar: user.avatar,
                  aoPressionarPesquisa: onSearchPressed,
                ),
                Expanded(
                  child: Container(
                    color: AppColors.pretoPrincipal,
                    child: currentPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}