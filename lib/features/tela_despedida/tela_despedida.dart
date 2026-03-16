// lib/features/tela_despedida/tela_despedida.dart
import 'package:flutter/material.dart';

class TelaDespedida extends StatelessWidget {
  const TelaDespedida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.exit_to_app, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Até logo!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Sessão encerrada com sucesso.'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Voltar ao Login'),
            ),
          ],
        ),
      ),
    );
  }
}