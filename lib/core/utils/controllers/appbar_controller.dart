import 'package:flutter/material.dart';

class AppBarController extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void checkLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}
