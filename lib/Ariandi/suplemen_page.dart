import 'cart_page.dart';
import 'package:flutter/material.dart';

class SuplemenPage extends StatefulWidget {
  const SuplemenPage({super.key});

  @override
  State<SuplemenPage> createState() => _SuplemenPageState();
}

class _SuplemenPageState extends State<SuplemenPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF18141D),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Suplemen Shop",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            //Widget Search
            Container(
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                width: 400,
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                  ),
                )),

            Container(
              margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/suplemen2.jpeg",
                    width: 80,
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text(
                          "Evolene BCAA Branch Chain 350 Gram",
                          style: TextStyle(
                            fontSize: 10,
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
                        child: const Text(
                          "BCCA",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Rp 250.000",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(15, 0, 7, 0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    width: 50,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/suplemen1.jpeg",
                    width: 80,
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text(
                          "M1 Muscle First Gold Pro Creatine 350 Gram",
                          style: TextStyle(
                            fontSize: 10,
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
                        child: const Text(
                          "Creatine",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Rp 440.000",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(15, 0, 7, 0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    width: 50,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/suplemen3.jpeg",
                    width: 80,
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text(
                          "Universal Fat Burner 55 Tablet",
                          style: TextStyle(
                            fontSize: 10,
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
                        child: const Text(
                          "Fat Burner",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Rp 550.000",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(15, 0, 7, 0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    width: 50,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/suplemen4.jpeg",
                    width: 80,
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text(
                          "Evolene Evomass Gainer 2 lbs 912 Gram",
                          style: TextStyle(
                            fontSize: 10,
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
                        child: const Text(
                          "Gainer",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Rp 193.000",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(15, 0, 7, 0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    width: 50,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                child: const Text("Lihat Keranjang"))
          ],
        ),
      ),
    );
  }
}
