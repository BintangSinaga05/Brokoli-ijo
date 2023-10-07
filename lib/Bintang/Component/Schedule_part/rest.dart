import 'package:flutter/material.dart';

class Rest extends StatefulWidget {
  const Rest({super.key});

  @override
  State<Rest> createState() => _RestState();
}

class _RestState extends State<Rest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  "Food Recommendation Today",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressCity),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/longbean.png",
                    width: 40,
                  ),
                  const Text(
                    "Long bean",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "200gr",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/chickenbreast.png",
                    width: 40,
                  ),
                  const Text(
                    "chicken breast",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "200gr",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/oats.png",
                    width: 40,
                  ),
                  const Text(
                    "Oats",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "300gr",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          padding: const EdgeInsets.all(10),
          width: 300,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    const Text(
                      "Today Is A Rest Day",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: AutofillHints.addressCity),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/rest.png",
                      width: 70,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
