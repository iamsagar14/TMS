import 'package:dio/dio.dart';
import 'package:tms/app/data/model/place_category.dart';
import 'package:tms/services/api/endpoint.dart';

class PlaceCategorApi {
  final Dio _apiClient;

  PlaceCategorApi({
    required Dio apiClient,
  }) : _apiClient = apiClient {
    _apiClient.options.headers['requires_token'] = false;
  }

  Future<List<PlaceCategory>?> fetchPlaceCategoryAPi({
    required int page,
    String? search,
  }) async {
    try {
      _apiClient.options.headers['requires_token'] = false;
      var response = await _apiClient.get(
        Endpoint.placeCategory,
        queryParameters: {
          "p": page,
          "search": search,
        },
      );
      _apiClient.options.headers['requires_token'] = false;
      if (response.statusCode == 200) {
        final decodedResponse = response.data;
        return List<PlaceCategory>.from(
          decodedResponse["data"].map(
            (x) => PlaceCategory.fromMap(x),
          ),
        );
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }
}
