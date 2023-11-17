import 'package:basic/Page/Login&Register_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basic/Page/profile_page.dart';

class Drawerku extends StatefulWidget {
  const Drawerku({super.key, Key});

  @override
  State<Drawerku> createState() => _DrawerkuState();
}

class _DrawerkuState extends State<Drawerku> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _handleSignOut() async {
    try {
      await _auth.signOut();
      // Setelah logout berhasil, lakukan tindakan yang sesuai, seperti kembali ke layar login
    } catch (e) {
      print('Error during sign out: $e');
      // Tampilkan pesan kesalahan atau lakukan tindakan yang sesuai sesuai kebutuhan aplikasi Anda
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
        color: const Color(0xffb28242c),
        child: Column(
          children: [
            const Text(
              "StrongFit Gym",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ListTile(
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pop(); // Tutup Drawer
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            ListTile(
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () async {
                await _handleSignOut();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const Login())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
