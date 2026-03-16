// 📁 features/home/components/cabecalho_desktop_global.dart

import 'package:flutter/material.dart';



import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/clock_services.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';

/// ========================================================================
/// 🖥️ CABEÇALHO GLOBAL (DESKTOP / TABLET) - VERSÃO CORRIGIDA
///
/// ARQUITETURA: Mobile-first + BASE + ESCALA
/// PRINCÍPIO: Nunca use valores hardcoded, sempre use BASE × ESCALA
/// ========================================================================
class CabecalhoDesktop extends StatelessWidget {
  final String nomeUsuario;
  final String caminhoAvatar;
  final VoidCallback? aoPressionarPesquisa;

  const CabecalhoDesktop({
    super.key,
    required this.nomeUsuario,
    required this.caminhoAvatar,
    this.aoPressionarPesquisa,
  });

  // ============================================================
  // 🏗️ BUILD PRINCIPAL
  // ============================================================
  @override
  Widget build(BuildContext context) {
    final clock = context.watch<ClockService>();
    final r = ResponsiveService(context);

    if (r.isTablet) {
      return _tablet(context, r, clock);
    }

    return _desktop(context, r, clock);
  }

  // ============================================================
  // 🎨 DECORAÇÃO (FIXO - NÃO ESCALA)
  // ============================================================
  BoxDecoration _decoracao() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.verdeEscuro, AppColors.verdeMedia],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 64),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // ============================================================
  // 🖥️ VERSÃO DESKTOP (BASE × ESCALA)
  // ============================================================
  Widget _desktop(
    BuildContext context,
    ResponsiveService r,
    ClockService clock,
  ) {
    return Container(
      height: r.cabecalho,
      padding: EdgeInsets.symmetric(horizontal: r.espaco),
      decoration: _decoracao(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🏷️ TÍTULO (ESQUERDA)
          Expanded(flex: 4, child: _titulo(context)),

          // 🔹 RESPIRO CENTRAL
          const Spacer(flex: 1),

          // ⏰ RELÓGIO
          _relogio(r, clock),

          SizedBox(width: r.espaco * 2.5),

          // 👤 BLOCO DIREITO (FORÇA BORDA)
          Expanded(
            flex: 3,
            child: Align(alignment: Alignment.centerRight, child: _usuario(r)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 📱 VERSÃO TABLET (BASE × ESCALA) — ALINHAMENTO REAL
  // ============================================================
  Widget _tablet(
    BuildContext context,
    ResponsiveService r,
    ClockService clock,
  ) {
    return Container(
      height: r.cabecalho,
      padding: EdgeInsets.symmetric(horizontal: r.espaco),
      decoration: _decoracao(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🏷️ TÍTULO (ESQUERDA)
          Expanded(flex: 8, child: _titulo(context)),

          // 🔹 RESPIRO CENTRAL
          const Spacer(flex: 1),

          // ⏰ RELÓGIO (SÓ TABLET GRANDE)
          if (!r.isTabletPequeno) ...[
            _relogio(r, clock),
            SizedBox(width: r.espaco * 3.0),
          ],

          // 👤 BLOCO DIREITO (COLADO NA BORDA)
          Expanded(
            flex: 4,
            child: Align(alignment: Alignment.centerRight, child: _usuario(r)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 🏷️ TÍTULO DO SISTEMA
  // ============================================================
  Widget _titulo(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sistema de Transporte Escolar',
        style: AppTextStyles.titulo(context), // 🎯 JÁ ESCALADO
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // ============================================================
  // ⏰ RELÓGIO COM TURNO ESCOLAR
  // ============================================================
  Widget _relogio(ResponsiveService r, ClockService clock) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: r.larguraRelogio,
        maxWidth: r.larguraRelogio,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 📅 DATA
          Text(
            clock.formattedDate,
            style: TextStyle(
              fontSize: r.corpo * 0.9,
              color: AppColors.begeFundo,
              fontFamily: 'Consolas',
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),

          SizedBox(height: r.espaco * 0.3),

          // 🚌 TURNO ESCOLAR (baseado na hora)
          Text(
            _obterTurnoEscolar(clock),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: r.legenda * 0.95,
              color: AppColors.branco,
              fontStyle: FontStyle.italic,
              height: 1.15,
            ),
          ),
        ],
      ),
    );
  }

  String _obterTurnoEscolar(ClockService clock) {
    final hora = DateTime.now().hour;
    
    if (hora >= 5 && hora < 8) return '🌅 Turno Matutino';
    if (hora >= 8 && hora < 12) return '🏫 Em Aula';
    if (hora >= 12 && hora < 14) return '🍽️ Intervalo';
    if (hora >= 14 && hora < 17) return '🌤️ Turno Vespertino';
    if (hora >= 17 && hora < 19) return '🚌 Retorno Escolar';
    if (hora >= 19 && hora < 23) return '🌙 Turno Noturno';
    return '😴 Sem Transporte';
  }

  // ============================================================
  // 👤 INFORMAÇÕES DO USUÁRIO
  // ============================================================
  Widget _usuario(ResponsiveService r) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 📝 NOME DO USUÁRIO
        Flexible(
          child: Text(
            nomeUsuario,
            style: TextStyle(
              color: AppColors.branco,
              fontSize: r.corpo, // 🎯 BASE: 14px × ESCALA
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // 📏 ESPAÇAMENTO ESCALADO
        SizedBox(width: r.espaco), // 🎯 BASE: 4px × ESCALA
        // 🖼️ AVATAR DO USUÁRIO (SEM FUNDO)
        Container(
          width: r.avatar,
          height: r.avatar,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(child: Image.asset(caminhoAvatar, fit: BoxFit.cover)),
        ),

        /* // 🔍 BOTÃO DE PESQUISA (OPCIONAL)
        if (aoPressionarPesquisa != null) ...[
          SizedBox(width: r.espaco), // 🎯 BASE: 4px × ESCALA
          IconButton(
            onPressed: aoPressionarPesquisa,
            icon: Icon(
              Icons.search,
              size: r.icone, // 🎯 BASE: 20px × ESCALA
              color: AppColors.branco,
            ),
          ),
        ],
        */
      ],
    );
  }
}