import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
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
                    "https://cdn-icons-png.flaticon.com/128/10347/10347767.png",
                    width: 50,
                  ),
                  const Text(
                    "Tempe",
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
                    "https://cdn-icons-png.flaticon.com/128/702/702559.png",
                    width: 50,
                  ),
                  const Text(
                    "Eggs",
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
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/3944/3944258.png",
                    width: 40,
                  ),
                  const Text(
                    "Spinach",
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
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/shoulderpress.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Shoulder Press",
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
                      "assets/dips.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Dips",
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
                      "assets/lateralraise.png",
                      width: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Lateral Raise",
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
