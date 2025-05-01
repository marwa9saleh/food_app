import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/controllers/auth_controller.dart';

import 'package:flutter_application_1/logic/controllers/setting_controller.dart';
import 'package:flutter_application_1/view/screens/edit_screen.dart';
import 'package:flutter_application_1/widget/Setting/forward_button.dart';

import 'package:flutter_application_1/widget/Setting/setting_item.dart';
import 'package:flutter_application_1/widget/Setting/setting_switch.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final controller = Get.find<SettingsController>();
  final controllers = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     leading: IconButton(
    //       onPressed: () {},
    //       icon: const Icon(Icons.arrow_back),
    //     ),
    //     leadingWidth: 80,
    //   ),

Container(
  
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

     
      child:Padding(padding: const EdgeInsets.all( 10),child: 


      //  SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
        // child: Padding(
        //   padding: const EdgeInsets.all(30),
          // child:
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings'.tr,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Account".tr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset('assets/images/avatar.png',
                        width: 70, height: 70),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uranus Code".tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Youtube Channel".tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditAccountScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Settings".tr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text('Change Language'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.changeLanguage('en'),
                    child: Text('English'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.changeLanguage('ar'),
                    child: Text('العربية'),
                  ),
                ],
              ),
              // SettingItem(
              //   title: "Language",
              //   icon: Ionicons.earth,
              //   bgColor: Colors.orange.shade100,
              //   iconColor: Colors.orange,
              //   value: "English",
              //   onTap: () {
              //     controller.changeLanguage('en');
              //   },
              // ),
              // const SizedBox(height: 20),
              // SettingItem(
              //   title: "Notifications",
              //   icon: Ionicons.notifications,
              //   bgColor: Colors.blue.shade100,
              //   iconColor: Colors.blue,
              //   onTap: () {},
              // ),
              const SizedBox(height: 20),
              Obx(
                () => SettingSwitch(
                  title: "Dark Mode",
                  icon: Ionicons.return_down_back_sharp,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  value: controller.isDarkMode.value,
                  onTap: (value) {
                    controller.toggleTheme();
                  },
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Logout",
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  // Get.snackbar("Logged Out", "You have been logged out.",
                  //     snackPosition: SnackPosition.BOTTOM ,
                  Get.defaultDialog(
                    title: 'Logged Out',
                    content: const Text('You have been logged out'),
                    confirm: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        controllers.signOutFromApp();
                        Get.back();
                      },
                      child: const Text('LogOut',
                          style: TextStyle(color: Colors.black)),
                    ),
                    cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
       
    );
  }
}
