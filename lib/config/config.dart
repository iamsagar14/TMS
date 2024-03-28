part 'flavor.dart';

class Config {
  Flavor currentFlavor = Flavor.development;
  String get description {
    return 'Currently configured in ${currentFlavor.name} flavor.';
  }

  String get applicationName {
    switch (currentFlavor) {
      case Flavor.development:
        return "[DEV] Tms";
      case Flavor.staging:
        return "[STG] Tms";
      case Flavor.production:
        return "Tms";
    }
  }

  String get baseUrl {
    switch (currentFlavor) {
      case Flavor.development:
        return 'http://192.168.101.5:8000/';
      case Flavor.staging:
        throw UnimplementedError();
      case Flavor.production:
        throw UnimplementedError();
    }
  }
}
