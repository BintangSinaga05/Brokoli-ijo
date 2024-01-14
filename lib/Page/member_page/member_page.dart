import 'package:basic/style/style.dart';
import 'package:flutter/material.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  _MembershipState createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbase,
      appBar: AppBar(
        backgroundColor: colorbase,
        title: const Text(
          'Buy Membership',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MembershipCard(
            name: 'Basic Membership',
            description: 'Access to basic gym facilities',
            price: '\$30/month',
            icon: Icons.accessibility,
            onPressed: () {
              // Handle buy button click
              setState(() {
                isButtonPressed = true;
              });
            },
            isButtonPressed: isButtonPressed,
          ),
          const SizedBox(height: 16),
          MembershipCard(
            name: 'Premium Membership',
            description: 'Full access to all gym facilities and classes',
            price: '\$50/month',
            icon: Icons.star,
            onPressed: () {
              // Handle buy button click
              setState(() {
                isButtonPressed = true;
              });
            },
            isButtonPressed: isButtonPressed,
          ),
          const SizedBox(height: 16),
          MembershipCard(
            name: 'Deluxe Membership',
            description: 'VIP access, personal trainer, and more',
            price: '\$100/month',
            icon: Icons.card_giftcard,
            onPressed: () {
              // Handle buy button click
              setState(() {
                isButtonPressed = true;
              });
            },
            isButtonPressed: isButtonPressed,
          ),
        ],
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isButtonPressed;

  const MembershipCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.onPressed,
    required this.isButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xffb28242c), // Set the desired color here
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isButtonPressed ? null : onPressed,
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
