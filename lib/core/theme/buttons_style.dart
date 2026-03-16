import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class ButtonStyles {
  // ======================= BOTÃO MENU LATERAL =======================
  static ButtonStyle menuButton({bool isSelected = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: isSelected
          ? AppColors.amareloMel.withValues(alpha: 0.15)
          : Colors.transparent,
      foregroundColor: isSelected ? AppColors.amareloMel : AppColors.branco,
      elevation: isSelected ? 2 : 0,
      shadowColor: isSelected
          ? AppColors.amareloMel.withValues(alpha: 0.2)
          : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      alignment: Alignment.centerLeft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? AppColors.amareloMel : Colors.transparent,
          width: isSelected ? 2.0 : 0.0,
        ),
      ),
    );
  }

  // ======================= HELPER: conteúdo do botão =======================
  static Widget menuButtonContent({
    required IconData icon,
    required String text,
    bool isExit = false,
    bool isSelected = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 26,
          color: isExit
              ? AppColors.erro
              : (isSelected ? AppColors.amareloMel : AppColors.branco),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isExit
                  ? AppColors.erro
                  : (isSelected ? AppColors.amareloMel : AppColors.branco),
            ),
          ),
        ),
      ],
    );
  }

  // ======================= BOTÃO SAIR DO MENU =======================
  static ButtonStyle sairButton({bool isHovered = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: isHovered
          ? AppColors.erro.withValues(alpha: 0.2)
          : Colors.transparent,
      foregroundColor: isHovered ? AppColors.erro : AppColors.branco,
      elevation: isHovered ? 3 : 0,
      shadowColor: AppColors.erro.withValues(alpha: 0.2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      alignment: Alignment.centerLeft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isHovered ? AppColors.erro.withValues(alpha: 0.3) : AppColors.transparente,
          width: 1.0,
        ),
      ),
    );
  }

  // ======================= BOTÃO DE CADASTRO =======================
  static ButtonStyle cadastroButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.amareloMel,
    foregroundColor: AppColors.marromEscuro,
    elevation: 4,
    shadowColor: AppColors.amareloMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    minimumSize: const Size(200, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return BorderSide(
          color: AppColors.marromEscuro,
          width: 2.0,
        );
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO LOGIN =======================
  static ButtonStyle loginButton = cadastroButton.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(AppColors.branco),
    side: WidgetStateProperty.all(
      const BorderSide(color: AppColors.branco, width: 2),
    ),
    elevation: WidgetStateProperty.all(0),
  );

  // ======================= BOTÃO SALVAR =======================
  static ButtonStyle get salvarButton => cadastroButton;
 
  // ======================= BOTÃO CANCELAR =======================
  static ButtonStyle cancelarButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.erro,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.erro.withValues(alpha: 0.3),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    minimumSize: const Size(200, 48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO LIMPAR =======================
  static ButtonStyle limparFormButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.cinzaEscuro,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.cinzaTexto.withValues(alpha: 0.3),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    minimumSize: const Size(200, 48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO RESTAURAR =======================
  static ButtonStyle restaurarButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.laranjaMel,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.laranjaMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    minimumSize: const Size(200, 48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= HELPER: Conteúdo do botão com ícone =======================
  static Widget buttonWithIconContent({
    required IconData icon,
    required String text,
    Color? iconColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: iconColor ?? AppColors.branco),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  // ======================= BOTÃO ÍCONE SALVAR =======================
  static ButtonStyle salvarIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.amareloMel,
    foregroundColor: AppColors.marromEscuro,
    elevation: 4,
    shadowColor: AppColors.amareloMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.all(12),
    minimumSize: const Size(50, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.marromEscuro, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO ÍCONE CANCELAR =======================
  static ButtonStyle cancelarIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.erro,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.erro.withValues(alpha: 0.3),
    padding: const EdgeInsets.all(12),
    minimumSize: const Size(50, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO ÍCONE LIMPAR =======================
  static ButtonStyle limparIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.cinzaEscuro,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.cinzaTexto.withValues(alpha: 0.3),
    padding: const EdgeInsets.all(12),
    minimumSize: const Size(50, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO ÍCONE RESTAURAR =======================
  static ButtonStyle restaurarIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.laranjaMel,
    foregroundColor: AppColors.branco,
    elevation: 4,
    shadowColor: AppColors.laranjaMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.all(12),
    minimumSize: const Size(50, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMel, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO CADASTRO APENAS COM ÍCONE (RESPONSIVO) =======================
  static Widget cadastroButtonIconOnly({
    required BuildContext context,
    required VoidCallback onPressed,
    String tooltip = 'Cadastrar',
    bool isLoading = false,
    double? iconSize,
    double? buttonSize,
  }) {
    final r = ResponsiveService(context);

    final double tamanhoIcone = iconSize ?? r.iconeG;
    final double tamanhoBotao = buttonSize ?? r.s(50);

    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 500),
      child: Container(
        width: tamanhoBotao,
        height: tamanhoBotao,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r.s(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.amareloMel.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.amareloMel,
            foregroundColor: AppColors.marromEscuro,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(r.s(12)),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: AppColors.marromEscuro,
                  width: r.s(2.0),
                );
              }
              return BorderSide.none;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.amareloMel.withValues(alpha: 0.2);
              }
              return null;
            }),
          ),
          child: isLoading
              ? SizedBox(
                  width: tamanhoIcone,
                  height: tamanhoIcone,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.marromEscuro),
                  ),
                )
              : Icon(Icons.add, size: tamanhoIcone, color: AppColors.marromEscuro),
        ),
      ),
    );
  }

  // ======================= BOTÃO CADASTRO EM LOTE (RESPONSIVO) =======================
  static Widget cadastroLoteButtonIconOnly({
    required BuildContext context,
    required VoidCallback onPressed,
    String tooltip = 'Cadastrar em Lote',
    bool isLoading = false,
    double? iconSize,
    double? buttonSize,
  }) {
    final r = ResponsiveService(context);

    final double tamanhoIcone = iconSize ?? r.iconeG;
    final double tamanhoBotao = buttonSize ?? r.s(50);

    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 500),
      child: Container(
        width: tamanhoBotao,
        height: tamanhoBotao,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r.s(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.amareloMel.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.amareloMel,
            foregroundColor: AppColors.marromEscuro,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(r.s(12)),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                  color: AppColors.marromEscuro,
                  width: r.s(2.0),
                );
              }
              return BorderSide.none;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.amareloMel.withValues(alpha: 0.2);
              }
              return null;
            }),
          ),
          child: isLoading
              ? SizedBox(
                  width: tamanhoIcone,
                  height: tamanhoIcone,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.marromEscuro),
                  ),
                )
              : _buildIconeCadastroLote(tamanhoIcone, r),
        ),
      ),
    );
  }

  // ======================= ÍCONE MODERNO PARA CADASTRO EM LOTE =======================
  static Widget _buildIconeCadastroLote(double size, ResponsiveService r) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: size * 0.05,
            child: Icon(
              Icons.all_inbox_rounded,
              size: size * 0.80,
              color: AppColors.marromEscuro.withValues(alpha: 0.5),
            ),
          ),
          Positioned(
            right: size * 0.00,
            bottom: size * 0.00,
            child: Container(
              width: size * 0.42,
              height: size * 0.42,
              decoration: BoxDecoration(
                color: AppColors.marromEscuro,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.marromEscuro.withValues(alpha: 0.3),
                    blurRadius: r.s(4),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  size: size * 0.28,
                  color: AppColors.amareloMel,
                  weight: 900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ======================= BOTÃO DE STATUS =======================
  static ButtonStyle statusButton(Color backgroundColor, Color textColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      elevation: 3,
      shadowColor: backgroundColor.withValues(alpha: 0.2),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ======================= BOTÃO DE RECARREGAR =======================
  static ButtonStyle recarregarButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.amareloMel,
    foregroundColor: AppColors.marromEscuro,
    elevation: 4,
    shadowColor: AppColors.amareloMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: AppColors.marromEscuro.withValues(alpha: 0.2),
        width: 1,
      ),
    ),
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );

  // ======================= BOTÃO DE RECARREGAR COM ÍCONE =======================
  static Widget recarregarButtonWithIcon({
    required VoidCallback onPressed,
    String text = 'Tentar Novamente',
    bool isLoading = false,
  }) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.marromEscuro,
                ),
              ),
            )
          : const Icon(Icons.refresh, size: 18, color: AppColors.marromEscuro),
      label: Text(text),
      style: recarregarButton,
    );
  }

  // ======================= BOTÃO FILTRAR MINIMALISTA =======================
  static ButtonStyle filtrarButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.marromEscuro,
    elevation: 0,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.all(6),
    minimumSize: const Size(32, 32),
    shape: const CircleBorder(),
  ).copyWith(
    overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.amareloMel.withValues(alpha: 0.1);
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.amareloMel;
      }
      return AppColors.marromEscuro;
    }),
  );

  // ======================= BOTÃO LIMPAR MINIMALISTA =======================
  static ButtonStyle limparButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.marromEscuro,
    elevation: 0,
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.all(8),
    minimumSize: const Size(36, 36),
    shape: const CircleBorder(),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return AppColors.erro.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.amareloMel.withValues(alpha: 0.1);
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.marromEscuro.withValues(alpha: 0.4);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.erro;
      }
      return AppColors.marromEscuro;
    }),
    side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
      if (states.contains(WidgetState.focused)) {
        return BorderSide(
          color: AppColors.amareloMel.withValues(alpha: 0.6),
          width: 1.2,
        );
      }
      return null;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.pressed)) {
        return 2;
      }
      return 0;
    }),
  );

  // ======================= BOTÃO LIMPAR COM ÍCONE =======================
  static Widget limparButtonWithIcon({
    required VoidCallback onPressed,
    String tooltip = 'Limpar pesquisa',
  }) {
    return Tooltip(
      message: tooltip,
      child: ElevatedButton(
        onPressed: onPressed,
        style: limparButton,
        child: const Icon(Icons.clear, size: 18),
      ),
    );
  }

  // ======================= BOTÃO FILTRAR COM ÍCONE =======================
  static Widget filtrarButtonWithIcon({
    required VoidCallback onPressed,
    String tooltip = 'Filtrar',
  }) {
    return Tooltip(
      message: tooltip,
      child: ElevatedButton(
        onPressed: onPressed,
        style: filtrarButton,
        child: Icon(Icons.tune, size: 18),
      ),
    );
  }

  // ======================= BOTÃO DE AÇÕES EM MASSA (ÍCONE APENAS) =======================
  static Widget acoesMassaButtonIconOnly({
    required BuildContext context,
    required int selectionCount,
    String tooltip = 'Ações em Massa',
    bool isLoading = false,
    double? iconSize,
    double? buttonSize,
    Color? backgroundColor,
    Color? iconColor,
    Color? badgeColor,
  }) {
    final r = ResponsiveService(context);

    final double tamanhoIcone = iconSize ?? r.iconeBotaoTamanho;
    final double tamanhoBotao = buttonSize ?? r.tamanhoBotaoAcao;

    return Tooltip(
      message: '$tooltip ($selectionCount selecionadas)',
      waitDuration: const Duration(milliseconds: 500),
      child: Container(
        width: tamanhoBotao,
        height: tamanhoBotao,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.amareloMel,
          borderRadius: BorderRadius.circular(r.s(12)),
          boxShadow: [
            BoxShadow(
              color: (backgroundColor ?? AppColors.amareloMel).withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!isLoading)
              Icon(
                Icons.playlist_add_check,
                size: tamanhoIcone,
                color: iconColor ?? AppColors.marromEscuro,
              ),
            if (isLoading)
              SizedBox(
                width: tamanhoIcone,
                height: tamanhoIcone,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    iconColor ?? AppColors.marromEscuro,
                  ),
                ),
              ),
            if (selectionCount > 0)
              Positioned(
                top: r.s(6),
                right: r.s(6),
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: r.s(4),
                      vertical: r.s(2),
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor ?? AppColors.erro,
                      borderRadius: BorderRadius.circular(r.s(8)),
                    ),
                    constraints: BoxConstraints(
                      minWidth: r.s(16),
                      minHeight: r.s(16),
                    ),
                    child: Text(
                      selectionCount > 99 ? '99+' : selectionCount.toString(),
                      style: TextStyle(
                        color: AppColors.branco,
                        fontSize: r.legenda,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ======================= BOTÃO SELECIONAR TUDO (RESPONSIVO) =======================
  static Widget selecionarTudoButton({
    required BuildContext context,
    required bool isAllSelected,
    required VoidCallback onPressed,
    String? label,
    double? iconSize,
    double? buttonHeight,
    EdgeInsetsGeometry? padding,
  }) {
    final r = ResponsiveService(context);

    final String texto = label ?? (isAllSelected ? 'Desmarcar Tudo' : 'Selecionar Tudo');

    final IconData icone = isAllSelected ? Icons.check_circle : Icons.circle_outlined;

    final Color backgroundColor = isAllSelected ? AppColors.amareloMel : Colors.transparent;
    final Color foregroundColor = isAllSelected ? AppColors.marromEscuro : AppColors.marromEscuro;
    final Color borderColor = isAllSelected ? AppColors.amareloMel : AppColors.marromEscuro.withValues(alpha: 0.3);

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icone, size: iconSize ?? r.iconeP),
      label: Text(
        texto,
        style: TextStyle(
          fontSize: r.corpo,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: isAllSelected ? 2 : 0,
        shadowColor: isAllSelected ? AppColors.amareloMel.withValues(alpha: 0.2) : Colors.transparent,
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: r.espaco * 3,
          vertical: r.espaco * 2,
        ),
        minimumSize: Size(
          r.isMobile ? double.infinity : 0,
          buttonHeight ?? r.tamanhoBotaoAcao,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r.s(30)),
          side: BorderSide(color: borderColor, width: r.s(1)),
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.amareloMel.withValues(alpha: 0.1);
          }
          return null;
        }),
      ),
    );
  }

  // ======================= BOTÃO SELECIONAR TUDO ÍCONE (VERSÃO COMPACTA) =======================
  static Widget selecionarTudoIconButton({
    required BuildContext context,
    required bool isAllSelected,
    required VoidCallback onPressed,
    double? iconSize,
    double? buttonSize,
  }) {
    final r = ResponsiveService(context);

    final double size = iconSize ?? r.iconeP;
    final double containerSize = buttonSize ?? r.tamanhoBotaoAcao;

    const double strokeWidth = 2.8;
    const double activeBorderWidth = 2.5;

    final Color backgroundColor = isAllSelected ? AppColors.amareloMel : Colors.transparent;
    final String tooltip = isAllSelected ? 'Desmarcar Tudo' : 'Selecionar Tudo';

    final hoverNotifier = ValueNotifier<bool>(false);

    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 500),
      child: MouseRegion(
        onEnter: (_) => hoverNotifier.value = true,
        onExit: (_) => hoverNotifier.value = false,
        child: ValueListenableBuilder<bool>(
          valueListenable: hoverNotifier,
          builder: (context, isHovering, _) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(r.s(12)),
                border: Border.all(
                  color: isAllSelected
                      ? AppColors.marromEscuro
                      : isHovering
                      ? AppColors.amareloMel
                      : Colors.transparent,
                  width: activeBorderWidth,
                ),
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.s(12)),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isAllSelected ? Colors.white : Colors.transparent,
                      border: Border.all(
                        color: isAllSelected ? Colors.white : AppColors.marromEscuro,
                        width: strokeWidth,
                      ),
                    ),
                    child: isAllSelected
                        ? Icon(
                            Icons.check,
                            size: size * 0.8,
                            color: AppColors.amareloMel,
                          )
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}