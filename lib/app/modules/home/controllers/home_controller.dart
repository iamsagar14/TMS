// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/app/data/model/populaer_place.dart';
import 'package:tms/app/data/model/place_category.dart';

// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/api/popularplace_api.dart';
import 'package:tms/services/api/placecategory_api.dart';
import 'package:tms/services/locator.dart';

class HomeController extends GetxController {
  final Config config = locator.get<Config>();
  final _categoryApi = locator.get<PlaceCategorApi>();
  final _popularPlaceApi = locator.get<PopularPlaceApi>();
  RxList<PlaceCategory> placeCategory = <PlaceCategory>[].obs;
  RxList<PopularPlace> popularPlace = <PopularPlace>[].obs;
  int page = 1;

  @override
  void onInit() {
    fetchPlaceCategory();
    fetchPopularPlaces();
    super.onInit();
  }

  Future<void> fetchPopularPlaces() async {
    try {
      final result = await _popularPlaceApi.fetchPoluparPlace(page: page);
      if (result != null) {
        popularPlace.addAll(result);
        if (result.isNotEmpty) {
          page++;
        }
      }
    } catch (_) {}
  }

  Future<void> fetchPlaceCategory() async {
    try {
      final result = await _categoryApi.fetchPlaceCategoryAPi(page: 1);
      if (result != null) {
        placeCategory.addAll(result);
        if (result.isNotEmpty) {
          page++;
        }
      }
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
