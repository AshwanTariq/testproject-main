import 'package:flutter/material.dart';

class User with ChangeNotifier {
  late String _email;
  late String _password;

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }
}
