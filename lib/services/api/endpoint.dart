// 🌎 Project imports:
import 'package:tms/config/config.dart';
import 'package:tms/services/locator.dart';

class Endpoint {
  Endpoint._();

  static final String baseUrl = locator.get<Config>().baseUrl;
    static const String placeCategory = '';
  static const String popularplaces = '';
}
