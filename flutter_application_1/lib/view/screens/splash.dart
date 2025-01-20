
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/routes/route.dart';





import 'package:get/get.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
            var screenWidth = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds:20), () {
      Get.offNamed(Routes.loginScreen);
    });
    return Scaffold(
    // backgroundColor: thirdc,
  body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // child:  Column(   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
       child: 
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('F',style: GoogleFonts.lobster(
                        color:five,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),),
        
       Text(
                      "OOD",
                      style: GoogleFonts.lobster(
                        color:mainColor,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),  
                    Text('GO',style: GoogleFonts.lobster(
                        color:five,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),),
                      ],) ,
                    // const SizedBox(height: 5,),
    //                   AnimatedSplashScreen(splash: const CircleAvatar(
    //  radius:90,
     
    //  backgroundImage:AssetImage('assets/images/bu.png'),
    // ) , 
    // nextScreen: LoginScreen(),
    // splashIconSize: 400,
    // backgroundColor: Colors.white,
    // pageTransitionType: PageTransitionType.topToBottom,
    // splashTransition: SplashTransition.rotationTransition,
    // ),
    // ],),
  ),),),
  
    
    
    );
    
  
    
  }
}
