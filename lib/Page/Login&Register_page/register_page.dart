import 'package:basic/Page/Login&Register_page/login_page.dart';
import 'package:basic/Page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final auth = AuthFirebase();
  bool isRegistering = false;

  Future<String?> _onSignUp() async {
    setState(() {
      isRegistering = true;
    });

    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      await auth.signUp(email, password);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
      return 'Pendaftaran berhasil';
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message ?? 'An error occured', gravity: ToastGravity.TOP);
    } finally {
      setState(() {
        isRegistering =
            false; // Set state menjadi false setelah pendaftaran selesai
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Join Us!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              // TextField(
              //   controller: _usernameController,
              //   style: const TextStyle(color: Colors.white),
              //   decoration: const InputDecoration(
              //     labelText: 'Username',
              //     labelStyle: TextStyle(color: Colors.white),
              //   ),
              // ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16.0),
              // TextField(
              //   controller: _phonenumberController,
              //   style: const TextStyle(color: Colors.white),
              //   decoration: const InputDecoration(
              //     labelText: 'Phone Number',
              //     labelStyle: TextStyle(color: Colors.white),
              //   ),
              // ),
              // const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              // TextField(
              //   controller: _confPasswordController,
              //   style: const TextStyle(color: Colors.white),
              //   decoration: const InputDecoration(
              //     labelText: 'Confirm Password',
              //     labelStyle: TextStyle(color: Colors.white),
              //   ),
              //   obscureText: true,
              // ),
              // const SizedBox(height: 16.0),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: _isChecked,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _isChecked = value!;
              //         });
              //       },
              //     ),
              //     const Text(
              //       'I agree to the terms and conditions',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    String? registerStatus = await _onSignUp();
                    if (registerStatus != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(registerStatus),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                    // Melakukan pendaftaran menggunakan AuthFirebase
                  },
                  child:
                      isRegistering // Tampilkan CircularProgressIndicator jika sedang pendaftaran
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            )
                          : const Text(
                              'Register',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          ' account?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
