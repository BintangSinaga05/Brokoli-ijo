import 'dart:convert';
import 'dart:math';

import 'package:basic/Page/suplemen_page/cart_page.dart';
import 'package:basic/Page/suplemen_page/model.dart';
import 'package:basic/style/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SuplemenPage extends StatefulWidget {
  const SuplemenPage({Key? key}) : super(key: key);

  @override
  State<SuplemenPage> createState() => _SuplemenPageState();
}

class _SuplemenPageState extends State<SuplemenPage> {
  List<EventModel> details = [];
  TextEditingController searchController = TextEditingController();
  List<EventModel> filteredSuplemenList = [];

  @override
  void initState() {
    readData();
    super.initState();
  }

  Future testData() async {
    await Firebase.initializeApp();
    print('init done');
    FirebaseFirestore db = FirebaseFirestore.instance;
    print('init Firestore Done');

    var data = await db.collection('suplemen_shop').get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  Future readData() async {
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('suplemen_shop').get();
    setState(() {
      details =
          data.docs.map((doc) => EventModel.fromDocSnapshot(doc)).toList();
      filteredSuplemenList =
          details; // Inisialisasi filteredSuplemenList dengan data awal
    });
  }

  void filterSuplemen(String query) {
    setState(() {
      filteredSuplemenList = details
          .where((suplemen) =>
              suplemen.namasuplemen
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              suplemen.jenissuplemen
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  // addRand() async {
  //   await Firebase.initializeApp();
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   String getRandString(int len) {
  //     var random = Random.secure();
  //     var values = List<int>.generate(len, (i) => random.nextInt(255));
  //     return base64UrlEncode(values);
  //   }

  //   EventModel InsertData = EventModel(
  //       judul: getRandString(5),
  //       keterangan: getRandString(30),
  //       tanggal: getRandString(10),
  //       islike: Random().nextBool(),
  //       pembicara: getRandString(20));
  //   await db.collection("suplemen_shop").add(InsertData.toMap());
  //   setState(() {
  //     details.add(InsertData);
  //   });
  // }

  deleteLast(String documentId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("suplemen_shop").doc(documentId).delete();
    setState(() {
      details.removeLast();
    });
  }

  // updateEvent(int pos) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   await db
  //       .collection("suplemen_shop")
  //       .doc(details[pos].id)
  //       .update({'islike': !details[pos].islike});
  //   setState(() {
  //     details[pos].islike = !details[pos].islike;
  //   });
  // }

  // void filterSuplemen(String query) {
  //   setState(() {
  //     filteredSuplemenList = suplemenList
  //         .where((suplemen) =>
  //             suplemen['name'].toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: colorbase,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, screenHeight * 0.01, 10, 0),
                child: Text(
                  "Suplemen Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            // Widget Search
            Container(
              margin: EdgeInsets.fromLTRB(
                screenWidth * 0.1,
                screenHeight * 0.02,
                screenWidth * 0.1,
                screenHeight * 0.02,
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                onChanged: (query) {
                  filterSuplemen(query);
                },
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
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: screenWidth * 0.05,
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: filteredSuplemenList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      // leading: Image.network(filteredSuplemenList[index].imageUrl),
                      title: Text(filteredSuplemenList[index].namasuplemen),
                      subtitle: Text(filteredSuplemenList[index].jenissuplemen),
                      trailing: const Text("Add to Cart")),
                );
              },
            )),
            // Expanded(
            //   child: Scrollbar(
            //     child: ListView(
            //       padding: const EdgeInsets.all(0),
            //       children:
            //           _buildSupplementItems(filteredSuplemenList, screenWidth),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: screenHeight * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Jual Barang"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  child: const Text("Lihat Ke ranjang"),
                ),
              ],
            ),

            SizedBox(
              height: screenHeight * 0.001,
            ), // Added some extra spacing at the bottom
          ],
        ),
      ),
    );
  }
}
