import 'package:basic/Page/sign%20up_page.dart';
import 'package:basic/Provider/MyProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Map<String, dynamic> userData = {};
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoggingIn = false;

  Future<String?> _loginUser() async {
    setState(() {
      isLoggingIn = true;
    });

    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final email = _emailController.text;
      final password = _passwordController.text;

      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user?.uid ?? "";
      context.read<DataProfileProvider>().setUid(uid);

      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        userData = userSnapshot.data() as Map<String, dynamic>;
      });

      context.read<DataProfileProvider>().updateUserData(userData['username'],
          userData['email'], userData['city'], userData['profilephoto']);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
      return 'login berhasil';
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message ?? "An Error occured", gravity: ToastGravity.TOP);
    } finally {
      setState(() {
        isLoggingIn = false;
      });
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        TextField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Masukkan Email Anda',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _passwordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Password',
                            hintText: 'Masukkan Password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        Column(
                          children: [
                            SizedBox(
                                width: screenWidth * 0.7,
                                height: screenHeight * 0.06,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String? loginStatus = await _loginUser();
                                    if (loginStatus != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(loginStatus),
                                          duration: const Duration(seconds: 10),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.white,
                                  ),
                                  child: isLoggingIn
                                      ? const CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.black),
                                        )
                                      : const Text(
                                          'Sign',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
