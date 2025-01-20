import 'package:flutter_application_1/Utils/reg_exp.dart';
import 'package:flutter_application_1/logic/controllers/auth_controller.dart';


import 'package:flutter_application_1/routes/route.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/widget/text_field.dart';



import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  //form مفتاح التحكم بال
  final fromKey = GlobalKey<FormState>();
  // متحكمات حقول الادخال
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight  = MediaQuery.of(context).size.height;
    
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
   "SIGN UP",
                      style: GoogleFonts.lobster(
                        color:  mainColor,

                        fontSize: screenWidth * 0.1, // 10% of screen width

                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),),
                    // SizedBox(height: 20,),
        Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // جعل الأطراف مستديرة
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 10,
                    offset: Offset(0, 4), // ظل خفيف أسفل المربع
                  ),
                ],
              ),
         padding: const EdgeInsets.all(24),
              child: Column(
      

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
              Form(
                key: fromKey,
                child: Column(
                 
                  children: [
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFormField(
                          controller: _nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
                        );
                      },
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFormField(
                        controller: _emailController,
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
                        controller: _passwordController,
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
                      height: 60,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return ElevatedButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            String name = _nameController.text.trim();
                            String email = _emailController.text.trim();
                            String password = _passwordController.text;

                            controller.signUpUsingFirebase(
                              name: name,
                              email: email,
                              password: password,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('SignUp',
                            style: TextStyle(color: Colors.white)),
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
                              onTap: () {  Get.offNamed(Routes.loginScreen);},
                              child: const Text(
                              
                              'Login',
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
        ),
       ],),
      ),),
    ),);
  }
}
