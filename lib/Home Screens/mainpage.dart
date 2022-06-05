// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Get started!",
                style: GoogleFonts.poppins(
                    fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Container(
                height: 2,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Click on the Camera and take a picture of your surroundings. Get to know your air quality in one click.",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.grey.shade100),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 300,
                child: Center(
                    child: Lottie.asset("assets\\girltakingpicture.json")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
