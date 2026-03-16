// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transcolar_frontend/core/services/clock_services.dart';
import 'package:transcolar_frontend/core/services/user_services.dart';
import 'package:transcolar_frontend/features/home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🔥 COMENTE TEMPORARIAMENTE PARA TESTAR
  // await dotenv.load(fileName: ".env");
  
  print('🚀 Iniciando aplicação...');
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          print('⏰ Criando ClockService');
          return ClockService();
        }),
        ChangeNotifierProvider(create: (_) {
          print('👤 Criando UserService');
          return UserService();
        }),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('🏠 MyApp.build()');
    
    return MaterialApp(
      title: 'Transcolar',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'sans-serif',
      ),
      home: const HomeScreen(),
    );
  }
}