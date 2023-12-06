import 'package:basic/Provider/MyProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String uid;
  late Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    uid = context.read<DataProfileProvider>().uid ?? "";
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        setState(() {
          userData = userSnapshot.data() as Map<String, dynamic>;
        });
      } else {
        print('User data not found.');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    const double topWidgetHeight = 200.0;
    const double avatarRadius = 68.0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(250, 28, 23, 33),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 190,
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 58, 10, 51)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${userData['username']}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${userData['email']}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black87),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: TextEditingController(
                          text: "${userData['city']}",
                        ),
                        decoration: const InputDecoration(
                            labelText: 'CITY',
                            labelStyle: TextStyle(color: Colors.blueGrey)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - avatarRadius - 110,
            top: topWidgetHeight - avatarRadius - 40,
            child: CircleAvatar(
              radius: avatarRadius,
              child: Image.asset("assets/profile.png"),
            ),
          ),
        ],
      ),
    );
  }
}
