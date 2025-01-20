import 'package:flutter/material.dart';

import 'package:flutter_application_1/logic/controllers/nav_controller.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Navigation extends StatelessWidget {
   final controller = Get.find<NavController>(); 
  Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
        () {
          return Scaffold(
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.white,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home",style: TextStyle(color: Color.fromARGB(221, 22, 21, 21)),),
                selectedColor:mainColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                 title: const Text("Favourite",style: TextStyle(color: Color.fromARGB(221, 22, 21, 21)),),
                // title: const Text("Favourite"),
                  selectedColor:mainColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                // title: const Text("Setting"),
                    title: const Text("Setting",style: TextStyle(color: Color.fromARGB(221, 22, 21, 21)),),
              selectedColor:mainColor,
              ),
            ],
          ),
         body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs,
          ),);}),
      
    );
  }
}
