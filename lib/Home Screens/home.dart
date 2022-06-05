// ignore_for_file: non_constant_identifier_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:airken/Home%20Screens/outputpage.dart';
import 'package:airken/Home%20Screens/waiting.dart';
import 'package:http/http.dart' as http;
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
  String quality = "";
  bool _waiting = false;
  String _image_url = "";
  ImagePicker picker = ImagePicker();
  final storageRef = FirebaseStorage.instance.ref();

  Future upload_file(imagePath) async {
    Random _random = Random.secure();
    var values = List<int>.generate(32, (i) => _random.nextInt(256));
    String name = base64Url.encode(values);
    final mountainsRef = storageRef.child("$name.jpg");
    try {
      await mountainsRef.putFile(imagePath);
      _image_url = await mountainsRef.getDownloadURL();
      try {
        postData();
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  Future get_image() async {
    final image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _waiting = true;
        _image = File(image.path);
        upload_file(_image);
      });
    }
  }

  void postData() async {
    Map<String, String> requestBody = <String, String>{'image': _image_url};
    var uri = Uri.parse('http://13.71.88.107/input');
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    setState(() {
      quality = jsonDecode(respStr)['image'];
      print(quality);
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
            children: [
              InfoPage(),
              (_waiting == false)
                  ? MainPage()
                  : (quality == '')
                      ? WaitingScreen()
                      : OutputPage(output: quality),
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
                      _pageController.jumpToPage(1);
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
