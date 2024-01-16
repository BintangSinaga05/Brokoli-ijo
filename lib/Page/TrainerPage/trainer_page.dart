import 'package:basic/Page/TrainerPage/Trainer_register.dart';
import 'package:basic/Page/TrainerPage/trainer_detail_page.dart';
import 'package:basic/Provider/MyProvider.dart';
import 'package:provider/provider.dart';

import 'TrainerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:basic/style/style.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TrainerPage(),
    );
  }
}

class TrainerPage extends StatefulWidget {
  const TrainerPage({Key? key}) : super(key: key);

  @override
  _TrainerPageState createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage>
    with AutomaticKeepAliveClientMixin {
  List<EventModel> details = [];
  List<EventModel> filteredTrainerList = [];
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    readData();
    super.initState();
  }

  Future<bool> _checkIfUserIsTrainer() async {
    final uid = context.read<DataProfileProvider>().uid;
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (docSnapshot.exists) {
      final isTrainer = docSnapshot.data()?['Trainer'] ?? false;
      return isTrainer;
    } else {
      return false;
    }
  }

  Future<void> _showAlreadyRegisteredPopup() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Anda sudah terdaftar sebagai trainer'),
          content:
              const Text('Anda tidak dapat mendaftar sebagai trainer lagi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future readData() async {
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('trainer_data').get();
    setState(() {
      details =
          data.docs.map((doc) => EventModel.fromDocSnapshot(doc)).toList();
      filteredTrainerList = details;
    });
  }

  void filterTrainer(String query) {
    if (mounted) {
      setState(() {
        filteredTrainerList = details
            .where((trainer) =>
                trainer.namatrainer
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                trainer.jenistrainer
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: colorbase,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: colorbase,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: search,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: 'Search',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onChanged: (query) {
                            filterTrainer(query);
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _checkIfUserIsTrainer().then((isTrainer) {
                            if (isTrainer) {
                              _showAlreadyRegisteredPopup();
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TrainerRegister()));
                            }
                          });
                        },
                        child: const Text("Daftar Trainer"),
                      )
                    ],
                  ),
                ),
              ),
              for (var trainer in filteredTrainerList)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TrainerDetailPage(trainer: trainer),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd9d9d9), // Slightly lighter color
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.network(
                          trainer.gambartrainer,
                          width: screenWidth * 0.4,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trainer.namatrainer,
                                style: TextStyle(
                                  color: Colors.black, // Change text color
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'pengalaman: ${trainer.pengalaman}', // Display age
                                style: const TextStyle(
                                  color: Colors.black, // Change text color
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Tap untuk lebih detail', // Visual cue for clickability
                                style: TextStyle(
                                  color: Colors.blue, // Change color as needed
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of resources, timers, etc.
    super.dispose();
  }
}
