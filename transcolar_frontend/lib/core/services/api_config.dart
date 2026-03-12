import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get baseUrl {
    // Se tiver no .env, usa esse (prioridade máxima)
    final envUrl = dotenv.env['API_URL'];
    if (envUrl != null && envUrl.isNotEmpty) return envUrl;

    // Se não tiver no .env, detecta automaticamente
    if (kIsWeb) {
      return 'http://localhost:8080'; // Para web
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080'; // Para emulador Android
    } else {
      return 'http://localhost:8080'; // Para iOS, desktop
    }
  }
}