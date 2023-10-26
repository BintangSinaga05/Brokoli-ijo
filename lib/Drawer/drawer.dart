import 'package:flutter/material.dart';
import 'package:basic/Page/profile_page.dart';

class Drawerku extends StatefulWidget {
  const Drawerku({super.key, Key});

  @override
  State<Drawerku> createState() => _DrawerkuState();
}

class _DrawerkuState extends State<Drawerku> {
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
          ],
        ),
      ),
    );
  }
}
