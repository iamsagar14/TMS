import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/services/api/manager/storage_manager.dart';
import 'package:tms/services/locator.dart';

class ProfileController extends GetxController {
 final _storageManager = locator.get<StorageManager>();

  void changeLanguage(Locale locale) async {
    var selectededLanguage = locale;
    Get.updateLocale(locale);
    _storageManager.saveSelectedLanguage(selectededLanguage.languageCode);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final selectedLanguage = await _storageManager.getSelectedLanguage();
    if (selectedLanguage != null) {
      final locale = Locale(selectedLanguage);
      Get.updateLocale(locale);
    }
  }
}
