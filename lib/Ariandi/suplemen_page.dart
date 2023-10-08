import 'cart_page.dart';
import 'package:flutter/material.dart';

class SuplemenPage extends StatefulWidget {
  const SuplemenPage({Key? key}) : super(key: key);

  @override
  State<SuplemenPage> createState() => _SuplemenPageState();
}

class _SuplemenPageState extends State<SuplemenPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF18141D),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, screenHeight * 0.02, 10, 0),
                child: Text(
                  "Suplemen Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            // Widget Search
            Container(
              margin: EdgeInsets.fromLTRB(
                screenWidth * 0.1,
                screenHeight * 0.02,
                screenWidth * 0.1,
                screenHeight * 0.02,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: screenWidth * 0.05,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    _buildSupplementItem(
                      "Evolene BCAA Branch Chain 350 Gram",
                      "BCCA",
                      "Rp 440.000",
                      "assets/suplemen2.jpeg",
                      screenWidth,
                    ),
                    _buildSupplementItem(
                      "M1 Muscle First Gold Pro Creatine 350 Gram",
                      "Creatine",
                      "Rp 550.000",
                      "assets/suplemen1.jpeg",
                      screenWidth,
                    ),
                    _buildSupplementItem(
                      "Universal Fat Burner 55 Tablet",
                      "Fat Burner",
                      "Rp 440.000",
                      "assets/suplemen3.jpeg",
                      screenWidth,
                    ),
                    _buildSupplementItem(
                      "Evolene Evomass Gainer 2 lbs 912 Gram",
                      "Gainer",
                      "Rp 193.000",
                      "assets/suplemen4.jpeg",
                      screenWidth,
                    ),
                    // Tambahkan item lain jika diperlukan
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: const Text("Lihat Keranjang"),
            ),
            SizedBox(
              height: screenHeight * 0.001,
            ), // Added some extra spacing at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildSupplementItem(
    String name,
    String category,
    String price,
    String assetPath,
    double screenWidth,
  ) {
    return Container(
      margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            width: screenWidth * 0.2,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.4,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.fromLTRB(15, 0, 7, 0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth * 0.15,
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
