import 'package:basic/Bintang/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Ariandi/member_page.dart';
import '../Ariandi/suplemen_page.dart';
import '../Bintang/Provider/Provider.dart';
import '../Frans/App_bar/app_bar_screen.dart';
import '../Frans/Bottom_nav/bottom_navigation_screen.dart';
import '../Reza/trainer_page.dart';

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
      TrainerPage(),
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
