import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class TelaDespedida extends StatelessWidget {
  const TelaDespedida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pretoPrincipal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.exit_to_app, size: 80, color: AppColors.sucesso),
            const SizedBox(height: 20),
            Text(
              'Até logo!',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: AppColors.textoBranco,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Sessão encerrada com sucesso.',
              style: TextStyle(color: AppColors.textoCinza),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.amareloMel,
                foregroundColor: AppColors.pretoPrincipal,
              ),
              child: const Text('Voltar ao Login'),
            ),
          ],
        ),
      ),
    );
  }
}