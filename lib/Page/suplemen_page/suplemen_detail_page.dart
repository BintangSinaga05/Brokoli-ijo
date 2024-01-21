import 'package:basic/Provider/MyProvider.dart';
import 'package:basic/style/style.dart';
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
  int quantity = 1;

  Future _addToCart() async {
    try {
      final uid = context.read<DataProfileProvider>().uid;

      if (uid != null) {
        CollectionReference userCart = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('cart');
        await userCart.add({
          'namasuplemen': widget.suplemen.namasuplemen,
          'jenissuplemen': widget.suplemen.jenissuplemen,
          'hargasuplemen': widget.suplemen.hargasuplemen,
          'gambarsuplemen': widget.suplemen.gambarsuplemen,
          'quantity': quantity
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product added to cart'),
          ),
        );
      } else {
        print('User not signed in');
      }
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorbase,
      appBar: AppBar(
        backgroundColor: colorbase,
        title: Text(
          widget.suplemen.namasuplemen,
          style: const TextStyle(color: Colors.white), // Ubah warna teks
        ),
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
                    "Type: ${widget.suplemen.jenissuplemen}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Ubah warna teks
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Price: ${widget.suplemen.hargasuplemen}",
                    style: const TextStyle(
                        fontSize: 16, color: Colors.white), // Ubah warna teks
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "description:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Ubah warna teks
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.suplemen.deskripsi,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.white), // Ubah warna teks
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
                  color: Colors.white, // Ubah warna ikon
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                      fontSize: 16, color: Colors.white), // Ubah warna teks
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  color: Colors.white, // Ubah warna ikon
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _addToCart();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Ubah warna latar belakang
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: colorbase), // Ubah warna teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}
