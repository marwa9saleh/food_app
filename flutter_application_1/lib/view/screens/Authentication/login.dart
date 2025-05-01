import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/theme.dart';
import 'package:flutter_application_1/logic/controllers/auth_controller.dart';
import 'package:flutter_application_1/routes/route.dart';
import 'package:flutter_application_1/widget/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  //form مفتاح التحكم بال
  final fromKey = GlobalKey<FormState>();
  // متحكمات حقول الادخال
  // final TextEditingController? emailController = TextEditingController();
  // final TextEditingController? passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Obx(() =>
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/login.svg',
                height: 150,
              ),
              const SizedBox(height: 20),
              Form(
                key: fromKey,
                child: Column(
                  children: [
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return
                       AuthTextFormField(
                         onChanged: (value) => controller.email.value = value,
  
              keyboardType: TextInputType.emailAddress,

                        // controller: emailController!,
                        obscureText: false,
                        // validator: (value) {
                        //   if (!RegExp(validationEmail).hasMatch(value)) {
                        //     return 'Invalid email';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        prefixIcon: const Icon(Icons.email, size: 30),
                        suffixIcon: const Text(""),
                        hintText: 'Email',
                      ),
                   
                    const SizedBox(
                      height: 20,
                    ),
                    // GetBuilder<AuthController>(builder: (_) {
                     AuthTextFormField(
                       
                        // validator: (value) {
                        //   if (value.toString().length < 6) {
                        //     return 'Password should be longer or equal to 6 characters';
                        //   } else {
                        //     return null;
                        //   }
                        // },
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
                        hintText: 'Password', onChanged:  (val) => controller.password.value = val,
 keyboardType:  TextInputType.text,
                      ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                    // GetBuilder<AuthController>(builder: (_) {
                      // return 
                        controller.isLoading.value
                ? Center(child:  CircularProgressIndicator())
                : 
                      ElevatedButton(
                        onPressed: () { controller.login;
                          // if (fromKey.currentState!.validate()) {
                          //   String? email = emailController!.text.trim();
                          //   String? password = passwordController!.text;
                          //   controller.logInUsingFirebase(
                          //       email: email, password: password);
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      ),
                    
                    const SizedBox(height: 20),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return
                       InkWell(
                        onTap: () {
                          // controller.signInWithGoogle();
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
                              const Text('Continue with Google',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF4B5768),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09)),
                              Image.asset("assets/images/google.png"),
                            ],
                          ),
                        ),
                      ),
                    // }),
                    const SizedBox(height: 20),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return
                       GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: const Text(
                          'Don\'t have an account? Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    // }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
