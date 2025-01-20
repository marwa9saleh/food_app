import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/view/screens/details.dart';
import 'package:flutter_application_1/widget/food_card.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  final DataController controller = Get.find<DataController>();

   FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite List'),
         leading:  const InkWell(child: Icon(Icons.arrow_back))),
         
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return const Center(
            child: Text(
              'No favorites added yet!',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteList[index];
            return FoodCard(item: item, onTap: () { Get.to(Details(
          name: item.strCategory,
          image: item.strCategoryThumb,
          catdesc: item.strCategoryDescription,
        )); },);
          },
        );
      }),
    );
  }
}



