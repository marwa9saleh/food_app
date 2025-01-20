

import 'package:flutter_application_1/logic/controllers/cart_controller.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:get/get.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
     Get.put<DataController>(DataController());
        Get.lazyPut(() => CartController());



  }
}
   // Get.put(DataController());
       // Get.lazyPut<CartController>(() => CartController());
    // Get.put<DataController>(DataController());
  //  Get.put<CartController>(CartController());