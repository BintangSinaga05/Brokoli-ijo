import 'package:flutter/material.dart';

class Cardio extends StatefulWidget {
  const Cardio({super.key});

  @override
  State<Cardio> createState() => _CardioState();
}

class _CardioState extends State<Cardio> {
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
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/1625/1625020.png",
                    width: 50,
                  ),
                  const Text(
                    "Tofu",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "150gr",
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
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/9457/9457894.png",
                    width: 50,
                  ),
                  const Text(
                    "saltwater fish",
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
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/9951/9951801.png",
                    width: 40,
                  ),
                  const Text(
                    " Carrot",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "150gr",
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
                      "assets/jumpingjack.png",
                      width: 40,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Jumping Jack",
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
                      "assets/skipping.png",
                      width: 40,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Skipping",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "15",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "min",
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
                      "assets/jogging.png",
                      width: 40,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Jogging",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "25",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "min",
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
