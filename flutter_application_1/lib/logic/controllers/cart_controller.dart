import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data_model.dart';
import 'package:get/get.dart';
class CartController extends GetxController {
   var cartPorduct = <FoodModel>[].obs;


void addtocart(FoodModel product){
  cartPorduct.add(product);
  print(cartPorduct.length);

}
removefromcart(FoodModel product){
 Get.defaultDialog(
    title: "Confirm Delete",
    content: const Text("Are you sure you want to remove this item?"),
    onCancel: () => Get.back(),
    onConfirm: () {
      cartPorduct.remove(product);
      update();
      Get.back();
    },
  );
 

}}