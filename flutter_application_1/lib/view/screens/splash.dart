import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //         var screenWidth = MediaQuery.of(context).size.width;
    // Future.delayed(const Duration(seconds:20), () {
    //   Get.offNamed(Routes.loginScreen);
    // });

    return Scaffold(
        body: Center(
            child: TweenAnimationBuilder(
                onEnd: () {
                  Get.offNamed(Routes.loginScreen);
                },
                tween: Tween<double>(begin: 15.0, end: 30.0),
                duration: const Duration(seconds: 8),
                builder: (BuildContext context, double value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'F',
                        style: GoogleFonts.lobster(
                          color: header1,

                          fontSize: value, // 10% of screen width

                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                      ),
                      Text(
                        "OOD",
                        style: GoogleFonts.lobster(
                          color: mainColor,

                          fontSize: value, // 10% of screen width

                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                      ),
                      Text(
                        'IES',
                        style: GoogleFonts.lobster(
                          color: header1,

                          fontSize: value, // 10% of screen width

                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                      ),
                    ],
                  );
                })));
    //     AnimatedSplashScreen(
    //   splash: Center(child: Lottie.asset('assets/images/Enjoy Food.json')),
    //   nextScreen: const HomeScreen(),
    //   splashIconSize: 300,
    //   backgroundColor: Colors.white,
    //   duration: 5000,
    // );
  }
}
