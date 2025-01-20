
import 'package:flutter_application_1/logic/controllers/nav_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());

  }
}