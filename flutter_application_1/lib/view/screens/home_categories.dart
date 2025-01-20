import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/view/screens/food_details.dart';
import 'package:flutter_application_1/widget/categories.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key});
 final controller = Get.find<DataController>();
 
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
        return
    // return Obx(()  {
    //   if (controller.isLoading.value) {
    //     return const Center(
    //       child: CircularProgressIndicator(
       
    //       ),
    //     );
    //   } else {
      
    SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        
              // itemCount: controller.foodList.length,
              itemCount:controller.food.length,
              itemBuilder: (context, i) {
                 final category = controller.food[i];
       return    GestureDetector(
    onTap: () {
            
                Get.to(
                  () => FoodDetailsScreen(
                    categoryName: category['name'],
                    menu: category['menu'],
                  ),
                );
              },child: 
      Categories(image:category['im'], title: category['name'], textColor:Colors.black,),);
      
      },
    
      scrollDirection: Axis.horizontal,
      ),
    );
    
  }
}