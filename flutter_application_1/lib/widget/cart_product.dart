import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  // final Product productModels;
  // final int index;
  // final int quantity;
  CartProduct({
    // required this.productModels,
    // required this.index,
    // required this.quantity,
    Key? key, required int index,
  }) : super(key: key);

  // final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        // color: Get.isDarkMode
        //     ? pinkClr.withOpacity(0.7)
        //     : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image:AssetImage('assets/images/bu.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'sandwiche',
                  // productModels.title!,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    // color: Get.isDarkMode ? Colors.white : Colors.black,
                    color: Colors.black ,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  // "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                   "\$20",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    // color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // controller.removeProductsFarmCart(productModels);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      // color: Get.isDarkMode ? Colors.white : Colors.black,\
                        color:Colors.black,
                    ),
                  ),
                  const Text(
                    // "$quantity",
                     "30",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // controller.addProductToCart(productModels);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      // color: Get.isDarkMode ? Colors.white : Colors.black,
                         color:   Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // controller.removeOneProduct(productModels);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  // color: Get.isDarkMode ? Colors.black : Colors.red,
                    color: Colors.black ,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}