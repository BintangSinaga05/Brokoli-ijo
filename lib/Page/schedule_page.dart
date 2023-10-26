import 'package:basic/Component/Schedule_part/cardio.dart';
import 'package:basic/Component/Schedule_part/exercise1.dart';
import 'package:basic/Component/Schedule_part/exercise2.dart';
import 'package:basic/Component/Schedule_part/rest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    var day = provTugas2.dataCurrentdate.weekday;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF18141D)),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            if (day == 1)
              const Exercise1()
            else if (day == 2)
              const Exercise2()
            else if (day == 3)
              const Rest()
            else if (day == 4)
              const Exercise1()
            else if (day == 5)
              const Exercise2()
            else if (day == 6)
              const Cardio()
            else
              const Rest()
          ],
        ),
      ),
    );
  }
}
