import 'package:flutter/material.dart';

import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/view/screens/details.dart';
import 'package:flutter_application_1/widget/food_card.dart';

import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});
 final controller = Get.find<DataController>();

 

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
       
          ),
        );
      } else {
        return 
            Expanded(
          child:  controller.filteredItems.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
                    // ? Get.isDarkMode
                  ? Image.network("https://cdn.dribbble.com/users/463734/screenshots/2016792/empty-result_shot.png")
                  // Image.asset("assets/images/search.gif")
                  : 
              // : 
              ListView.builder(
  itemCount: controller.filteredItems.isEmpty
      ? controller.foodList.length
      : controller.filteredItems.length,
  itemBuilder: (context, index) {
    final item = controller.filteredItems.isEmpty
        ? controller.foodList[index]
        : controller.filteredItems[index];

    return FoodCard(
    item:item,
      onTap: () {
        Get.to(Details(
          name: item.strCategory,
          image: item.strCategoryThumb,
          catdesc: item.strCategoryDescription,
        ));
      },
    );
  },
            ));
 
      
    }});
  }}
   // مهم................................................................................................
            //    ListView.builder(
            
            //     padding:EdgeInsets.zero,
             
            //   itemCount:controller.filteredItems.isEmpty
            //           ? controller.foodList.length
            //           : controller.filteredItems.length,
            //   itemBuilder: (context, i) {
            //       if (controller.filteredItems.isEmpty) {
            //           return 
                
            //              buildCardItems(image: controller.foodList[i].strCategoryThumb,
            //                strCat: controller.foodList[i].strCategory, 
            //                strDescription:controller.foodList[i].strCategoryDescription,
            //                 onTap: () {
            //              Get.to(
            //     Details( name:  controller.foodList[i].strCategory, image:  controller.foodList[i].strCategoryThumb, catdesc: controller.foodList[i].strCategoryDescription,
                   
            //         // menu:menu, categoryName: categoryName,
            //       ),
            //     );



            //                 },); 
               
            //   }
            //   else{
            //      return 
                
            //              buildCardItems(image: controller.filteredItems[i].strCategoryThumb,
            //                strCat: controller.filteredItems[i].strCategory, 
            //                strDescription:controller.filteredItems[i].strCategoryDescription,
            //                 onTap: () {
            //              Get.to(
            //     Details( name:  controller.filteredItems[i].strCategory, image:controller.filteredItems[i].strCategoryThumb, catdesc: controller.filteredItems[i].strCategoryDescription,
                   
            //         // menu:menu, categoryName: categoryName,
            //       ),
            //     );



            //                 },); 

            //   }
            //   }
              
            // // ),
            // ),);
  