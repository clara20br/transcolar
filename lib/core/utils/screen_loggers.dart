import 'package:flutter/material.dart';

class ScreenLogger {
  static void logScreenInfo(BuildContext context, {String tag = ''}) {
    if (tag.isNotEmpty) debugPrint('📱 $tag');
  }

  static void logOnChange(BuildContext context) {
    // Implementar conforme necessidade
  }
}