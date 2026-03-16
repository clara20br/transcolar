// lib/core/navigation/menu_e_cabecalho/menu_responsivo.dart
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
        child: _buildMenuContent(),
      );
    }

    return Container(
      width: compactMode ? 80 : 220,
      color: AppColors.verdeEscuro,
      child: _buildMenuContent(),
    );
  }

  Widget _buildMenuContent() {
    return Column(
      children: [
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
                      Icon(item.icon, size: 24),
                      if (!compactMode) ...[
                        const SizedBox(width: 12),
                        Expanded(child: Text(item.label)),
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
                const Icon(Icons.exit_to_app, size: 24),
                if (!compactMode) ...[
                  const SizedBox(width: 12),
                  const Text('Sair'),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}