import 'package:flutter_application_1/models/data_model.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var cartProducts = <FoodModel>[].obs;
  RxInt cartCount = 0.obs;
  final box = GetStorage();
  var quantities = <int>[].obs;
  void increaseQuantity(int index) {
    if (index < quantities.length) {
      quantities[index]++;
      cartProducts[index] =
          cartProducts[index].copyWith(quantity: quantities[index]);
      _saveCart(); // حفظ الكميات الجديدة
      updateCartCount();
    }
    // تحديث العدد في أيقونة السلة
  }

  void decreaseQuantity(int index) {
    if (index < quantities.length && quantities[index] > 1) {
      quantities[index]--;
      cartProducts[index] =
          cartProducts[index].copyWith(quantity: quantities[index]);
      _saveCart(); // حفظ التحديثات
      updateCartCount();
    }
  }

  void updateCartCount() {
    cartCount.value = quantities.fold(0, (sum, item) => sum + item);

    // cartCount.value = cartProducts.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }
  // قائمة تحتوي على كميات العناصر

  // دالة لتهيئة قائمة الكميات عند تحميل البيانات
  void initializeQuantities() {
    quantities.assignAll(cartProducts.map((item) => item.quantity).toList());
  }

  // دالة لزيادة كمية العنصر بناءً على index

  void _loadCart() {
    List<dynamic>? savedCart = box.read<List>('cart');
    List<dynamic>? savedQuantities = box.read<List>('quantities');
    if (savedCart != null) {
      cartProducts
          .assignAll(savedCart.map((e) => FoodModel.fromjson(e)).toList());
      // cartCount.value = cartProducts.length;
    }
    if (savedQuantities != null &&
        savedQuantities.length == cartProducts.length) {
      quantities
          .assignAll(savedQuantities.cast<int>()); // ✅ استرجاع الكميات المحفوظة
    } else {
      initializeQuantities(); // ✅ في حال لم يكن هناك كميات محفوظة، قم بتعيين الافتراضية
    }
    updateCartCount();
  }

  void _saveCart() {
    box.write('cart', cartProducts.map((e) => e.toJson()).toList());
    box.write('quantities', quantities.toList());
  }

  void addToCart(FoodModel product) {
    cartProducts.add(product);
    quantities.add(product.quantity);
    // cartCount.value = cartProducts.length;
    updateCartCount();
    _saveCart(); // حفظ السلة
  }

  void removeFromCart(FoodModel product) {
    int index = cartProducts.indexOf(product);
    if (index != -1) {
      cartProducts.removeAt(index);
      quantities.removeAt(index); // احذف الكمية المرتبطة به
      updateCartCount();
      _saveCart();
    }
  }

  void clearCart() {
    cartProducts.clear();
    quantities.clear();
    cartCount.value = 0;

    box.remove('cart');
    box.remove('quantities');

    _saveCart();
  }
}
