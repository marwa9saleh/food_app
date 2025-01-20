import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:flutter_application_1/logic/controllers/cart_controller.dart';
import 'package:flutter_application_1/view/screens/details.dart';
import 'package:flutter_application_1/widget/food_card.dart';
import 'package:get/get.dart';
class DetCart extends StatelessWidget {

     DetCart({super.key});
     final CartController controllers = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
   
        appBar: AppBar(
        
          backgroundColor: Colors.white,
          title: const Text("Cart Items"),
          elevation: 0,
         
          centerTitle: true,
          
          actions: [
            IconButton(
              onPressed: () {
             
            if (Get.isRegistered<CartController>()) {
      debugPrint("CartController موجود!");
   
            Get.offNamed(Routes.home);
       
    } else {
      debugPrint("CartController غير موجود!");
    }
  },
  icon: const Icon(Icons.arrow_back),

),
          ],
        ),
        body:Obx(() {
        if (controllers.cartPorduct.isEmpty) {
          return const Center(
            child: Text(
              'No item added yet!',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: controllers.cartPorduct.length,
          itemBuilder: (context, index) {
            final item = controllers.cartPorduct[index];
            return FoodCard(item: item, onTap: () { Get.to(Details(
          name: item.strCategory,
          image: item.strCategoryThumb,
          catdesc: item.strCategoryDescription,
        )); },);
          },
        );
      }),
     ));
  }
}
  