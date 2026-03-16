import 'package:flutter/material.dart';

import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ============================================================
  // 📌 TÍTULO PRINCIPAL - Usando fonte padrão
  // ============================================================
  static TextStyle titulo(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido - usa padrão do sistema
      fontWeight: FontWeight.bold,
      fontSize: r.titulo,
      color: AppColors.amareloMel,
      height: 1.2,
      letterSpacing: 0.5,
    );
  }

  // ============================================================
  // 📌 SUBTÍTULO - Usando fonte padrão
  // ============================================================
  static TextStyle subtitulo(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontSize: r.subtitulo,
      fontWeight: FontWeight.w600,
      color: AppColors.marromEscuro,
      height: 1.3,
      letterSpacing: 0.3,
    );
  }

  // ============================================================
  // 📌 TEXTO PADRÃO (BODY) - Usando fonte padrão
  // ============================================================
  static TextStyle body(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontSize: r.corpo,
      color: AppColors.textoEscuro,
      height: 1.4,
    );
  }

  // ============================================================
  // 🔄 VARIAÇÕES DO BODY
  // ============================================================
  static TextStyle bodyBold(BuildContext context) {
    return body(context).copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle bodyMarrom(BuildContext context) {
    return body(context).copyWith(color: AppColors.marromFonte);
  }

  static TextStyle bodyCinza(BuildContext context) {
    return body(context).copyWith(color: AppColors.cinzaTexto);
  }

  static TextStyle bodyBoldMarrom(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.marromTexto);
  }

  // ============================================================
  // ❌ ESTADOS
  // ============================================================
  static TextStyle erro(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.erro);
  }

  static TextStyle sucesso(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.sucesso);
  }

  static TextStyle alerta(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.alerta);
  }

  // ============================================================
  // 🔘 BOTÕES
  // ============================================================
  static TextStyle button(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.branco);
  }

  // ============================================================
  // 🏷️ LEGENDA / CAPTION
  // ============================================================
  static TextStyle caption(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontSize: r.legenda,
      color: AppColors.cinzaRoxo,
    );
  }

  static TextStyle labelCampo(BuildContext context) {
    return body(context).copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.cinzaEscuro,
    );
  }

  // ============================================================
  // ⭐ DESTAQUE
  // ============================================================
  static TextStyle destaque(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontWeight: FontWeight.bold,
      fontSize: r.destaque,
      color: AppColors.amareloMel,
    );
  }

  // ============================================================
  // 📺 EXIBIÇÃO / HERO
  // ============================================================
  static TextStyle exibicao(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontWeight: FontWeight.bold,
      fontSize: r.exibicao,
      color: AppColors.marromEscuro,
    );
  }

  // ============================================================
  // 🔹 BODY SMALL
  // ============================================================
  static TextStyle bodySmall(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontSize: r.legenda,
      color: AppColors.textoEscuro,
      height: 1.3,
    );
  }

  static TextStyle bodySmallBold(BuildContext context) {
    return bodySmall(context).copyWith(fontWeight: FontWeight.bold);
  }

  // ============================================================
  // 🔍 Campo de Pesquisa
  // ============================================================
  static TextStyle campoPesquisa(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      // fontFamily removido
      fontSize: r.campoPesquisaFonte,
      color: AppColors.marromFonte,
      height: 1.2,
    );
  }
}