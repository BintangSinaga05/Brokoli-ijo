import 'package:basic/style/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basic/Provider/MyProvider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final uid = context.read<DataProfileProvider>().uid;
    return Scaffold(
      backgroundColor: colorbase,
      appBar: AppBar(
        backgroundColor: colorbase,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const Text(
              "C A R T",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('cart')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error loading data.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            QuerySnapshot<Map<String, dynamic>> querySnapshot = snapshot.data!;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> cartDocuments =
                querySnapshot.docs;

            // Check if the subcollection "cart" is empty
            if (cartDocuments.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            List<Map<String, dynamic>> cartItems =
                cartDocuments.map((document) {
              Map<String, dynamic> data = document.data();

              return data;
            }).toList();

            return Column(
              children: [
                // Main
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: colorbase),
                    child: Column(
                      children: cartItems.map((cartItem) {
                        return Container(
                          decoration: BoxDecoration(color: Colors.grey[700]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 90,
                                    child: Image.network(
                                      cartItem['gambarsuplemen'] ?? '',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 125,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem['namasuplemen'] ?? '',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Rp ${cartItem['hargasuplemen']?.toString() ?? ''}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.remove_circle,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    cartItem['quantity']?.toString() ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                // Total belanjaan
                Container(
                  decoration: const BoxDecoration(color: Color(0xffb28242c)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "Rp ${cartItems.fold<double>(
                                  0,
                                  (previousValue, cartItem) =>
                                      previousValue +
                                      (cartItem['hargasuplemen'] as num? ??
                                          0.0),
                                ).toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 199, 103, 216),
                          ),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
