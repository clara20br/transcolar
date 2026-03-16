import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConfig {
  static String get baseUrl {
    // Para web
    if (kIsWeb) {
      return 'http://localhost:8080'; // Para web
    } 
    // Para Android emulador
    else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080'; 
    } 
    // Para iOS, desktop
    else {
      return 'http://localhost:8080';
    }
  }
}