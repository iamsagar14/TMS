import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static const _favoriteKeyPrefix = 'favorite_';
     static const _languageKey = 'selectedLanguage';


  late final FlutterSecureStorage _storage = _createStorage();
  FlutterSecureStorage _createStorage() {
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: androidOptions);
    return storage;
  }

  Future<void> saveFavorite(String id, bool isFavorite) async {
    await _storage.write(
      key: '$_favoriteKeyPrefix$id',
      value: isFavorite.toString(),
    );
  }

  Future<bool> loadFavorite(String id) async {
    final value = await _storage.read(key: '$_favoriteKeyPrefix$id');
    return value == 'true';
  }
     void saveSelectedLanguage(String languageCode) {
    _storage.write(key: _languageKey, value: languageCode);
  }

  Future<String?> getSelectedLanguage() async {
    return await _storage.read(key: _languageKey);
  }
}
