import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Ariandi/main_page.dart';
import '../Bintang/Provider/Provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isDataValid = true;
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background1.jpg'),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(left: 20, top: 350),
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
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            provTugas2.setEmailLogin = _emailController.text;
                            provTugas2.setPasswordLogin =
                                _passwordController.text;
                            if (provTugas2.emailLogin == provTugas2.email &&
                                provTugas2.passwordLogin ==
                                    provTugas2.password) {
                              isDataValid = true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              isDataValid = false;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white),
                          child: const Text(
                            'Sign',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (isDataValid == true)
                    Container()
                  else
                    TextButton(
                      child: const Text(
                        'Masih ada yang salah, Cek Masalahnya disini!!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            backgroundColor: Colors.black),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(''),
                              content: const Text(
                                "Email atau Password anda salah!",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Tutup'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
