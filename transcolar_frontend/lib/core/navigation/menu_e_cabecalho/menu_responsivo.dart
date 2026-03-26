import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/navigation/menu_config.dart';
import 'package:transcolar_frontend/core/navigation/menu_route.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/buttons_style.dart';

class MenuResponsivo extends StatelessWidget {
  final MenuRoute currentRoute;
  final ValueChanged<MenuRoute> onMenuTap;
  final VoidCallback onExitTap;
  final bool inDrawer;
  final bool compactMode;

  const MenuResponsivo({
    super.key,
    required this.currentRoute,
    required this.onMenuTap,
    required this.onExitTap,
    required this.inDrawer,
    this.compactMode = false,
  });

  @override
  Widget build(BuildContext context) {
    if (inDrawer) {
      return Drawer(
        backgroundColor: AppColors.pretoSuave,
        child: _buildMenuContent(),
      );
    }

    return Container(
      width: compactMode ? 80 : 220,
      color: AppColors.pretoSuave,
      child: _buildMenuContent(),
    );
  }

  Widget _buildMenuContent() {
    return Column(
      children: [
        // Logo/Header do menu
       if (!inDrawer && !compactMode)
        Container(
          height: 180, // aumentado de 100 para 120
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20), // aumentado o padding
          child: Center(
            child: Image.asset(
              'assets/imagens/logo_colorida.png',
              height: 350, // aumentado de 50 para 80
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.directions_bus,
                size: 350,
                color: AppColors.amareloMel,
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: MenuConfig.items.length,
            itemBuilder: (context, index) {
              final item = MenuConfig.items[index];
              final isSelected = item.route == currentRoute;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ElevatedButton(
                  onPressed: () => onMenuTap(item.route),
                  style: ButtonStyles.menuButton(isSelected: isSelected),
                  child: Row(
                    children: [
                      Icon(
                        item.icon, 
                        size: 60,
                        color: isSelected 
                            ? AppColors.amareloMel 
                            : AppColors.textoCinza,
                      ),
                      if (!compactMode) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.label,
                            style: TextStyle(
                              color: isSelected 
                                  ? AppColors.amareloMel 
                                  : AppColors.textoCinza,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onExitTap,
            style: ButtonStyles.sairButton(),
            child: Row(
              children: [
                Icon(
                  Icons.exit_to_app, 
                  size: 24,
                  color: AppColors.erro,
                ),
                if (!compactMode) ...[
                  const SizedBox(width: 12),
                  Text(
                    'Sair',
                    style: TextStyle(color: AppColors.erro),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}