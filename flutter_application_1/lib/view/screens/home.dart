import 'package:flutter/material.dart';

import 'package:flutter_application_1/co.dart';

import 'package:flutter_application_1/utils/theme.dart';

import 'package:flutter_application_1/view/screens/home_categories.dart';
import 'package:flutter_application_1/widget/search_bar.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'F',
                      style: GoogleFonts.lobster(
                        color: header1,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),
                    Text(
                      "OOD",
                      style: GoogleFonts.lobster(
                        color: mainColor,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),
                    Text(
                      'IES',
                      style: GoogleFonts.lobster(
                        color: header1,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'choose your favourite food!'.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF6A6A6A),
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: screenHeight * 0.07, // Responsive height for search
                child: Row(
                  children: [
                    Expanded(
                      child: SearchWidget(),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: screenWidth * 0.12, // Adjust width
                      height: screenHeight * 0.06, // Adjust height
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.menu, color: header1),
                        onPressed: () {
                          // Get.toNamed(Routes.decart);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              HomeCategories(),
              SizedBox(
                height: screenHeight * 0.6,
                child: CardItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
