import 'package:flutter/material.dart';

class TrainerPage extends StatelessWidget {
  TrainerPage({Key? key}) : super(key: key);

  final List<TrainerData> trainers = [
    TrainerData(
      name: "James Doe",
      gym: "Trainer Gym",
      experience: "8 Years",
      rating: "95 %",
      foto: "Trainer1.jpeg",
    ),
    TrainerData(
      name: "Richard",
      gym: "Trainer Gym",
      experience: "10 Years",
      rating: "90 %",
      foto: "Trainer2.jpeg",
    ),
    TrainerData(
      name: "Adam Smith",
      gym: "Trainer Gym",
      experience: "20 Years",
      rating: "100 %",
      foto: "Trainer3.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF18141D)),
        child: ListView.builder(
          itemCount: trainers.length,
          itemBuilder: (context, index) {
            return TrainerCard(trainerData: trainers[index]);
          },
        ),
      ),
    );
  }
}

class TrainerData {
  final String name;
  final String gym;
  final String experience;
  final String rating;
  final String foto;

  TrainerData({
    required this.name,
    required this.gym,
    required this.experience,
    required this.rating,
    required this.foto,
  });
}

class TrainerCard extends StatelessWidget {
  final TrainerData trainerData;

  const TrainerCard({super.key, required this.trainerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.asset(
            "assets/${trainerData.foto}",
            width: 150,
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trainerData.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  trainerData.gym,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/trainerlogo.png",
                            width: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(trainerData.experience),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Icon(Icons.thumb_up),
                          Text(trainerData.rating),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 15),
                  child: const Row(
                    children: [
                      Icon(Icons.contact_page),
                      Text("Contact"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrainerPage(),
  ));
}
