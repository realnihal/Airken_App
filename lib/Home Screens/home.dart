import 'dart:convert';

import 'package:airken/Home%20Screens/infopage.dart';
import 'package:airken/Home%20Screens/mainpage.dart';
import 'package:airken/Home%20Screens/weatherpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _image;
  String _image_url = "";
  ImagePicker picker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();

  Future upload_file(image_path) async {
    Random _random = Random.secure();
    var values = List<int>.generate(32, (i) => _random.nextInt(256));
    String name = base64Url.encode(values);
    final mountainsRef = storageRef.child("$name.jpg");
    try {
      await mountainsRef.putFile(image_path);
      print("Successfully uploaded");
      _image_url = await mountainsRef.getDownloadURL();
      print(_image_url);
    } catch (e) {
      print("File unable to upload");
    }
  }

  Future get_image() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      upload_file(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 1);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              InfoPage(),
              MainPage(),
              WeatherPage(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.95),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(0);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          color: Colors.white),
                      child: const Center(
                        child: Icon(
                          Icons.info_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      get_image();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          color: Colors.white),
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                          color: Colors.white),
                      child: const Center(
                        child: Icon(
                          Icons.cloud_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
