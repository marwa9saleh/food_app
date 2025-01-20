import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/data_controller.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
    final DataController controller = Get.find<DataController>();
SearchWidget({super.key, });

  @override
  Widget build(BuildContext context) {
     return GetBuilder<DataController>(
      builder: (_) => TextField(
        controller: controller.searchTextController,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (query) {
          controller.search(query);
        },
        decoration: InputDecoration(
          fillColor: Get.isDarkMode ? Colors.black : Colors.white,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                )
              : null,
          hintText: "Search with name",
          hintStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: five),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  //   return InkWell(
  //     onTap: ontap,
  //     child: 
   
  //   Container(
  //     width: MediaQuery.sizeOf(context).width * 0.80,
  //     decoration: ShapeDecoration(
  //       color: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       shadows: const [
  //         BoxShadow(
  //           color: Color(0x26000000),
  //           blurRadius: 19,
  //           offset: Offset(0, 4),
  //           spreadRadius: 0,
  //         )
  //       ],
  //     ),child: 
  //        const Padding(
  //       padding:EdgeInsets.all(16.0),
  //       child: 
  //      Row(
  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [Text('search'),
          
  //         Icon(Icons.search),
          
  //         ],
  //       ),
  //     ),),
  //   );

  }
}
