import 'package:flutter/material.dart';
import 'dart:async';

class ClockService extends ChangeNotifier {
  Timer? _timer;
  DateTime _now = DateTime.now();

  ClockService() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _now = DateTime.now();
      notifyListeners();
    });
  }

  DateTime get now => _now;
  String get formattedDate => 
      '${_now.day.toString().padLeft(2, '0')}/${_now.month.toString().padLeft(2, '0')}/${_now.year} ${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}';

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}