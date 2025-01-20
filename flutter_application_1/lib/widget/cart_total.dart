import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/widget/text_widget.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  // final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return 
    // Obx(
      // () => 
      Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: "Total",
                  color: Colors.grey,
                  underline: TextDecoration.none,
                ),
                Text(
                  // "\$${controller.total}",
                        "\$20",
                  style: TextStyle(
                    // color: Get.isDarkMode ? Colors.white : Colors.black,
                    color:  Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    backgroundColor: five,
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Get.toNamed(Routes.paymentScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        GestureDetector(
      onTap: (){ 
         Get.offNamed(Routes.pay);
         },
                        child: const Text(
                          "Check Out",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    // );
  }
}