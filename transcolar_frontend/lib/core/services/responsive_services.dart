import 'package:flutter/material.dart';

class ResponsiveService {
  final BuildContext context;
  late double _screenWidth;
  
  ResponsiveService(this.context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
  }

  // Breakpoints
  bool get isMobile => _screenWidth < 600;
  bool get isTablet => _screenWidth >= 600 && _screenWidth < 1200;
  bool get isDesktop => _screenWidth >= 1200;
  bool get isTabletPequeno => _screenWidth >= 600 && _screenWidth < 800;

  // Espaçamentos
  double get espaco {
    if (isMobile) return 8.0;
    if (isTablet) return 12.0;
    return 16.0;
  }

  // Método para escalas responsivas
  double s(double value) {
    if (isMobile) return value * 0.8;
    if (isTablet) return value * 0.9;
    return value;
  }

  // Tamanhos de header
  double get cabecalho {
    if (isMobile) return 56.0;
    if (isTablet) return 64.0;
    return 72.0;
  }

  // Font sizes
  double get titulo {
    if (isMobile) return 24.0;
    if (isTablet) return 28.0;
    return 32.0;
  }

  double get subtitulo {
    if (isMobile) return 16.0;
    if (isTablet) return 18.0;
    return 20.0;
  }

  double get corpo {
    if (isMobile) return 14.0;
    if (isTablet) return 15.0;
    return 16.0;
  }

  double get legenda {
    if (isMobile) return 12.0;
    if (isTablet) return 13.0;
    return 14.0;
  }

  double get destaque {
    if (isMobile) return 18.0;
    if (isTablet) return 20.0;
    return 24.0;
  }

  double get exibicao {
    if (isMobile) return 32.0;
    if (isTablet) return 40.0;
    return 48.0;
  }

  double get campoPesquisaFonte {
    if (isMobile) return 14.0;
    if (isTablet) return 15.0;
    return 16.0;
  }

  // Avatar/icon sizes
  double get avatar {
    if (isMobile) return 40.0;
    if (isTablet) return 50.0;
    return 60.0;
  }

  double get iconeP {
    if (isMobile) return 24.0;
    if (isTablet) return 28.0;
    return 32.0;
  }

  double get iconeM {
    if (isMobile) return 20.0;
    if (isTablet) return 24.0;
    return 28.0;
  }

  double get iconeBotaoTamanho {
    if (isMobile) return 24.0;
    if (isTablet) return 28.0;
    return 32.0;
  }

  double get tamanhoBotaoAcao {
    if (isMobile) return 48.0;
    if (isTablet) return 56.0;
    return 64.0;
  }

  // Clock size
  double get larguraRelogio {
    if (isMobile) return 80.0;
    if (isTablet) return 100.0;
    return 120.0;
  }
}