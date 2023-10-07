import 'package:flutter/material.dart';
import 'Component/Schedule_part/rest.dart';
import '../Frans/App_bar/app_bar_screen.dart';
import '../Frans/Bottom_nav/bottom_navigation_screen.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xffb28242c),
        automaticallyImplyLeading: false,
        title: const AppBarScreen(),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF18141D)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: const BoxDecoration(color: Colors.transparent),
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "15",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Mon",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "16",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Tue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "17",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Wed",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.grey, Colors.white],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "18",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Thu",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "19",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Fri",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "20",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Sat",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "21",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Sun",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Rest()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
