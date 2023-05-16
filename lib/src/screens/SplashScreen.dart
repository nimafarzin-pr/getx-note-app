import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fl_ui_app/src/screens/HomeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notes2.png",
              width: 200.r,
              height: 200.r,
            ),
            Text(
              'Note!',
              style: TextStyle(fontSize: 30.sp, color: Colors.white),
            ),
          ],
        ),
        nextScreen: const HomeScreen(),
        curve: Curves.ease,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        splashIconSize: 1.sw,
        duration: 100,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
