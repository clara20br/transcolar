import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('🏠 DashboardScreen sendo renderizada');
    
    return Container(
      color: AppColors.begeFundo,
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
                color: AppColors.marromEscuro,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bem-vindo ao Transcolar',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.marromTexto,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.branco,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Text(
                'Sistema funcionando corretamente!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}