import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen_adaptive/pages/onboarding_screen.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: OnboardingScreen(
        pages: const [
          PageOne(),
          PageTwo(),
          PageThree(),
        ],
        onSkipSelected: () {},
        onGetStarted: () {},
        btnBackgroundColor: Colors.yellow.shade600,
        selectedColor: Colors.yellow.shade600,
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        "assets/images/1.png",
      ),
      const Center(
        child: Text(
          'Best choice for everyone.',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: 'Gilroy',
          ),
        ),
      )
    ]);
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        "assets/images/2.png",
      ),
      const Center(
        child: Text(
          textAlign: TextAlign.center,
          'Teachers & Learners',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: 'Gilroy',
          ),
        ),
      )
    ]);
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Center(
        child: Text(
          textAlign: TextAlign.center,
          'Best platform for both.Anywhere. Accelerate Your Future and beyond.',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      Image.asset(
        "assets/images/3.png",
      ),
    ]);
  }
}
