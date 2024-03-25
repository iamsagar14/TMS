// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/api/base_client.dart';
import 'package:tms/services/api/popularplace_api.dart';
import 'package:tms/services/api/manager/storage_manager.dart';
import 'package:tms/services/api/placecategory_api.dart';

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
    () => PopularPlaceApi(apiClient: locator()),
  );
  locator.registerLazySingleton(
    () => PlaceCategorApi(apiClient: locator()),
  );
}
