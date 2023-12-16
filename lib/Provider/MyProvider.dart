import 'package:flutter/material.dart';

//provider yang digunakan untuk menangani data register dan login
class DataProfileProvider extends ChangeNotifier {
  String username = "";
  String email = "";
  String city = "";
  inisialisasi() {}

  int? currentIndex = 0;
  int get dataCurrentIndex => currentIndex!;
  set setCurrentIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }

  DateTime _date = DateTime.now();
  get dataCurrentdate => _date;
  set setdate(val) {
    _date = val;
    notifyListeners();
  }

  String? _uid;
  String? get uid => _uid;
  setUid(String? uid) {
    _uid = uid;
    notifyListeners();
  }

  void DataUser(String newUsername, String newEmail, String newcity) {
    username = newUsername;
    email = newEmail;
    city = newcity;
    notifyListeners();
  }
}
