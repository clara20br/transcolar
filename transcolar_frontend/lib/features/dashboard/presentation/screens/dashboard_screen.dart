import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pretoPrincipal,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dashboard,
              size: 100,
              color: AppColors.amareloMel,
            ),
            const SizedBox(height: 20),
            Text(
              'DASHBOARD',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textoBranco,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bem-vindo ao Transcolar',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textoCinza,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.fundoCard,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pretoSuave.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                'Sistema funcionando corretamente!',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textoBranco,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}