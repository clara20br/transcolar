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
      foregroundColor: isSelected ? AppColors.amareloMel : AppColors.textoCinza,
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

  // ======================= BOTÃO SAIR DO MENU =======================
  static ButtonStyle sairButton({bool isHovered = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: isHovered
          ? AppColors.erro.withValues(alpha: 0.2)
          : Colors.transparent,
      foregroundColor: isHovered ? AppColors.erro : AppColors.textoCinza,
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
    foregroundColor: AppColors.pretoPrincipal,
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
          color: AppColors.amareloMelEscuro,
          width: 2.0,
        );
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO LOGIN =======================
  static ButtonStyle loginButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.amareloMel,
    side: const BorderSide(color: AppColors.amareloMel, width: 2),
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    minimumSize: const Size(200, 48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  );

  // ======================= BOTÃO CANCELAR =======================
  static ButtonStyle cancelarButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.erro,
    foregroundColor: AppColors.textoBranco,
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
    backgroundColor: AppColors.cinzaMedio,
    foregroundColor: AppColors.pretoPrincipal,
    elevation: 4,
    shadowColor: AppColors.cinzaMedio.withValues(alpha: 0.3),
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

  // ======================= BOTÃO ÍCONE SALVAR =======================
  static ButtonStyle salvarIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.amareloMel,
    foregroundColor: AppColors.pretoPrincipal,
    elevation: 4,
    shadowColor: AppColors.amareloMel.withValues(alpha: 0.3),
    padding: const EdgeInsets.all(12),
    minimumSize: const Size(50, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ).copyWith(
    side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(color: AppColors.amareloMelEscuro, width: 2.0);
      }
      return BorderSide.none;
    }),
  );

  // ======================= BOTÃO ÍCONE CANCELAR =======================
  static ButtonStyle cancelarIconButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.erro,
    foregroundColor: AppColors.textoBranco,
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
    backgroundColor: AppColors.cinzaMedio,
    foregroundColor: AppColors.pretoPrincipal,
    elevation: 4,
    shadowColor: AppColors.cinzaMedio.withValues(alpha: 0.3),
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

  // ======================= BOTÃO FILTRAR MINIMALISTA =======================
  static ButtonStyle filtrarButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.textoCinza,
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
      return AppColors.textoCinza;
    }),
  );

  // ======================= BOTÃO LIMPAR MINIMALISTA =======================
  static ButtonStyle limparButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.textoCinza,
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
        return AppColors.cinzaMedio.withValues(alpha: 0.4);
      }
      if (states.contains(WidgetState.hovered)) {
        return AppColors.erro;
      }
      return AppColors.textoCinza;
    }),
  );

  // ======================= BOTÃO SELECIONAR TUDO =======================
  static Widget selecionarTudoButton({
    required BuildContext context,
    required bool isAllSelected,
    required VoidCallback onPressed,
    String? label,
  }) {
    final r = ResponsiveService(context);

    final String texto = label ?? (isAllSelected ? 'Desmarcar Tudo' : 'Selecionar Tudo');
    final IconData icone = isAllSelected ? Icons.check_circle : Icons.circle_outlined;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icone, size: r.iconeP),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: isAllSelected ? AppColors.amareloMel : Colors.transparent,
        foregroundColor: isAllSelected ? AppColors.pretoPrincipal : AppColors.textoCinza,
        elevation: isAllSelected ? 2 : 0,
        side: BorderSide(
          color: isAllSelected ? AppColors.amareloMelEscuro : AppColors.cinzaMedio,
          width: 1,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: r.espaco * 3,
          vertical: r.espaco * 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r.s(30)),
        ),
      ),
    );
  }

  // ======================= BOTÃO DE AÇÕES EM MASSA =======================
  static Widget acoesMassaButtonIconOnly({
    required BuildContext context,
    required int selectionCount,
    String tooltip = 'Ações em Massa',
    bool isLoading = false,
  }) {
    final r = ResponsiveService(context);

    return Tooltip(
      message: '$tooltip ($selectionCount selecionadas)',
      child: Container(
        width: r.tamanhoBotaoAcao,
        height: r.tamanhoBotaoAcao,
        decoration: BoxDecoration(
          color: AppColors.amareloMel,
          borderRadius: BorderRadius.circular(r.s(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.amareloMel.withValues(alpha: 0.2),
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
                size: r.iconeBotaoTamanho,
                color: AppColors.pretoPrincipal,
              ),
            if (isLoading)
              SizedBox(
                width: r.iconeBotaoTamanho,
                height: r.iconeBotaoTamanho,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.pretoPrincipal),
                ),
              ),
            if (selectionCount > 0)
              Positioned(
                top: r.s(6),
                right: r.s(6),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: r.s(4),
                    vertical: r.s(2),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.erro,
                    borderRadius: BorderRadius.circular(r.s(8)),
                  ),
                  constraints: BoxConstraints(
                    minWidth: r.s(16),
                    minHeight: r.s(16),
                  ),
                  child: Text(
                    selectionCount > 99 ? '99+' : selectionCount.toString(),
                    style: TextStyle(
                      color: AppColors.textoBranco,
                      fontSize: r.legenda,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}