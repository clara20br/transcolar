// 📁 core/services/responsive_service.dart

import 'package:flutter/material.dart';

import '../config/layout_config.dart';
import '../config/tamanhos_base.dart';

class ResponsiveService {
  final BuildContext context;

  ResponsiveService(this.context);

  // ============================================================
  // 📐 MEDIAQUERY
  // ============================================================

  Size get size => MediaQuery.of(context).size;

  double get width => size.width;

  double get height => size.height;

  // ============================================================
  // 📱 BREAKPOINTS
  // ============================================================

  bool get isMobile => LayoutConfig.isMobile(context);

  bool get isTablet => LayoutConfig.isTablet(context);

  bool get isDesktop => LayoutConfig.isDesktop(context);

  TipoTela get tipo {
    if (isMobile) return TipoTela.mobile;
    if (isTablet) return TipoTela.tablet;
    return TipoTela.desktop;
  }

  // ============================================================
  // ⚙️ ESCALA CENTRAL
  // ============================================================

  double s(double base) => LayoutConfig.escalar(context, base);

  double get escala => LayoutConfig.calcularFatorEscala(context);

  // ============================================================
  // 📏 ESPAÇAMENTO
  // ============================================================

  double get espaco => s(TamanhosBase.espaco);

  // ============================================================
  // 🎯 BASE RESPONSIVA GENÉRICA
  // ============================================================

