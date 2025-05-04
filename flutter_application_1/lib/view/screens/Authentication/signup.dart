import 'package:flutter_application_1/Utils/theme.dart';
import 'package:flutter_application_1/logic/controllers/auth_controller.dart';
import 'package:flutter_application_1/routes/route.dart';
import 'package:flutter_application_1/widget/text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  //form مفتاح التحكم بال
  final fromKey = GlobalKey<FormState>();
  // متحكمات حقول الادخال
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

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
    GestureDetector(
                    onTap: controller.pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.pickedImage != null
                          ? FileImage(controller.pickedImage!)
                          : null,
                      child: controller.pickedImage == null
                          ? const Icon(Icons.camera_alt, size: 40)
                          : null,
                    ),
                  ),



                    // GetBuilder<AuthController>(
                    //   builder: (_) {
                    //     return
                         AuthTextFormField(
                          onChanged: (value) => controller.name.value = value,
                          obscureText: false,
                          // validator: (value) {
                          //   if (value.toString().length <= 2 ||
                          //       !RegExp(validationName).hasMatch(value)) {
                          //     return 'Enter valid name';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'User Name', 
                        ),


                        AuthTextFormField(
                          onChanged: (value) => controller.phone.value = value,
                          obscureText: false,
                          // validator: (value) {
                          //   if (value.toString().length <= 2 ||
                          //       !RegExp(validationName).hasMatch(value)) {
                          //     return 'Enter valid name';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          prefixIcon: const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Phone'
                        ),
                    //   },
                    // ),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return 
                    AuthTextFormField(
                    onChanged: (value) => controller.email.value = value,
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
                    // }),
                    const SizedBox(
                      height: 20,
                    ),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return
                       AuthTextFormField(
                         onChanged: (value) => controller.password.value = value,
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
                        hintText: 'Password',
                      ),

 

                    // }),
                    const SizedBox(
                      height: 60,
                    ),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return 

                         controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : 
                      ElevatedButton(
                        onPressed: () { controller.register();
                          // if (fromKey.currentState!.validate()) {
                          //   String name = _nameController.text.trim();
                          //   String email = _emailController.text.trim();
                          //   String password = _passwordController.text;

                          //   controller.signUpUsingFirebase(
                          //     name: name,
                          //     email: email,
                          //     password: password,
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('SignUp',
                            style: TextStyle(color: Colors.white)),
                      ),
                    // }),
                    const SizedBox(height: 20),
                    // GetBuilder<AuthController>(builder: (_) {
                    //   return
                       GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.loginScreen);
                        },
                        child: const Text(
                          'Already have an Account? Login',
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