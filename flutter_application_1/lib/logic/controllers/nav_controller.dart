
import 'package:flutter_application_1/view/screens/favourite.dart';
import 'package:flutter_application_1/view/screens/home.dart';

import 'package:get/get.dart';

class NavController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt currentIndex = 0.obs;
  // late TabController tabController;

  final tabs = [
    HomeScreen(),
    FavoriteScreen(),
    // AccountScreen(),
    // CurvedAppBar(),
  ].obs;

  void changeTab(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();

  // }

//   @override
// void onClose() {

//     tabController.dispose();
//     super.onClose();
//   }
}
