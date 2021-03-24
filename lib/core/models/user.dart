import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  User({String token}) : _token = token;

  String _token;

  String get token => _token;

  set token(String value) {
    _token = value;
    notifyListeners();
  }

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
  }
}
