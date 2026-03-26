import 'package:flutter/material.dart';

/// Tipos de tela suportados pelo sistema
enum TipoTela { mobile, tablet, desktop }

/// Tipos de menu conforme layout
enum MenuType { drawer, compact, fixed }

class LayoutConfig {
  LayoutConfig._();

  // ============================================================
  // 📏 BREAKPOINTS PRINCIPAIS
  // ============================================================

  static const double mobileMax = 600;
  static const double tabletMax = 1024;

  // ============================================================
  // 🧠 DETECÇÃO DE TELA
  // ============================================================

  static TipoTela detectarTipoTela(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double shortest = size.shortestSide;

    // 📱 Mobile (mesmo em landscape)
    if (shortest < mobileMax) {
      return TipoTela.mobile;
    }

    // 📟 Tablet
    if (width < tabletMax) {
      return TipoTela.tablet;
    }

    // 🖥 Desktop
    return TipoTela.desktop;
  }

  // ============================================================
  // 📱 HELPERS
  // ============================================================

  static bool isMobile(BuildContext context) =>
      detectarTipoTela(context) == TipoTela.mobile;

  static bool isTablet(BuildContext context) =>
      detectarTipoTela(context) == TipoTela.tablet;

  static bool isDesktop(BuildContext context) =>
      detectarTipoTela(context) == TipoTela.desktop;

  // ============================================================
  // 📊 ESCALA GLOBAL CONTÍNUA
  // ============================================================

  static double calcularFatorEscala(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    const double minWidth = 360;
    const double maxWidth = 1920;

    const double minScale = 0.85;
    const double maxScale = 1.30;

    final double clampedWidth = width.clamp(minWidth, maxWidth);

    final double percent = (clampedWidth - minWidth) / (maxWidth - minWidth);

    return minScale + (maxScale - minScale) * percent;
  }

  // ============================================================
  // 📐 ESCALA UTILITÁRIA
  // ============================================================

  static double escalar(BuildContext context, double base) {
    return base * calcularFatorEscala(context);
  }

  static double escalarComLimites(
    BuildContext context,
    double base,
    double min,
    double max,
  ) {
    return escalar(context, base).clamp(min, max);
  }

  // ============================================================
  // 🎯 MENU DINÂMICO
  // ============================================================

  static MenuType getTipoMenu(BuildContext context) {
    switch (detectarTipoTela(context)) {
      case TipoTela.mobile:
        return MenuType.drawer;

      case TipoTela.tablet:
        return MenuType.compact;

      case TipoTela.desktop:
        return MenuType.fixed;
    }
  }
}