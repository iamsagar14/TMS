// 📦 Package imports:
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tms/config/config.dart';
import 'package:tms/services/api/interceptor/error_interceptor.dart';

// 🌎 Project imports:
class BaseClient {
  final Config _config;
  BaseClient({
    required Config config,
  }) : _config = config;

  Future<Dio> createDio() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: _config.baseUrl,
      // connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      responseType: ResponseType.json,
    );
    dio.interceptors.addAll(
      [
        ErrorInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ],
    );
    return dio;
  }
}
