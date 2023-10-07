import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Bintang/Provider/Provider.dart';
import '../Reza/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();
  bool isSame = true;
  bool dataLength = true;
  @override
  Widget build(BuildContext context) {
    final provTugas2 = context.watch<ProviderTugas2>();
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
              TextField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
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
              TextField(
                controller: _confPasswordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isChecked
                      ? () {
                          provTugas2.setUsername = _usernameController.text;
                          provTugas2.setEmail = _emailController.text;
                          provTugas2.setPassword = _passwordController.text;
                          provTugas2.setConfPassword =
                              _confPasswordController.text;
                          if (provTugas2.username!.length >= 4 &&
                              provTugas2.email!.length >= 4 &&
                              provTugas2.password!.length >= 4 &&
                              provTugas2.confPassword!.length >= 4) {
                            setState(() {
                              dataLength = true;
                            });
                            if (provTugas2.password ==
                                provTugas2.confPassword) {
                              setState(() {
                                isSame = true;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            } else {
                              setState(() {
                                isSame = false;
                              });
                            }
                          } else {
                            setState(() {
                              dataLength = false;
                            });
                          }

                          // Tambahkan logika untuk tombol di sini
                        }
                      : () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    // Tambahkan logika untuk tombol "Already have an account" di sini
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          ' account',
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
              if (isSame == true)
                Container()
              else
                TextButton(
                  child: const Text(
                    'Tidak bisa register, Cek Masalahnya disini!!',
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
                          title: const Text('Info'),
                          content: const Text(
                            "Confirm PassWord Harus sesuai dengan Password !",
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
              if (dataLength == false)
                TextButton(
                  child: const Text(
                    'Cek Masalah nya disini',
                    style: TextStyle(
                        color: Colors.red, backgroundColor: Colors.black),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Info'),
                          content: const Text(
                            "Jumlah karakter tidak boleh kurang dari 4!",
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
      ),
    );
  }
}
