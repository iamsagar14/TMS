import 'package:dio/dio.dart';
import 'package:tms/app/data/model/populaer_place.dart';
import 'package:tms/services/api/endpoint.dart';

class PopularPlaceApi {
  final Dio _apiClient;

  PopularPlaceApi({
    required Dio apiClient,
  }) : _apiClient = apiClient {
    _apiClient.options.headers['requires_token'] = false;
  }

  Future<List<PopularPlace>?> fetchPoluparPlace({
    required int page,
    String? search,
  }) async {
    try {
      _apiClient.options.headers['requires_token'] = false;
      var response = await _apiClient.get(
        Endpoint.popularplaces,
        queryParameters: {
          "p": page,
          "search": search,
        },
      );
      _apiClient.options.headers['requires_token'] = true;
      if (response.statusCode == 200) {
        final decodedResponse = response.data;
        return List<PopularPlace>.from(
            decodedResponse["data"].map((x) => PopularPlace.fromMap(x)));
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }
}
