import 'package:get/get.dart';
import 'package:tms/app/data/model/populaer_place.dart';

class TourpageController extends GetxController {
  PopularPlace? categoryPlace;
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
