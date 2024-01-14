import 'package:flutter/material.dart';

class DataProfileProvider extends ChangeNotifier {
  String username = "";
  String email = "";
  String city = "";
  String? profilephoto; // Updated to allow null
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

  // Metode untuk mengupdate profile photo
  void updateProfilePhoto(String? newProfilePhoto) {
    profilephoto = newProfilePhoto;
    notifyListeners();
  }

  // Metode untuk mengupdate semua data pengguna
  void updateUserData(String newUsername, String newEmail, String newCity,
      String? newProfilePhoto) {
    // Updated to allow null
    username = newUsername;
    email = newEmail;
    city = newCity;
    profilephoto = newProfilePhoto;
    notifyListeners();
  }
}
