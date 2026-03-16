import 'package:flutter/material.dart';
import 'package:transcolar_frontend/features/Clientes/presentation/screens/cliente_list.dart';
import 'package:transcolar_frontend/features/dashboard/presentation/screens/dashboard_screen.dart';

import 'menu_route.dart';

class MenuConfig {
  static const List<MenuItemConfig> items = [
    MenuItemConfig(
      route: MenuRoute.dashboard,
      label: 'Dashboard',
      icon: Icons.dashboard,
      page: DashboardScreen(),
    ),
    MenuItemConfig(
      route: MenuRoute.clientes,
      label: 'Clientes',
      icon: Icons.people,
      page: ClienteListScreen(),
    ),
   /* MenuItemConfig(
      route: MenuRoute.estudantes,
      label: 'Estudantes',
      icon: Icons.school,
      page: EstudantesLista(),
    ),
    MenuItemConfig(
      route: MenuRoute.motoristas,
      label: 'Motoristas',
      icon: Icons.person,
      page: MotoristasScreen(),
    ),
    MenuItemConfig(
      route: MenuRoute.veiculos,
      label: 'Veículos',
      icon: Icons.directions_bus,
      page: VeiculosScreen(),
    ),
    MenuItemConfig(
      route: MenuRoute.rotas,
      label: 'Rotas',
      icon: Icons.route,
      page: RotasScreen(),
    ),
    MenuItemConfig(
      route: MenuRoute.viagens,
      label: 'Viagens',
      icon: Icons.trip_origin,
      page: ViagensScreen(),
    ),
    */
  ];

  static MenuItemConfig byRoute(MenuRoute route) {
    print('🔍 Buscando rota: $route');
    final item = items.firstWhere((e) => e.route == route);
    print('✅ Rota encontrada: ${item.label}');
    return item;
  }
}

class MenuItemConfig {
  final MenuRoute route;
  final String label;
  final IconData icon;
  final Widget page;

  const MenuItemConfig({
    required this.route,
    required this.label,
    required this.icon,
    required this.page,
  });
}