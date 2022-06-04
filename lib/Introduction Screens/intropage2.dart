import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class introPage2 extends StatelessWidget {
  const introPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(180),
              ),
              child: Center(
                child: Lottie.asset("assets\\plan.json"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Know what you breathe in!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Plan your day Knowing your surroundings. Stay safe and healthy.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
