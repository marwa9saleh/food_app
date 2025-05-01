// class Product {
//   final int id;
//   final String name;
//   final double price;

//   Product({required this.id, required this.name, required this.price});

//   // تحويل من JSON إلى Product
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'].toDouble(),
//     );
//   }

//   // تحويل من Product إلى JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//     };
//   }
// }

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'dart:convert';
// import 'product_model.dart';

// class CartController extends GetxController {
//   final box = GetStorage();
//   var cartItems = <Product>[].obs; // قائمة من المنتجات

//   @override
//   void onInit() {
//     super.onInit();
//     loadCart();
//   }

//   void addToCart(Product product) {
//     cartItems.add(product);
//     saveCart();
//   }

//   void removeFromCart(int index) {
//     cartItems.removeAt(index);
//     saveCart();
//   }

//   void saveCart() {
//     // حفظ القائمة إلى التخزين
//     box.write('cart', jsonEncode(cartItems.map((item) => item.toJson()).toList()));
//   }

//   void loadCart() {
//     // استرجاع البيانات من التخزين
//     String? storedCart = box.read('cart');
//     if (storedCart != null) {
//       List<dynamic> savedCart = jsonDecode(storedCart);
//       cartItems.assignAll(savedCart.map((json) => Product.fromJson(json)).toList());
//     }
//   }
// }
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'product_model.dart';

// class ProductService {
//   static Future<List<Product>> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://api.example.com/products'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Product.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'product_model.dart';
// import 'cart_controller.dart';
// import 'product_service.dart';

// class ProductsScreen extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('المنتجات'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: ProductService.fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('حدث خطأ: ${snapshot.error}'));
//           } else {
//             final products = snapshot.data!;
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text('السعر: ${product.price}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.add_shopping_cart),
//                     onPressed: () {
//                       cartController.addToCart(product);
//                       Get.snackbar('تمت الإضافة', '${product.name} تمت إضافته إلى السلة');
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
