// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/api/base_client.dart';
import 'package:tms/services/api/category_api.dart';
import 'package:tms/services/api/manager/storage_manager.dart';
import 'package:tms/services/api/popular_place_api.dart';

GetIt locator = GetIt.instance;
void initLocator() {
  locator.registerLazySingleton(
    () => Config(),
  );

  locator.registerLazySingleton(() => BaseClient(config: locator()));
  locator.registerSingletonAsync<Dio>(
    () => locator<BaseClient>().createDio(),
  );

  locator.registerLazySingleton(
    () => StorageManager(),
  );
  locator.registerLazySingleton(
    () => CategoryApi(apiClient: locator()),
  );
  locator.registerLazySingleton(
    () => PopularPlaceApi(apiClient: locator()),
  );
}
