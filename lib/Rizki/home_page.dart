import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.home, color: Colors.white, size: 50),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(244, 238, 238, 228),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 370,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Schedule",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe8dcf4),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 370,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/7439/7439276.png",
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Trainer",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe0c4dc),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 370,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/5455/5455768.png",
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Membership",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffe8f4fc),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 370,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/4257/4257086.png",
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Suplemen",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
