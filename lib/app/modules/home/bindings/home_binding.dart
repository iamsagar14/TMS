// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:tms/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
