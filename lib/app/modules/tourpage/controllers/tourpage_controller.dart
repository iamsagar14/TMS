import 'package:get/get.dart';
import 'package:tms/app/data/model/CategoryPlace.dart';

class TourpageController extends GetxController {
  CategoryPlace? categoryPlace;
  final count = 0.obs;
  @override
  void onInit() {
    categoryPlace = Get.arguments['favoritePlace'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
