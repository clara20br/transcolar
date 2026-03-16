import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/config/layout_config.dart';
import 'package:transcolar_frontend/core/navigation/menu_config.dart';
import 'package:transcolar_frontend/core/navigation/menu_route.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/utils/screen_loggers.dart';
import 'package:transcolar_frontend/features/home/screens/home_desktop.dart';
import 'package:transcolar_frontend/features/home/screens/home_mobile.dart';
import 'package:transcolar_frontend/features/home/screens/home_tablet.dart';
import 'package:transcolar_frontend/features/tela_despedida/tela_despedida.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuRoute _currentRoute = MenuRoute.dashboard;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget get _currentPage {
    print('📄 Carregando página para rota: $_currentRoute');
    return MenuConfig.byRoute(_currentRoute).page;
  }
  
  String get _currentTitle => MenuConfig.byRoute(_currentRoute).label;

  void _onMenuTap(MenuRoute route) {
    print('👆 Menu tap: $route');
    setState(() => _currentRoute = route);
  }

  @override
  Widget build(BuildContext context) {
    print('🔵 HomeScreen.build()');
    
    return LayoutBuilder(
      builder: (context, constraints) {
        print('📏 Largura: ${constraints.maxWidth}');
        
        final tipo = LayoutConfig.detectarTipoTela(context);
        print('📱 Tipo de tela: $tipo');
        
        ScreenLogger.logScreenInfo(context, tag: 'HOME_SCREEN');

        switch (tipo) {
          case TipoTela.mobile:
            print('📱 Renderizando HomeMobile');
            return HomeMobile(
              currentRoute: _currentRoute,
              onMenuTap: _onMenuTap,
              onExitTap: _sair,
              onSearchPressed: _onSearchPressed,
              currentPage: _currentPage,
              currentTitle: _currentTitle,
              scaffoldKey: _scaffoldKey,
            );

          case TipoTela.tablet:
            print('📟 Renderizando HomeTablet');
            return HomeTablet(
              currentRoute: _currentRoute,
              onMenuTap: _onMenuTap,
              onExitTap: _sair,
              onSearchPressed: _onSearchPressed,
              currentPage: _currentPage,
              currentTitle: _currentTitle,
              scaffoldKey: _scaffoldKey,
            );

          case TipoTela.desktop:
            print('🖥️ Renderizando HomeDesktop');
            return HomeDesktop(
              currentRoute: _currentRoute,
              onMenuTap: _onMenuTap,
              onExitTap: _sair,
              onSearchPressed: _onSearchPressed,
              currentPage: _currentPage,
              currentTitle: _currentTitle,
            );
        }
      },
    );
  }

  void _onSearchPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pesquisar'),
        content: const TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Digite sua pesquisa...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Pesquisa realizada com sucesso!'),
                  backgroundColor: AppColors.begeZebrado,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.begeFundo,
              foregroundColor: Colors.white,
            ),
            child: const Text('Pesquisar'),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _sair() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.exit_to_app, color: AppColors.erro),
            SizedBox(width: 8),
            Text('Confirmar Saída'),
          ],
        ),
        content: const Text('Deseja realmente sair do sistema?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _sairAplicativo();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.erro,
              foregroundColor: Colors.white,
            ),
            child: const Text('Sair'),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _sairAplicativo() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TelaDespedida()),
      (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saindo do sistema...'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}