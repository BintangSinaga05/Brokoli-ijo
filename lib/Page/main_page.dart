import 'package:basic/App_bar/app_bar_screen.dart';
import 'package:basic/Bottom_nav/bottom_navigation_screen.dart';
import 'package:basic/Drawer/drawer.dart';
import 'package:basic/Page/member_page/member_page.dart';
import 'package:basic/Page/schedule_page.dart';
import 'package:basic/Page/suplemen_page/suplemen_page.dart';
import 'package:basic/Page/TrainerPage/trainer_page.dart';
import 'package:basic/Provider/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<DataProfileProvider>();
    final List body = [
      const SchedulePage(),
      const TrainerPage(),
      const MemberPage(),
      const SuplemenPage(),
    ];

    return Scaffold(
      appBar: const AppBarScreen(),
      body: body[provTugas2.dataCurrentIndex],
      drawer: const Drawerku(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
