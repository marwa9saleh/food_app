import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var selectedLanguage = 'en'.obs;
  final box = GetStorage();

  @override
  void onInit() {
    selectedLanguage.value = box.read('selectedLanguage') ?? 'en';
    Get.updateLocale(Locale(selectedLanguage.value));
    super.onInit();
  }

  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    box.write('selectedLanguage', langCode);
    Get.updateLocale(Locale(langCode));
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
