import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';

class ClienteListScreen extends StatelessWidget {
  const ClienteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('👥 ClienteListScreen renderizada');
    
    return Container(
      color: AppColors.begeFundo,
      child: const Center(
        child: Text(
          'Lista de Clientes - Em construção',
          style: TextStyle(fontSize: 24, color: AppColors.marromEscuro),
        ),
      ),
    );
  }
}