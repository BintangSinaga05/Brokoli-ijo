import 'package:basic/Ariandi/suplemen_page.dart';
import 'package:basic/Frans/App_bar/app_bar_screen.dart';
import 'package:basic/Frans/Bottom_nav/bottom_navigation_screen.dart';
import 'package:basic/Bintang/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Bintang/Provider/Provider.dart';
import '../Reza/trainer_page.dart';
import 'member_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    final List body = [
      const SchedulePage(),
      const TrainerPage(),
      const MemberPage(),
      const SuplemenPage(),
    ];

    final List appBar = [
      const AppBarScreen(),
      const AppBarScreen(),
      const AppBarScreen(),
      const AppBarScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xffb28242c),
        automaticallyImplyLeading: false,
        title: appBar[provTugas2.dataCurrentIndex],
      ),
      body: body[provTugas2.dataCurrentIndex],
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
