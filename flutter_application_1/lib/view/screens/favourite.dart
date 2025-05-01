
import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/view/screens/details.dart';

import 'package:flutter_application_1/widget/food_card.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return   Container(
  
  decoration: BoxDecoration(
                         color: Colors.white, 
                            borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), //  تدوير الزاوية العلوية اليسرى
          topRight: Radius.circular(20), // تدوير الزاوية العلوية اليمنى
        ),
                              // جعل الأطراف مستديرة
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              blurRadius: 10,
                              offset: Offset(0, 4), // ظل خفيف أسفل المربع
                            ),
                          ],
                        ),

      // appBar:
      //     CurvedAppBar(leading: const InkWell(child: Icon(Icons.arrow_back))),
      //  AppBar(
      //     backgroundColor: Colors.white,
      //     title: Text('Favorite List'.tr),
      //     leading: const InkWell(child: Icon(Icons.arrow_back))),
      child:Padding(padding: const EdgeInsets.all( 10),child: 
       Column(
         children: [
         
    
       // ترك مسافة حتى لا تتداخل مع محتوى Navigation
          // const Align(
          //   alignment: Alignment.topLeft,
          //   child:InkWell(child: Icon(Icons.arrow_back)),),
          // Container(
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //     color: Colors.red,
          //   ),
          //   child:
          const Align(
            alignment: Alignment.topLeft,
            child:InkWell(child: Icon(Icons.arrow_back)),),
             Expanded(child: 
          Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Text(
              'No favorites added yet!'.tr,
              style: const TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteList[index];
            return FoodCard(
              item: item,
              onTap: () {
                Get.to(Details(
                  name: item.strCategory,
                  image: item.strCategoryThumb,
                  catdesc: item.strCategoryDescription,
                ));
              },
            );
          },
        );
      }),)],))
    );
  }
}
