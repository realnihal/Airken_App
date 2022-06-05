import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:airken/Introduction Screens/intropage1.dart';
import 'package:airken/Introduction Screens/intropage2.dart';
import 'package:airken/Introduction Screens/intropage3.dart';
import 'package:page_transition/page_transition.dart';

import '../Home Screens/home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  bool _onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  _onLastPage = (index == 2);
                });
              },
              controller: _controller,
              children: const [
                introPage1(),
                introPage2(),
                introPage3(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.70),
              child: SmoothPageIndicator(
                effect: WormEffect(
                  type: WormType.thin,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  spacing: 20,
                ),
                controller: _controller,
                count: 3,
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.95),
              child: (!_onLastPage)
                  ? GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Colors.white70),
                        child: Center(
                          child: Text('Next',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: HomePage()));
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Colors.white70),
                        child: Center(
                          child: Text('Get Started',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
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

class IntroPage1 {}
