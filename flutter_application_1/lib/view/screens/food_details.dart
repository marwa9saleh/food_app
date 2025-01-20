import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/categ_det.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatelessWidget {
  final String categoryName;
  final List<dynamic> menu;

  const FoodDetailsScreen( {required this.categoryName, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(categoryName), // اسم الصنف
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final menuItem = menu[index];
          return Card(
         color:  Colors.white,
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              
              leading: Image.network(
                menuItem['image'], // صورة العنصر
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                menuItem['nam'], // اسم العنصر
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(menuItem['description']),
              onTap: () {
                // قم بإضافة أي إجراء عند الضغط على العنصر هنا
                Get.to(
                CategDet(categoryName:  menuItem['nam'], urlimage:menuItem['image'], desc:menuItem['description'] ,
                   
                    // menu:menu, categoryName: categoryName,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
