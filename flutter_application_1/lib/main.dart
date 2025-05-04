import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/interniet.dart';
import 'package:flutter_application_1/logic/binding/auth_binding.dart';
import 'package:flutter_application_1/translation.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
    HttpOverrides.global = MyHttpOverrides(); 
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyD71xvSZwq4PIs41nFyjvlPbMR-O6VToxw",
  //     appId: "1:78663611283:android:e8ba5cde384172a8b56e66",
  //     messagingSenderId: "78663611283",
  //     projectId: "myapp-e7840",
  //   ),
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(), // إضافة ملف الترجمة
      locale: Locale('en'), // اللغة الافتراضية
      fallbackLocale: Locale('en'),
      // initialRoute: FirebaseAuth.instance.currentUser != null ||
      //         GetStorage().read<bool>('auth') == true
           initialRoute: GetStorage().read('token') != null
          ? AppRoutes.navscreen
          : AppRoutes.splassh,
      getPages: AppRoutes.routes,
    );
  }
}