  double _basePorTipoTela({
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    switch (tipo) {
      case TipoTela.mobile:
        return mobile;

      case TipoTela.tablet:
        return tablet;

      case TipoTela.desktop:
        return desktop;
    }
  }

  // ============================================================

  // ============================================================

  bool get isTabletPequeno => isTablet && width >= 600 && width < 800;
  bool get isTabletGrande => isTablet && width >= 800;

  // ============================================================
  // 🔤 LARGURA DO RELOGIO
  // ============================================================

  double get larguraRelogio {
    const desktop = 200.0;
    const tablet = 180.0;
    const mobile = 140.0;

    final base = isDesktop
        ? desktop
        : isTablet
        ? tablet
        : mobile;

    return s(base).clamp(140.0, 260.0);
  }

  // ============================================================
  // 🔤 TEXTO — BASE POR BREAKPOINT + ESCALA
  // ============================================================

  double get legenda {
    final base = _basePorTipoTela(
      mobile: TamanhosBase.legendaMobile,
      tablet: TamanhosBase.legendaTablet,
      desktop: TamanhosBase.legendaDesktop,
    );

    return s(base); // ✅ aplica escala
  }

  double get corpo => s(
    _basePorTipoTela(
      mobile: TamanhosBase.corpoMobile,
      tablet: TamanhosBase.corpoTablet,
      desktop: TamanhosBase.corpoDesktop,
    ),
  );

  double get subtitulo => s(
    _basePorTipoTela(
      mobile: TamanhosBase.subtituloMobile,
      tablet: TamanhosBase.subtituloTablet,
      desktop: TamanhosBase.subtituloDesktop,
    ),
  );

  double get titulo => s(
    _basePorTipoTela(
      mobile: TamanhosBase.tituloMobile,
      tablet: TamanhosBase.tituloTablet,
      desktop: TamanhosBase.tituloDesktop,
    ),
  );

  double get destaque => s(
    _basePorTipoTela(
      mobile: TamanhosBase.destaqueMobile,
      tablet: TamanhosBase.destaqueTablet,
      desktop: TamanhosBase.destaqueDesktop,
    ),
  );

  double get exibicao => s(
    _basePorTipoTela(
      mobile: TamanhosBase.exibicaoMobile,
      tablet: TamanhosBase.exibicaoTablet,
      desktop: TamanhosBase.exibicaoDesktop,
    ),
  );

  // ============================================================
  // 🎯 ÍCONES
  // ============================================================

  double get iconeP => s(TamanhosBase.iconemobile);
  double get iconeM => s(TamanhosBase.iconetablet);
  double get iconeG => s(TamanhosBase.iconedesktop);

  // ============================================================
  // 🧱 CABEÇALHO global
  // ============================================================

  double get cabecalho => LayoutConfig.escalarComLimites(
    context,
    TamanhosBase.cabecalhoBase,
    56,
    110,
  );

  // ============================================================
  // 🎯 BOTÕES RESPONSIVOS
  // ============================================================

  double get botaoIconeTamanho {
    switch (tipo) {
      case TipoTela.mobile:
        return s(TamanhosBase.botaoIconeMobile);
      case TipoTela.tablet:
        return s(TamanhosBase.botaoIconeTablet);
      case TipoTela.desktop:
        return s(TamanhosBase.botaoIconeDesktop);
    }
  }

  double get iconeBotaoTamanho {
    switch (tipo) {
      case TipoTela.mobile:
        return s(TamanhosBase.iconeBotaoMobile);
      case TipoTela.tablet:
        return s(TamanhosBase.iconeBotaoTablet);
      case TipoTela.desktop:
        return s(TamanhosBase.iconeBotaoDesktop);
    }
  }

  double get tamanhoBotaoAcao {
    switch (tipo) {
      case TipoTela.mobile:
        return s(40);

      case TipoTela.tablet:
        return s(44);

      case TipoTela.desktop:
        return s(50);
    }
  }

  // ============================================================
  // 👤 AVATAR
  // ============================================================

  double get avatar => s(TamanhosBase.avatar);

  // ============================================================
  // 🎯 MENU LATERAL - SISTEMA COMPLETO
  // ============================================================

  // LARGURAS
  double get menuLateral {
    switch (LayoutConfig.getTipoMenu(context)) {
      case MenuType.drawer:
        return 0;
      case MenuType.compact:
        return s(TamanhosBase.menuCompacto);
      case MenuType.fixed:
        return s(TamanhosBase.menuFixo);
    }
  }

  double get drawerWidth => s(TamanhosBase.drawerWidth);

  // LOGO
  double get menuLogo {
    if (isMobile) return s(TamanhosBase.menuLogoTablet * 0.8);
    if (isTablet) return s(TamanhosBase.menuLogoTablet);
    return s(TamanhosBase.menuLogoDesktop);
  }

  // ÍCONES DO MENU
  double get menuIconeTablet => s(TamanhosBase.menuIconeTablet);
  double get menuIconeDrawer => s(TamanhosBase.menuIconeDrawer);
  double get menuIconeDesktop => s(TamanhosBase.menuIconeDesktop);

  // CONTAINERS DO MENU
  double get menuItemContainer => s(TamanhosBase.menuItemContainer);
  double get drawerItemContainer => s(TamanhosBase.drawerItemContainer);

  // DRAWER ESPECÍFICO
  double get drawerConfigTituloFonte => s(TamanhosBase.drawerConfigTituloFonte);
  double get drawerFooterRadius => s(TamanhosBase.drawerFooterRadius);

  // ============================================================
  // 🎯 MENU - LAYOUT (NÃO É DESIGN TOKEN)
  // ============================================================

  // DRAWER CONFIG
  double get drawerConfigPaddingH => espaco * 4;
  double get drawerConfigPaddingV => espaco * 2;
  double get drawerItemRadius => s(TamanhosBase.menuItemRadius);
  double get drawerFooterButtonV => espaco * 3;

  // ============================================================
  // 📱 TABLET
  // ============================================================

  double get tabletLogoPaddingV => espaco * 1;
  double get tabletSeparatorHeight => 1;
  double get tabletSeparatorMarginH => espaco * 2;
  double get tabletSairPaddingB => espaco * 3;
  double get tabletItemMarginV => espaco * 1;
  double get tabletItemMarginH => espaco * 1;
  double get tabletItemRadius => s(TamanhosBase.menuItemRadius);
  double get tabletLegendaWidth => s(TamanhosBase.tabletLegendaWidth);

  // ============================================================
  // 🖥️ DESKTOP
  // ============================================================

  double get desktopLogoPaddingV => espaco * 1;
  double get desktopSairPaddingB => espaco * 3;
  double get desktopItemPaddingH => espaco * 1.5;
  double get desktopItemPaddingV => espaco * 1;

  // ============================================================
  // 🧱 CABEÇALHO FEATURES
  // ============================================================

  double get cabecalhoMobile => s(TamanhosBase.cabecalhoBase * 1.25);

  double get cabecalhoTablet => s(TamanhosBase.cabecalhoBase * 1.15);

  double get cabecalhoDesktop => s(TamanhosBase.cabecalhoBase);

  double get cabecalhoFeatures {
    if (isMobile) return cabecalhoMobile;
    if (isTablet) return cabecalhoTablet;
    return cabecalhoDesktop;
  }

  // 🧱 ESPAÇAMENTOS DE LAYOUT
  // Mobile
  double get subtituloPaddingHMobile => s(12);
  double get subtituloPaddingVMobile => s(5);

  // Tablet
  double get subtituloPaddingHTablet => s(5);
  double get subtituloPaddingVTablet => s(5);

  // Desktop
  double get subtituloPaddingHDesktop => s(10);
  double get subtituloPaddingVDesktop => s(5);

  // ============================================================
  // 🎪 CHIP
  // ============================================================

  double get chipAlturaMin => s(TamanhosBase.chipAlturaMin);

  double get chipFonte => s(TamanhosBase.chipFonte);

  double get chipDot => s(TamanhosBase.chipIndicador);

  double get chipPaddingH => s(TamanhosBase.chipPaddingH);

  double get chipPaddingV => s(TamanhosBase.chipPaddingV);

  double get chipMinWidth => s(TamanhosBase.chipLarguraMin);

  double get chipMaxWidth => s(TamanhosBase.chipLarguraMax);

  double get chipRaio => s(TamanhosBase.chipRaio);

  // ============================================================
  // 🔍 PESQUISA - SISTEMA COMPLETO
  // ============================================================

  // ALTURA DO CAMPO
  double get campoPesquisaAltura {
    switch (tipo) {
      case TipoTela.mobile:
        return s(TamanhosBase.campoPesquisaAlturaMobile);
      case TipoTela.tablet:
        return s(TamanhosBase.campoPesquisaAlturaTablet);
      case TipoTela.desktop:
        return s(TamanhosBase.campoPesquisaAlturaDesktop);
    }
  }

  // TAMANHO DO ÍCONE
  double get campoPesquisaIcone {
    switch (tipo) {
      case TipoTela.mobile:
        return s(TamanhosBase.campoPesquisaIconeMobile);
      case TipoTela.tablet:
        return s(TamanhosBase.campoPesquisaIconeTablet);
      case TipoTela.desktop:
        return s(TamanhosBase.campoPesquisaIconeDesktop);
    }
  }

  double get campoPesquisaFonte => corpo;

  // ============================================================
  // 🔍 PESQUISA — PADDING RESPONSIVO (LAYOUT)
  // ============================================================

  double get campoPesquisaRaioBorda => s(TamanhosBase.campoPesquisaRaioBorda);

  double get campoPesquisaPaddingH {
    switch (tipo) {
      case TipoTela.mobile:
        return s(10);
      case TipoTela.tablet:
        return s(12);
      case TipoTela.desktop:
        return s(14);
    }
  }

  double get campoPesquisaPaddingV {
    switch (tipo) {
      case TipoTela.mobile:
        return s(6);
      case TipoTela.tablet:
        return s(8);
      case TipoTela.desktop:
        return s(10);
    }
  }

  // LARGURA DO CAMPO
  double get larguraCampoPesquisa {
    double valor;

    if (isMobile) {
      valor = width * 0.95;
    } else if (isTablet) {
      valor = width * 0.38;
    } else {
      valor = width * 0.48;
    }

    return valor.clamp(280, 700);
  }

  // ============================================================
  // 🐝 GETTERS ESPECÍFICOS PARA TABELA DE COLMEIAS
  // ============================================================

  /// 📏 MANTER: Altura da linha da tabela (específica do componente)
  double get tabelaColmeiasAlturaLinha {
    if (isMobile) return TamanhosBase.tabelaColmeiasAlturaLinhaMobile;
    if (isTablet) return TamanhosBase.tabelaColmeiasAlturaLinhaTablet;
    return TamanhosBase.tabelaColmeiasAlturaLinhaDesktop;
  }

  /// 📝 MANTER: Fonte para identificação (específica do componente)
  double get tabelaColmeiasFonteIdentificacao {
    if (isMobile) return TamanhosBase.tabelaColmeiasFonteIdentificacaoMobile;
    if (isTablet) return TamanhosBase.tabelaColmeiasFonteIdentificacaoTablet;
    return TamanhosBase.tabelaColmeiasFonteIdentificacaoDesktop;
  }

  /// 📏 MANTER: Altura da linha de informações (específica do componente)
  double get tabelaColmeiasInfoAltura {
    if (isMobile) return TamanhosBase.tabelaColmeiasInfoAlturaMobile;
    if (isTablet) return TamanhosBase.tabelaColmeiasInfoAlturaTablet;
    return TamanhosBase.tabelaColmeiasInfoAlturaDesktop;
  }
}