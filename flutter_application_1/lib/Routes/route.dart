import 'package:flutter_application_1/View/Screens/Authentication/signup.dart';
import 'package:flutter_application_1/View/Screens/Authentication/login.dart';

import 'package:flutter_application_1/View/Screens/favourite.dart';
import 'package:flutter_application_1/View/Screens/setting.dart';
import 'package:flutter_application_1/View/Screens/splash.dart';
import 'package:flutter_application_1/logic/binding/auth_binding.dart';
import 'package:flutter_application_1/logic/binding/data_binding.dart';


import 'package:flutter_application_1/logic/binding/main_binding.dart';
import 'package:flutter_application_1/view/screens/bootom_navigationbar.dart';


import 'package:flutter_application_1/view/screens/details_cart.dart';


import 'package:flutter_application_1/view/screens/pay.dart';

import 'package:get/get.dart';
import 'package:flutter_application_1/View/Screens/home.dart';

class AppRoutes {
  //initial Rote
  // static const welcome = Routes.welcomeScreen;
  static const splassh = Routes.splash;
  static const homeScreen = Routes.home;
  static const signUpScreenn = Routes.signUpScreen;
  static const navscreen = Routes.nav;
  // static const details = Routes.det;
  //  static const detailcar = Routes.decart;
//getPages

  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
  
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.fav,
      page: () => FavoriteScreen(),
    ),
    GetPage(
      name: Routes.set,
      page: () =>  SettingsScreen(),
       binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.nav,
      page: () => Navigation(),
   
     bindings: [DataBinding(), MainBinding()
     ]
     ,
    ),
  
     GetPage(
      name: Routes.decart,
      page: () =>DetCart(),
        binding: DataBinding(), 
     
     
    ),
      //  GetPage(
    //   name: Routes.det,
    //   page: () => Details(),
     
    // ),
   
     GetPage(
      name: Routes.pay,
      page: () =>const PaymentPage(),
     
    ),
    //  GetPage(
    //   name: Routes.food_det,
    //   page: () =>FoodDetailsScreen(),
     
    // ),
  ];
}


class Routes {
  static const loginScreen = '/LoginScreen';
  static const signUpScreen = '/SignupScreen';
  static const home ='/HomeScreen';
  static const splash = '/SplashScreen';
  static const fav ='/FavoritesScreen';
  static const set ='/SettingsScreen';
  static const nav ='/Navigation';
  // static const det ='/Details';
  static const decart ='/DetCart';
  static const pay ='/PaymentPage';
  // static const food_det='/FoodDetailsScreen';
  
}
