import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle titulo(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: r.titulo,
      color: AppColors.textoBranco,
      height: 1.2,
      letterSpacing: 0.5,
    );
  }

  static TextStyle subtitulo(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontSize: r.subtitulo,
      fontWeight: FontWeight.w600,
      color: AppColors.textoCinza,
      height: 1.3,
      letterSpacing: 0.3,
    );
  }

  static TextStyle body(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontSize: r.corpo,
      color: AppColors.textoCinza,
      height: 1.4,
    );
  }

  static TextStyle bodyBold(BuildContext context) {
    return body(context).copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle bodyMarrom(BuildContext context) {
    return body(context).copyWith(color: AppColors.textoBranco);
  }

  static TextStyle bodyCinza(BuildContext context) {
    return body(context).copyWith(color: AppColors.textoCinza);
  }

  static TextStyle bodyBoldMarrom(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.textoBranco);
  }

  static TextStyle erro(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.erro);
  }

  static TextStyle sucesso(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.sucesso);
  }

  static TextStyle alerta(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.alerta);
  }

  static TextStyle button(BuildContext context) {
    return bodyBold(context).copyWith(color: AppColors.pretoPrincipal);
  }

  static TextStyle caption(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontSize: r.legenda,
      color: AppColors.cinzaMedio,
    );
  }

  static TextStyle labelCampo(BuildContext context) {
    return body(context).copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.textoCinza,
    );
  }

  static TextStyle destaque(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: r.destaque,
      color: AppColors.amareloMel,
    );
  }

  static TextStyle exibicao(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: r.exibicao,
      color: AppColors.textoBranco,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontSize: r.legenda,
      color: AppColors.textoCinza,
      height: 1.3,
    );
  }

  static TextStyle bodySmallBold(BuildContext context) {
    return bodySmall(context).copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle campoPesquisa(BuildContext context) {
    final r = ResponsiveService(context);
    return TextStyle(
      fontSize: r.campoPesquisaFonte,
      color: AppColors.textoBranco,
      height: 1.2,
    );
  }
}