// 📁 core/config/tamanhos_base.dart

/// ======================================================================
/// 🎯 SISTEMA DE TAMANHOS BASE — DESIGN SYSTEM
///✅ REGRA DEFINITIVA (Agora no seu projeto)

//Fluxo correto:

// ignore_for_file: dangling_library_doc_comments

//TamanhosBase → define valor base único
//LayoutConfig → calcula escala
//ResponsiveService → entrega valor pronto
//Widgets → só consomem
/// Regra:
/// - Todos os valores representam MOBILE (~360px)
/// - Escala é aplicada externamente
/// ======================================================================
class TamanhosBase {
  TamanhosBase._();

  // ============================================================
  // 📏 ESPAÇAMENTOS
  // ============================================================

  static const double espaco = 5;
  // ============================================================
  // 🔤 TIPOGRAFIA — BASE POR BREAKPOINT
  // ============================================================

  // 📝 Legenda
  static const double legendaMobile = 10;
  static const double legendaTablet = 12;
  static const double legendaDesktop = 14;

  // 📄 Corpo
  static const double corpoMobile = 12;
  static const double corpoTablet = 16;
  static const double corpoDesktop = 17;

  // 🧩 Subtítulo
  static const double subtituloMobile = 26;
  static const double subtituloTablet = 28;
  static const double subtituloDesktop = 24;

  // 🏷️ Título
  static const double tituloMobile = 16;
  static const double tituloTablet = 22;
  static const double tituloDesktop = 22;

  // ⭐ Destaque
  static const double destaqueMobile = 22;
  static const double destaqueTablet = 10;
  static const double destaqueDesktop = 30;

  // 📢 Exibição
  static const double exibicaoMobile = 28;
  static const double exibicaoTablet = 10;
  static const double exibicaoDesktop = 40;

  // ============================================================
  // 🎯 MENU - DESIGN TOKENS (TAMANHOS BASE)
  // ============================================================

  // LARGURAS
  static const double menuCompacto = 130;
  static const double menuFixo = 180;
  static const double drawerWidth = 210;

  // LOGO (TAMANHO FÍSICO)
  static const double menuLogoTablet = 70;
  static const double menuLogoDesktop = 80;

  // ÍCONES
  static const double menuIconeDrawer = 20;
  static const double menuIconeTablet = 26;
  static const double menuIconeDesktop = 24;

  // CONTAINERS
  static const double menuItemContainer = 40;
  static const double drawerItemContainer = 40;
  static const double menuItemRadius = 12;

  // TIPOGRAFIA (DRAWER)
  static const double drawerConfigTituloFonte = 12;
  static const double drawerFooterRadius = 12;

  static const double tabletLegendaWidth = 90;

  // ============================================================
  // 🧱 CABEÇALHO Feature
  // ============================================================

  static const double cabecalhoBase = 86;

  // ============================================================
  // 🎪 CHIP
  // ============================================================

  static const double chipAlturaMin = 24;
  static const double chipFonte = 11;
  static const double chipIndicador = 11;
  static const double chipRaio = 10;
  static const double chipPaddingH = 0;
  static const double chipPaddingV = 4;
  static const double chipLarguraMin = 20;
  static const double chipLarguraMax = 100;

  // ============================================================
  // 🎯 ÍCONES
  // ============================================================

  static const double iconemobile = 24;
  static const double iconetablet = 26;
  static const double iconedesktop = 26;

  // ============================================================
  // 🔍 PESQUISA - DESIGN TOKENS
  // ============================================================

  static const double campoPesquisaAlturaMobile = 36;
  static const double campoPesquisaAlturaTablet = 38;
  static const double campoPesquisaAlturaDesktop = 40;

  static const double campoPesquisaRaioBorda = 18;

  static const double campoPesquisaIconeMobile = 18;
  static const double campoPesquisaIconeTablet = 20;
  static const double campoPesquisaIconeDesktop = 22;

  // ============================================================
  // 🎯 BOTÕES - DESIGN TOKENS
  // ============================================================

  static const double botaoIconeMobile = 38;
  static const double botaoIconeTablet = 40;
  static const double botaoIconeDesktop = 44;

  static const double iconeBotaoMobile = 22;
  static const double iconeBotaoTablet = 24;
  static const double iconeBotaoDesktop = 28;

  // ============================================================
  // 👤 AVATAR
  // ============================================================

  static const double avatar = 28;

  // ============================================================
  // 🐝 CONSTANTES ESPECÍFICAS DA TABELA
  // ============================================================

  // 📏 ALTURA DA LINHA
  static const double tabelaColmeiasAlturaLinhaMobile = 70;
  static const double tabelaColmeiasAlturaLinhaTablet = 75;
  static const double tabelaColmeiasAlturaLinhaDesktop = 98;

  // 📝 FONTE DA IDENTIFICAÇÃO (única, não tem equivalente genérico)
  static const double tabelaColmeiasFonteIdentificacaoMobile = 10;
  static const double tabelaColmeiasFonteIdentificacaoTablet = 11;
  static const double tabelaColmeiasFonteIdentificacaoDesktop = 12;

  // 📏 ALTURA DA LINHA DE INFORMAÇÕES
  static const double tabelaColmeiasInfoAlturaMobile = 20;
  static const double tabelaColmeiasInfoAlturaTablet = 22;
  static const double tabelaColmeiasInfoAlturaDesktop = 30;
}