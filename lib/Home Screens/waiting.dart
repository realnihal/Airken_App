import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment(0, -0.75),
            child: CircularProgressIndicator(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment(0, -0.60),
            child: Text(
              "Loading...",
              style: GoogleFonts.poppins(),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(180),
              ),
              child: Lottie.asset("assets\\waiting.json"),
            ),
          ),
        ],
      ),
    );
  }
}
