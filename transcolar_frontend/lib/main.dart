// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/clock_services.dart';
import 'package:transcolar_frontend/core/services/user_services.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/features/auth/presentation/providers/auth_provider.dart';
import 'package:transcolar_frontend/features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(const TranscolarApp());
}

class TranscolarApp extends StatelessWidget {
  const TranscolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => ClockService()),
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Adicionado
      ],
      child: MaterialApp(
        title: 'Transcolar - Transporte Escolar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.amareloMel,
          colorScheme: ColorScheme.dark(
            primary: AppColors.amareloMel,
            secondary: AppColors.amareloMelEscuro,
            error: AppColors.erro,
            surface: AppColors.fundoCard,
            background: AppColors.pretoPrincipal,
          ),
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: const LoginScreen(), // Mudar para LoginScreen
      ),
    );
  }
}