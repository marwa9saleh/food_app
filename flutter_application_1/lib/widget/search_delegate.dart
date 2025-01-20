// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/logic/controllers/data_controller.dart';

// import 'package:get/get.dart';


// class CustomSearchDelegate extends SearchDelegate {
//   final DataController controller = Get.find<DataController>();

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           controller.search(query);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     controller.search(query);
//     return Obx(() {
//       return ListView.builder(
//         itemCount: controller.filteredItems.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(controller.filteredItems[index].strCategory),
//             onTap: () {
//               close(context, controller.filteredItems[index].strCategory);
//             },
//           );
//         },
//       );
//     });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     controller.search(query);
//     return Obx(() {
//       return ListView.builder(
//         itemCount: controller.filteredItems.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(controller.filteredItems[index].strCategory),
//             onTap: () {
//               query = controller.filteredItems[index].strCategory;
//               controller.search(query);
//             },
//           );
//         },
//       );
//     });
//   }
// }

