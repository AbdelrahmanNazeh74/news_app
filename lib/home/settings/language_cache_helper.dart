import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String LanguageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", LanguageCode);
  }

  Future<String> getCacheLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
