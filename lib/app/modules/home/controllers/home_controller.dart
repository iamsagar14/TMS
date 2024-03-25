// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/app/data/model/populaer_place.dart';
import 'package:tms/app/data/model/place_category.dart';

// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/api/popularplace_api.dart';
import 'package:tms/services/api/placecategory_api.dart';
import 'package:tms/services/locator.dart';
import 'package:tms/utils/form_input.dart';

class HomeController extends GetxController {
  final Config config = locator.get<Config>();
  final _categoryApi = locator.get<PlaceCategorApi>();
  final _popularPlaceApi = locator.get<PopularPlaceApi>();
  RxList<PlaceCategory> placeCategory = <PlaceCategory>[].obs;
  RxList<PopularPlace> popularPlace = <PopularPlace>[].obs;
  RxList<PopularPlace> favoritePlace = <PopularPlace>[].obs;
  RxBool isLoading = false.obs;
  RxBool hasReachedMax = false.obs;

  TextInput searchInput = const TextInput.pure();
  int page = 1;

  @override
  void onInit() {
    fetchPlaceCategory();
    fetchPopularPlaces();
    super.onInit();
  }

  void search() {
    clearPlaceList();
    fetchPopularPlaces();
  }

  Future<void> fetchPopularPlaces() async {
    try {
      isLoading(true);
      final result = await _popularPlaceApi.fetchPoluparPlace(
        page: page,
        search: searchInput.value,
      );
      if (result != null) {
        popularPlace.addAll(result);
        List<PopularPlace> favoritePlaces =
            result.where((place) => place.isfavorite == true).toList();
        favoritePlace.addAll(favoritePlaces);
        if (result.isNotEmpty) {
          page++;
        } else {
          hasReachedMax(true);
        }
      }
      isLoading(false);
    } catch (_) {
      isLoading(false);
    }
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

  void clearPlaceList() {
    page = 1;
    popularPlace([]);
    hasReachedMax(false);
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
