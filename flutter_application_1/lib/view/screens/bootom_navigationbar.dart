import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/cart_controller.dart';
import 'package:flutter_application_1/logic/controllers/nav_controller.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/view/screens/favourite.dart';
import 'package:flutter_application_1/widget/appbar.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);
  final controller = Get.find<NavController>();
  final controllers = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          // appBar: CurvedAppBar(),
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: Colors.white,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: Text(
                  "Home".tr,
                  style:
                      const TextStyle(color: Color.fromARGB(221, 22, 21, 21)),
                ),
                selectedColor: mainColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: Text(
                  "Favourite".tr,
                  style:
                      const TextStyle(color: Color.fromARGB(221, 22, 21, 21)),
                ),
                // title: const Text("Favourite"),
                selectedColor: mainColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                // title: const Text("Setting"),
                title: Text(
                  "Setting".tr,
                  style:
                      const TextStyle(color: Color.fromARGB(221, 22, 21, 21)),
                ),
                selectedColor: mainColor,
              ),
            ],
          ),
           body: Stack(
            children: [
              /// ✅ 1️⃣ **إضافة الـ AppBar أولًا لضمان أنه يظهر دائمًا**
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CurvedAppBar(), // تأكد من أن هذا هو الـ AppBar الصحيح
              ),

              /// ✅ 2️⃣ **عرض محتوى الصفحات العادية**
              Positioned.fill(
                 top: 60,
                child: IndexedStack(
                  index: controller.currentIndex.value,
                  children: controller.tabs,
                ),
              ),

              /// ✅ 3️⃣ **جعل صفحة FavoriteScreen تظهر فوق الـ AppBar**
              if (controller.currentIndex.value == 1)
                Positioned(
                   top: 60, // ✅ يسمح لـ AppBar بالبقاء ظاهرًا
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: FavoriteScreen(),
                ),
            ],
          ),
        );
      }),
    
        );
    
  }
}
