import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  String _nome = 'Usuário Teste';
  String _avatar = 'assets/imagens/avatar_padrao.png';

  String get nome => _nome;
  String get avatar => _avatar;

  void setUser(String nome, String avatar) {
    _nome = nome;
    _avatar = avatar;
    notifyListeners();
  }
}