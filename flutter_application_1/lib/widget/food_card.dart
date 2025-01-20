import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/cart_controller.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/models/data_model.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FoodCard  extends StatelessWidget {
     final FoodModel item;

      

     
 Function() onTap;
   FoodCard ({super.key, required this.item,required this.onTap,});
final DataController controller = Get.find<DataController>();
    final CartController controllers = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return 
    Column(children: [
    GestureDetector(
     
       onTap: onTap,
        
      child: 
      
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                  Row(children: [

                    Expanded(child:
                    Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                      Text(
                                 item.strCategory,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                 
                                    ),
                                  ),
                               Obx(() {
            bool isFavorite = controller.isFavorite(item);
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                if (isFavorite) {
                  controller.removeFromFavorites(item);
                } else {
                  controller.addToFavorites(item);
                }
              },
            );
          }),
                                  const SizedBox(height: 10,),
                                   Text(
                              item. strCategoryDescription,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5,),
                                      const Text(
                               '\$40.5',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
 ])),

Column(children: [
 ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: Image.network(item.strCategoryThumb,height: 120,
  errorBuilder: (context, error, stackTrace) {
    return const Icon(Icons.broken_image, size: 120);
  },
  
  )),
  const SizedBox(height: 20,),
 Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow[700]),
                                  Icon(Icons.star, color: Colors.yellow[700]),
                                  Icon(Icons.star, color: Colors.yellow[700]),
                             
                                  const SizedBox(width: 8),
                                  const Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                     InkWell(onTap: () {
                                       controllers.addtocart(item);
                                     },
                                      
                                      child: const Icon(Icons.shopping_cart, color:mainColor)),
                                ],
                              ),


],),
                  ])),
                  
                  ),   const Divider(color: Colors.black38,endIndent: 25,indent: 25,),
                     ]);  
                   
                     
  }}

 