import 'package:flutter/material.dart';

import 'package:flutter_application_1/logic/controllers/cart_controller.dart';
import 'package:flutter_application_1/widget/button_widget.dart';

import 'package:get/get.dart';

class DetCart extends StatelessWidget {
  DetCart({super.key});

  final controllers = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cart Items".tr),
        elevation: 0,

        centerTitle: true,

//           actions: [
//             IconButton(
//               onPressed: () {

//             if (Get.isRegistered<CartController>()) {
//       debugPrint("CartController موجود!");

//             Get.offNamed(Routes.home);

//     } else {
//       debugPrint("CartController غير موجود!");
//     }
//   },
//   icon: const Icon(Icons.arrow_back),

// ),
//           ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            if (controllers.cartProducts.isEmpty) {
              return Center(
                child: Text(
                  'No item added yet!'.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: 400, // Set a fixed height or wrap with Expanded
                  child: ListView.builder(
                    shrinkWrap:
                        true, // Ensures ListView takes only necessary space
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                    itemCount: controllers.cartProducts.length,
                    itemBuilder: (context, index) {
                      final item = controllers.cartProducts[index];
                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        child: ListTile(
                          leading: Image.network(
                            item.strCategoryThumb,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            item.strCategory,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            item.strCategoryDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          trailing: Obx(() {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      controllers.decreaseQuantity(index),
                                  icon: const Icon(Icons.remove, size: 15),
                                ),
                                Text(
                                  '${controllers.quantities[index]}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      controllers.increaseQuantity(index),
                                  icon: const Icon(Icons.add, size: 15),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>
                                      controllers.removeFromCart(item),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                But(
                  onPressed: () {
                    controllers.clearCart();
                  },
                  text: 'remove cart'.tr,
                  color: Colors.red,
                ),
              ],
            );
          }),
        ),
      ),
    ));
  }
}
