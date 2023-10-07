import 'package:flutter/material.dart';

class ProviderTugas2 extends ChangeNotifier {
  inisialisasi() {}

  int? currentIndex = 0;
  int get dataCurrentIndex => currentIndex!;
  set setCurrentIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }

  String? username;
  String get dataCurrentUsername => username!;
  set setUsername(String val) {
    username = val;
    notifyListeners();
  }

  String? email;
  String get dataCurrentEmail => email!;
  set setEmail(String val) {
    email = val;
    notifyListeners();
  }

  String? emailLogin;
  String get dataCurrentEmailLogin => emailLogin!;
  set setEmailLogin(String val) {
    emailLogin = val;
    notifyListeners();
  }

  String? password;
  String get dataCurrentPassword => password!;
  set setPassword(String val) {
    password = val;
    notifyListeners();
  }

  String? passwordLogin;
  String get dataCurrentPasswordLogin => passwordLogin!;
  set setPasswordLogin(String val) {
    passwordLogin = val;
    notifyListeners();
  }

  String? confPassword;
  String get dataCurrentConfPassword => confPassword!;
  set setConfPassword(String val) {
    confPassword = val;
    notifyListeners();
  }

  bool? obsPassword = true;
  bool get dataCurrentObsPassword => obsPassword!;
  set setObsPassword(bool val) {
    obsPassword = val;
    notifyListeners();
  }

  DateTime _date = DateTime.now();
  get dataCurrentdate => _date;
  set setdate(val) {
    _date = val;
    notifyListeners();
  }
}
