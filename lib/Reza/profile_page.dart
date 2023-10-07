import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Bintang/Provider/Provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const double topWidgetHeight = 200.0;
    const double avatarRadius = 68.0;
    final provTugas2 = context.watch<ProviderTugas2>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(250, 28, 23, 33),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 190,
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 58, 10, 51)),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Adrianus Silalahi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "+62895-1232-6689",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(color: Colors.black87),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: TextEditingController(
                            text: "adrianus766@gmail.com",
                          ),
                          decoration: const InputDecoration(
                              labelText: 'YOUR EMAIL',
                              labelStyle: TextStyle(color: Colors.blueGrey)),
                        ),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: TextEditingController(
                            text: provTugas2.password,
                          ),
                          obscureText: provTugas2.dataCurrentObsPassword,
                          decoration: InputDecoration(
                              labelText: "YOUR PASSWORD",
                              labelStyle:
                                  const TextStyle(color: Colors.blueGrey),
                              suffix: ElevatedButton(
                                  onPressed: () {
                                    provTugas2.setObsPassword =
                                        !provTugas2.dataCurrentObsPassword;
                                  },
                                  child: const Text("Show"))),
                        ),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: TextEditingController(
                            text: "Medan/Indonesia",
                          ),
                          decoration: const InputDecoration(
                              labelText: 'CITY/COUNTRY',
                              labelStyle: TextStyle(color: Colors.blueGrey)),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - avatarRadius - 110,
            top: topWidgetHeight - avatarRadius - 40,
            child: CircleAvatar(
              radius: avatarRadius,
              child: Image.network(
                  "https://cdn-icons-png.flaticon.com/128/2202/2202112.png"),
            ),
          )
        ],
      ),
    );
  }
}
