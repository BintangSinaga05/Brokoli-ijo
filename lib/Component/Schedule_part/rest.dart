import 'package:basic/Provider/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Rest extends StatefulWidget {
  const Rest({super.key});

  @override
  State<Rest> createState() => _RestState();
}

class _RestState extends State<Rest> {
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<DataProfileProvider>();
    final picked = provTugas2.dataCurrentdate;
    final formatteddate = DateFormat("MMMM dd").format(picked);
    final now = DateTime.now();
    final nowDate = DateTime(now.year, now.month, now.day);
    final result = (nowDate == picked) ? 'Today' : 'on $formatteddate';
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
                child: Text(
                  "Food Recommendation $result",
                  style: const TextStyle(
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
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "$result Is a Rest Day",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: AutofillHints.addressCity),
                    ),
                    const SizedBox(
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
