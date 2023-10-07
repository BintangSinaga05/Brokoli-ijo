import 'package:basic/Rizki/register_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background2.jpg"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: const Text(
                    "Are you new?",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontFamily: AutofillHints.countryName,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: const Text(
                    "Chose your favorite fitness trainer",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: AutofillHints.countryName,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  child: const Text(
                    "and never have a bad workout again.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: AutofillHints.countryName,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                //button "Sign Up"
                SizedBox(
                  width: 250,
                  height: 50,
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
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
