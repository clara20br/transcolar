import 'package:flutter/material.dart';

class AppColors {
  // ============================================================
  // 🎨 NOVA PALETA DE CORES - Transcolar
  // Base: Preto | Destaque: Amarelo Mel | Apoio: Cinza
  // ============================================================

  // --- 🖤 CORES BASE (FUNDO) ---
  /// Fundo principal do site/app. Usado em telas inteiras.
  static const Color pretoPrincipal = Color(0xFF0A0A0A);
  /// Fundo secundário, para cabeçalhos ou áreas de destaque.
  static const Color pretoSuave = Color(0xFF1E1E1E);
  /// Fundo para cards e elementos elevados.
  static const Color fundoCard = Color(0xFF2A2A2A);

  // --- 🍯 CORES DE DESTAQUE (AÇÃO) ---
  /// Amarelo Mel - Cor primária de ação.
  static const Color amareloMel = Color(0xFFFFB74D);
  /// Amarelo Mel Escuro - Usado para hovers e estados pressionados.
  static const Color amareloMelEscuro = Color(0xFFFF9800);
  /// Amarelo Mel Claro - Usado para bordas e detalhes sutis.
  static const Color amareloMelClaro = Color(0xFFFFE0B2);

  // --- ⚪ CORES DE TEXTO E APOIO ---
  /// Texto principal sobre fundo escuro.
  static const Color textoBranco = Color(0xFFFFFFFF);
  /// Texto secundário ou de apoio.
  static const Color textoCinza = Color(0xFFB0B0B0);
  /// Cinza claro para ícones secundários ou bordas.
  static const Color cinzaClaro = Color(0xFFE0E0E0);
  /// Cinza médio para elementos desabilitados.
  static const Color cinzaMedio = Color(0xFF9E9E9E);
  /// Cinza escuro (textos sobre fundo claro).
  static const Color cinzaEscuro = Color(0xFF616161);

  // --- 🚌 CORES DE SISTEMA (MANTIDAS PARA COMPATIBILIDADE) ---
  static const Color amareloPrincipal = amareloMel;
  static const Color amareloDourado = amareloMelEscuro;
  static const Color amareloClaro = amareloMelClaro;
  static const Color fundoPrincipal = pretoPrincipal;
  static const Color fundoSecundario = pretoSuave;
  static const Color laranjaOnibus = cinzaMedio;
  static const Color laranjaEscuro = amareloMelEscuro;
  static const Color destaque = amareloMel;
  static const Color destaqueHover = amareloMelClaro;
  static const Color gradienteInicio = amareloMel;
  static const Color gradienteFim = amareloMelEscuro;
  static const Color gradienteEscuro = pretoPrincipal;
  static const Color gradienteMedio = pretoSuave;
  static const Color gradienteClaro = fundoCard;

  // --- 🟢 CORES DE ESTADO ---
  static const Color sucesso = Color(0xFF4CAF50);
  static const Color alerta = Color(0xFFFFC107);
  static const Color erro = Color(0xFFD32F2F);
  static const Color info = Color(0xFF2196F3);

  // --- ✨ UTILITÁRIOS ---
  static const Color transparente = Colors.transparent;
}