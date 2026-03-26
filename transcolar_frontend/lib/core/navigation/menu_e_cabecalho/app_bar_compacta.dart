import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/clock_services.dart';
import 'package:transcolar_frontend/core/services/responsive_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/core/theme/text.style.dart';

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

  @override
  Widget build(BuildContext context) {
    final clock = context.watch<ClockService>();
    final r = ResponsiveService(context);

    if (r.isTablet) {
      return _tablet(context, r, clock);
    }

    return _desktop(context, r, clock);
  }

  BoxDecoration _decoracao() {
    return BoxDecoration(
      color: AppColors.pretoSuave,
      boxShadow: [
        BoxShadow(
          color: AppColors.pretoPrincipal.withValues(alpha: 0.5),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

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
          Expanded(flex: 4, child: _titulo(context)),
          const Spacer(flex: 1),
          _relogio(r, clock),
          SizedBox(width: r.espaco * 2.5),
          Expanded(
            flex: 3,
            child: Align(alignment: Alignment.centerRight, child: _usuario(r)),
          ),
        ],
      ),
    );
  }

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
          Expanded(flex: 8, child: _titulo(context)),
          const Spacer(flex: 1),
          if (!r.isTabletPequeno) ...[
            _relogio(r, clock),
            SizedBox(width: r.espaco * 3.0),
          ],
          Expanded(
            flex: 4,
            child: Align(alignment: Alignment.centerRight, child: _usuario(r)),
          ),
        ],
      ),
    );
  }

  Widget _titulo(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sistema de Transporte Escolar',
        style: AppTextStyles.titulo(context).copyWith(color: AppColors.amareloMel),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

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
          Text(
            clock.formattedDate,
            style: TextStyle(
              fontSize: r.corpo * 0.9,
              color: AppColors.textoCinza,
              fontFamily: 'Consolas',
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          SizedBox(height: r.espaco * 0.3),
          Text(
            _obterTurnoEscolar(clock),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: r.legenda * 0.95,
              color: AppColors.amareloMelClaro,
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

  Widget _usuario(ResponsiveService r) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            nomeUsuario,
            style: TextStyle(
              color: AppColors.textoBranco,
              fontSize: r.corpo,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: r.espaco),
        Container(
          width: r.avatar,
          height: r.avatar,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Image.asset(
              caminhoAvatar, 
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(
                Icons.person,
                color: AppColors.amareloMel,
                size: r.avatar,
              ),
            ),
          ),
        ),
      ],
    );
  }
}