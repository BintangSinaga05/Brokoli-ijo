import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:basic/Provider/MyProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _prefs = await SharedPreferences.getInstance();
    final imagePath = _prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  Future<void> _saveImage(String imagePath) async {
    await _prefs.setString('profile_image', imagePath);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _saveImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final datauser = Provider.of<DataProfileProvider>(context);
    const double topWidgetHeight = 200.0;
    const double avatarRadius = 68.0;

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
                child: Row(
                  children: [
                    const SizedBox(
                      width: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datauser.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          datauser.email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black87),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: TextEditingController(
                          text: datauser.city,
                        ),
                        decoration: const InputDecoration(
                            labelText: 'CITY',
                            labelStyle: TextStyle(color: Colors.blueGrey)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - avatarRadius - 110,
            top: topWidgetHeight - avatarRadius - 40,
            child: InkWell(
              onTap: () {
                // Show options for selecting an image.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Choose an option"),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("Take a picture"),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              title: const Text("Pick from gallery"),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : AssetImage("assets/profile.png") as ImageProvider,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
