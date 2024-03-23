import 'package:get/get.dart';

import '../controllers/tourpage_controller.dart';

class TourpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourpageController>(
      () => TourpageController(),
    );
  }
}
