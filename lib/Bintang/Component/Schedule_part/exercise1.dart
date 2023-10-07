import 'package:flutter/material.dart';

class Exercise1 extends StatefulWidget {
  const Exercise1({super.key});

  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
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
                    "assets/rice.png",
                    width: 50,
                  ),
                  const Text(
                    "Rice",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "100gr",
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
                    "assets/manuk.png",
                    width: 50,
                  ),
                  const Text(
                    "Chicken Wings",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "50gr",
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
                    "assets/brocoli.png",
                    width: 50,
                  ),
                  const Text(
                    "Brocoli",
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
                height: 0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Your Task Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressCity),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/squad.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Squad",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "30",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "reps",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/dumblepress.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Dumble Press",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "30",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "reps",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/situp.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Sit Up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "30",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "reps",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
