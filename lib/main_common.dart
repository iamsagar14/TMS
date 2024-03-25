// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:tms/app/routes/app_pages.dart';
import 'package:tms/config/config.dart';
import 'package:tms/generated/locales.g.dart';
import 'package:tms/services/api/manager/storage_manager.dart';
import 'package:tms/services/locator.dart' as di;

void mainCommon({required Flavor flavor}) async {
  di.initLocator();
  di.locator.get<Config>().currentFlavor = flavor;
  StorageManager storageManager = di.locator.get<StorageManager>();
  String? _selectedLanguage = await storageManager.getSelectedLanguage();
  Locale locale = _selectedLanguage != null
      ? Locale(_selectedLanguage)
      : const Locale('en', 'Us');
  Get.updateLocale(locale);
  runApp(GetMaterialApp(
    title: di.locator.get<Config>().applicationName,
    initialRoute: AppPages.INITIAL,
    translationsKeys: AppTranslation.translations,
    locale: locale,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    theme: ThemeData(
      fontFamily: 'Rubik',
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    ),
  ));
}
