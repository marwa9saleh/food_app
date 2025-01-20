import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/reg_exp.dart';
import 'package:flutter_application_1/logic/controllers/auth_controller.dart';
import 'package:flutter_application_1/routes/route.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/widget/text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  //form مفتاح التحكم بال
  final fromKey = GlobalKey<FormState>();
  // متحكمات حقول الادخال
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:Colors.white,
      body:
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
        
       Column(
        children:[
           Padding(
            padding: const EdgeInsets.only(bottom: 70),child: 
        Text(
                      "LOG IN",
                      style: GoogleFonts.lobster(
                        color:  mainColor,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),),
        Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // جعل الأطراف مستديرة
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 10,
                    offset: const Offset(0, 4), // ظل خفيف أسفل المربع
                  ),
                ],
              ),
         padding: const EdgeInsets.all(24),
              child: Column(
      

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
              // const SizedBox(height: 20),
              Form(
                key: fromKey,
                child: Column(
                  children: [
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFormField(
                        controller: emailController!,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(Icons.email, size: 30),
                        suffixIcon: const Text(""),
                        hintText: 'Email',
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFormField(
                        controller: passwordController!,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          icon: controller.isVisibilty
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                        obscureText: controller.isVisibilty ? false : true,
                        hintText: 'Password',
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return ElevatedButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            String? email = emailController!.text.trim();
                            String? password = passwordController!.text;
                            controller.logInUsingFirebase(
                                email: email, password: password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      );
                    }),
                    const SizedBox(height: 20),
                    GetBuilder<AuthController>(builder: (_) {
                      return InkWell(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        child: Container(
                          width: 342,
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 69, vertical: 12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFE4E6EA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(padding:EdgeInsets.all(5.0) ,
                                child: 
                              Text('Continue with Google',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF4B5768),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09)),),
                            
                              Image.asset("assets/images/google.png"),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    GetBuilder<AuthController>(builder: (_) {
                      return 
                    
                          
                          Row(
                             mainAxisAlignment:MainAxisAlignment.center,
                            children: [const Text(
                           
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 10,),
                            InkWell(
                              onTap: () {  Get.offNamed(Routes.signUpScreen);},
                              child: const Text(
                              
                              'Sign Up',
                              style: TextStyle(color:mainColor),
                                                      ),
                            ),],
                        
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          )],)),
          ),),
    );
  }
}
// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 100);
//     path.quadraticBezierTo(
//       size.width / 2, // نقطة التحكم X
//       size.height, // نقطة التحكم Y
//       size.width, // نهاية المنحنى X
//       size.height - 100, // نهاية المنحنى Y
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }