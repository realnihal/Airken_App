import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'puramnihal@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Feedback and Queries for Airken project'
      }),
    );

    return Scaffold(
      body: FadeIn(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                "About us!",
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
                  "Airken, developed by a team of students at IIT Madras, aims to provide a platform for people to get to know their air quality in one click.\n\nThe app is currently open-source and in beta.\n\nWe have great ideas going forward expanding our capabilities. To join us or provide feedback, please contact below",
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: Colors.grey.shade100),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2),
              child: GestureDetector(
                onTap: () {
                  launchUrl(emailLaunchUri);
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text("Email us",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.grey.shade100,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
