import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class TranslationService {
  static Future<Map<String, dynamic>> fetchTranslations(String locale) async {
    try {
      Logger().e(locale);
      final response = await http.get(
        Uri.http(
          '51.68.212.10:17485',
          'api/configs/get',
        ),
      );
      int index = locale == 'ar'
          ? 0
          : locale == 'en'
              ? 1
              : 2;
      String langKey = locale == 'ar'
          ? 'Ar'
          : locale == 'en'
              ? 'En'
              : 'Tr';
      Logger().e(response.statusCode);
      Logger().e(response.body);
      if (response.statusCode == 200) {
        return json.decode(
          utf8.decode(response.bodyBytes),
        )['configs']['languages'][index][langKey];
      } else {
        return {};
      }
    } catch (e, s) {
      Logger().e('$e, $s');
      return {};
    }
  }
}

class NetworkAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    try {
      return await TranslationService.fetchTranslations(locale.languageCode);
    } catch (e) {
      throw Exception('Failed to load translations: $e');
    }
  }
}
