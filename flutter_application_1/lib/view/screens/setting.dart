// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/logic/controllers/auth_controller.dart';
// import 'package:flutter_application_1/utils/theme.dart';
// import 'package:get/get.dart';
// // class SettingsScreen extends GetxController {
// //   var isDarkMode = false.obs;
// //   var isNotificationsEnabled = true.obs;
// // }

// class SettingsScreen extends StatelessWidget {
//      SettingsScreen({super.key});
//   final controller = Get.find<AuthController>();
//   // final SettingsController settingsController = Get.put(SettingsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         shadowColor: Colors.white,
//         title: const Text("Settings"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body:
//         ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             child: const Text(
//               "General Settings",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           // Obx(() => 
//           SwitchListTile(activeColor: five,
//           inactiveThumbColor: Colors.grey,
            
//               // thumbColor:mainColor,
//                 title: const Text("Dark Mode"),
//                 subtitle: const Text("Enable dark theme for the app."),
//                 value: true, onChanged: (bool value) {  },
//                 // onChanged: (value) {
//                 //   settingsController.isDarkMode.value = value;
//                 //   Get.snackbar(
//                 //     "Theme Changed",
//                 //     value ? "Dark mode enabled" : "Light mode enabled",
//                 //     snackPosition: SnackPosition.BOTTOM,
//                 //   );
//                 // },
//               // )
//               ),
//           // const Divider(),
//           // Obx(() => SwitchListTile(
//           //       title: const Text("Enable Notifications"),
//           //       subtitle: const Text("Get notified about updates."),
//           //       value: settingsController.isNotificationsEnabled.value,
//           //       onChanged: (value) {
//           //         settingsController.isNotificationsEnabled.value = value;
//           //         Get.snackbar(
//           //           "Notifications",
//           //           value ? "Notifications enabled" : "Notifications disabled",
//           //           snackPosition: SnackPosition.BOTTOM,
//           //         );
//           //       },
//           //     )),
          
//           const Divider(),
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             child: const Text(
//               "Account Settings",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//            ListTile(
//             // leading: Icon(Icons.account_circle_outlined),
//             leading: Container(
//                 height: 100,
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/personal1.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//             title: const Text("Account Info"),
//             subtitle: const Text("Mawda.sale@gmail.com"),
//             // trailing: Icon(Icons.arrow_forward_ios),
//             // onTap: () {
//             //   Get.to(() => AccountInfoPage());
//             // },
//           ),
//           const Divider(),
//         GetBuilder<AuthController>(builder: (_) {
//                       return 
//           ListTile(
//             leading: const Icon(Icons.logout,color: Colors.red,),
//             title: const Text("Logout"),
//             subtitle: const Text("Sign out from the app."),
//             onTap: () {
//               // // Add logout logic here
//               // Get.snackbar("Logged Out", "You have been logged out.",
//               //     snackPosition: SnackPosition.BOTTOM,
//                 Get.defaultDialog(
//                               title: 'Logged Out',
//                               content: const Text('You have been logged out'),
//                               confirm: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.red,
//                                 ),
//                                 onPressed: () {
//                                   controller.signOutFromApp();
//                                   Get.back();
//                                 },
//                                 child: const Text('LogOut',
//                                     style: TextStyle(color: Colors.black)),
//                               ),
//                               cancel: ElevatedButton(
//                                 onPressed: () {
//                                   Get.back();
//                                 },
//                                 child: const Text('Cancel',
//                                     style: TextStyle(color: Colors.black)),
//                               ),
//                             );
                  
                  
                  
//             },
//           );},)
//         ],
//       ),
  
//     );
//   }
// }
