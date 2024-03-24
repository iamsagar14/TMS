// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/app/data/model/CategoryPlace.dart';
import 'package:tms/app/data/model/popular_place_model.dart';

// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/api/category_api.dart';
import 'package:tms/services/api/popular_place_api.dart';
import 'package:tms/services/locator.dart';

class HomeController extends GetxController {
  final Config config = locator.get<Config>();
  final _categoryApi = locator.get<CategoryApi>();
  final _popularPlaceApi = locator.get<PopularPlaceApi>();
  RxList<CategoryPlace> placeCategory = <CategoryPlace>[].obs;
  RxList<PopularPlace> popularPlace = <PopularPlace>[].obs;
  int page = 1;

  @override
  void onInit() {
    fetchPlaceCategory();
    super.onInit();
  }

  Future<void> fetchPlaceCategory() async {
    try {
      final result = await _categoryApi.fetchPlaceCategory(page: page);
      if (result != null) {
        placeCategory.addAll(result);
        if (result.isNotEmpty) {
          page++;
        }
      }
    } catch (_) {}
  }

  Future<void> fetchPopularPlaces() async {
    try {
      final result = await _popularPlaceApi.fetchPopularPlaceAPi(page: 1);
      if (result != null) {}
    } catch (_) {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
