import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/widget/header_widget.dart';

import 'package:flutter_application_1/widget/text_field.dart';
import 'package:flutter_application_1/widget/theme_helper.dart';

import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/reg_exp.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final controller = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emaillController = TextEditingController();
  String? name;
  @override
  Widget build(BuildContext context) {
    double _headerHeight = 250;
    // var screenHeight  = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.person),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        // style: GoogleFonts.lobster(
                        //   color: mainColor,

                        //   fontSize: screenWidth * 0.1, // 10% of screen width

                        //   fontWeight: FontWeight.w400,
                        //   height: 0.03,
                        // ),
                      ),
                      Form(
                        key: fromKey,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.close_rounded),
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "if you want to recover your account,then please provide your email Id below..",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                // const SizedBox(height: 30),
                                // Image.asset(
                                //   "assets/images/forgetpass copy.png",
                                //   width: 200,
                                // ),
                                const SizedBox(height: 30),
                                Container(
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                  child: AuthTextFormField(
                                    // onSaved: (value) {
                                    //   name = value;
                                    // },
                                    controller: emaillController,
                                    obscureText: false,
                                    validator: (value) {
                                      if (!RegExp(validationEmail)
                                          .hasMatch(value)) {
                                        return "invaled Email";
                                      } else {
                                        return null;
                                      }
                                    },
                                    prefixIcon: Get.isDarkMode
                                        ? Image.asset('assets/images/email.png')
                                        : const Icon(
                                            Icons.email,
                                            // color: Get.isDarkMode ? pinkClr : mainColor,
                                            size: 30,
                                          ),
                                    suffixIcon: const Text(""),
                                    hintText: "Enter your Email",
                                    lableText: 'Email',
                                  ),
                                ),
                                const SizedBox(height: 30),
                                GetBuilder<AuthController>(
                                  builder: (_) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: mainColor),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 10, 40, 10),
                                        child: Text(
                                          'Login'.tr.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (fromKey.currentState!.validate()) {
                                          controller.resetPassword(
                                              emaillController.text.trim());
                                        }
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Remember your password? "),
                            TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offNamed(Routes.loginScreen);
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
