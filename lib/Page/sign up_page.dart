// ignore: file_names
import 'package:basic/Page/login_page.dart';
import 'package:basic/Page/register_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Welcome to Strongfit",
                    style: TextStyle(
                      fontSize: 0.08 * screenWidth, // Responsif
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.04 * screenWidth, // Responsif
                ),
                Text(
                  "Chose your favorite fitness trainer",
                  style: TextStyle(
                      fontSize: 0.04 * screenWidth, // Responsif
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "and never have a bad workout again.",
                  style: TextStyle(
                      fontSize: 0.04 * screenWidth, // Responsif
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 0.04 * screenWidth, // Responsif
                ),

                // Button "Sign Up"
                SizedBox(
                  width: 0.70 * screenWidth, // Responsif
                  height: 0.12 * screenWidth, // Responsif
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.amber,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 0.05 * screenWidth, // Responsif
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.015 * screenWidth, // Responsif
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.06 * screenWidth, // Responsif
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
