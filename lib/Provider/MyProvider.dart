import 'package:basic/Page/suplemen_page/SuplemenModel.dart';
import 'package:flutter/material.dart';

//provider yang digunakan untuk menangani data register dan login
class DataProfileProvider extends ChangeNotifier {
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
}

class SuplemenProvider extends ChangeNotifier {
  List<EventModel> _filteredSuplemenList = [];

  List<EventModel> get filteredSuplemenList => _filteredSuplemenList;

  void updateFilteredSuplemenList(List<EventModel> newList) {
    _filteredSuplemenList = newList;
    notifyListeners();
  }
}
