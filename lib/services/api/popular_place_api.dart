import 'package:dio/dio.dart';
import 'package:tms/app/data/model/popular_place_model.dart';
import 'package:tms/services/api/endpoint.dart';

class PopularPlaceApi {
  final Dio _apiClient;

  PopularPlaceApi({
    required Dio apiClient,
  }) : _apiClient = apiClient {
    _apiClient.options.headers['requires_token'] = false;
  }

  Future<List<PopularPlace>?> fetchPopularPlaceAPi({required int page}) async {
    try {
      _apiClient.options.headers['requires_token'] = false;
      var response = await _apiClient.get(
        Endpoint.popularplaces,
        queryParameters: {
          "p": page,
        },
      );
      _apiClient.options.headers['requires_token'] = false;
      if (response.statusCode == 200) {
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
