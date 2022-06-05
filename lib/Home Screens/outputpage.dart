import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OutputPage extends StatelessWidget {
  String output;
  OutputPage({Key? key, required this.output}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (output == "second")
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Moderate",
                    style: GoogleFonts.poppins(
                        fontSize: 35, fontWeight: FontWeight.w500),
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
                      "Air quality is acceptable. However, there may be some health concern for a small number of unusually sensitive individuals. ",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.grey.shade100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(180),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.5,
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Lottie.asset("assets\\moderate.json"),
                    ),
                  ),
                )
              ],
            )
          : (output == "first")
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        "Dangerous",
                        style: GoogleFonts.poppins(
                            fontSize: 35, fontWeight: FontWeight.w500),
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
                          "When air quality is in this range, any individual who is active outdoors may experience the respiratory effects.",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            color: Colors.black,
                            width: 2.5,
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Lottie.asset(
                            "assets\\danger.json",
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        "Healthy",
                        style: GoogleFonts.poppins(
                            fontSize: 35, fontWeight: FontWeight.w500),
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
                          "Air quality is acceptable. However, there may be some health concern for a small number of unusually sensitive individuals. ",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(180),
                          border: Border.all(
                            color: Colors.black,
                            width: 2.5,
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Lottie.asset("assets\\normal.json",
                              reverse: true),
                        ),
                      ),
                    )
                  ],
                ),
    );
  }
}
