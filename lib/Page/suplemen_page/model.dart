import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? id;
  String namasuplemen;
  String jenissuplemen;
  int hargasuplemen;

  EventModel(
      {this.id,
      required this.namasuplemen,
      required this.jenissuplemen,
      required this.hargasuplemen});

  Map<String, dynamic> toMap() {
    return {
      'namasuplemen': namasuplemen,
      'jenissuplemen': jenissuplemen,
      'hargasuplemen': hargasuplemen,
    };
  }

  EventModel.fromDocSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        namasuplemen = doc.data()?['namasuplemen'],
        jenissuplemen = doc.data()?['jenissuplemen'],
        hargasuplemen = doc.data()?['hargasuplemen'];
}
