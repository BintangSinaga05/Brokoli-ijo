import 'package:basic/Provider/MyProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:basic/Page/suplemen_page/SuplemenModel.dart';
import 'package:provider/provider.dart';

class SuplemenDetailPage extends StatefulWidget {
  final EventModel suplemen;

  const SuplemenDetailPage({Key? key, required this.suplemen})
      : super(key: key);

  @override
  _SuplemenDetailPageState createState() => _SuplemenDetailPageState();
}

class _SuplemenDetailPageState extends State<SuplemenDetailPage> {
  int quantity = 1; // Initial quantity

  Future _addToCart() async {
    try {
      // Get the current user
      final uid = context.read<DataProfileProvider>().uid;

      // Check if the user is signed in
      if (uid != null) {
        // Assuming you have a users collection and a cart subcollection
        CollectionReference userCart = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart');

        // Add the product to the user's cart with quantity
        await userCart.add({
          'namasuplemen': widget.suplemen
              .namasuplemen, // Replace 'id' with your actual product ID property
          'jenissuplemen': widget.suplemen.jenissuplemen,
          'hargasuplemen': widget.suplemen.hargasuplemen,
          'gambarsuplemen': widget.suplemen.gambarsuplemen,
          'quantity': quantity
        });

        // Display a success message or perform any other action
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product added to cart'),
          ),
        );
      } else {
        // The user is not signed in, handle this case accordingly
        print('User not signed in');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error adding to cart: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.suplemen.namasuplemen),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.suplemen.gambarsuplemen,
              width: double.infinity,
              height: screenHeight * 0.3,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis: ${widget.suplemen.jenissuplemen}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Harga: ${widget.suplemen.hargasuplemen}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Deskripsi:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Tambahkan deskripsi produk suplemen di sini.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _addToCart();
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
