import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/route.dart';
import 'package:flutter_application_1/logic/controllers/cart_controller.dart';

import 'package:flutter_application_1/utils/theme.dart';

import 'package:get/get.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final controllers = Get.find<CartController>();
  // ignore: prefer_typing_uninitialized_variables
  final leading;
  CurvedAppBar({
    super.key,
    this.leading,
  });
  @override
  Widget build(
    BuildContext context,
  ) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [header1, mainColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
              // title: Text("Curved AppBar"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: leading,
              actions: [
                SizedBox(
                  width: 70,
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: five),

                        onPressed: () {
                          Get.toNamed(Routes.decart);
                        },

                        // Get.toNamed(Routes.decart);
                      ),
                      Positioned(
                          right: 5,
                          left: 5,
                          child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text("${controllers.cartCount}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10)))),
                    ],
                  ),
                ),
              ]
              //
              )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100); // ارتفاع الـ AppBar
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
