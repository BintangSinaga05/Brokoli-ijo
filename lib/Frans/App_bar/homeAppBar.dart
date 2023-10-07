import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Bintang/Provider/Provider.dart';
import '../../Reza/profile_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    return ListTile(
      leading: IconButton(
        icon: Image.network(
            "https://cdn-icons-png.flaticon.com/128/2202/2202112.png"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        },
      ),
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${provTugas2.email}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Text(
              "+62895-1232-6689",
              style: TextStyle(color: Colors.white38),
            ),
          ],
        ),
      ),
    );
  }
}
