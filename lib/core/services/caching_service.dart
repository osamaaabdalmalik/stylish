import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:stylish/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  T? getData<T>({required String key});

  Future<Unit> setData({required String key, required dynamic value});

  Future<Unit> clear();
}

class CacheServiceImpl extends CacheService {
  final SharedPreferences pref;

  CacheServiceImpl({required this.pref});

  @override
  T? getData<T>({required String key}) {
    InjectionContainer.getIt<Logger>().i("Start `getData` in |CacheService| ~~key~~ $key");
    T? value;
    if (T.toString() == 'int') {
      value = pref.getInt(key) as T?;
    }
    if (T.toString() == 'double') {
      value = pref.getDouble(key) as T?;
    }
    if (T.toString() == 'bool') {
      value = pref.getBool(key) as T?;
    }
    if (T.toString() == 'String') {
      value = pref.getString(key) as T?;
    }
    InjectionContainer.getIt<Logger>().w(
      "End `getData` in |CacheService| ~~$key~~ $value",
    );
    return value;
  }

  @override
  Future<Unit> setData({required String key, required dynamic value}) async {
    InjectionContainer.getIt<Logger>().i(
      "Start `setData` in |CacheService| ~~key~~ $key, ~~value~~ $value",
    );
    bool isSetDone = false;
    if (value is int) {
      isSetDone = await pref.setInt(key, value);
    }
    if (value is double) {
      isSetDone = await pref.setDouble(key, value);
    }
    if (value is bool) {
      isSetDone = await pref.setBool(key, value);
    }
    if (value is String) {
      isSetDone = await pref.setString(key, value);
    }
    if (value == null) {
      isSetDone = await pref.remove(key);
    }
    InjectionContainer.getIt<Logger>().w(
      "End `setData` in |CacheService| ~~isSetDone~~ $isSetDone",
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> clear() async {
    InjectionContainer.getIt<Logger>().i("Start `clear` in |CacheService|");
    final clear = await pref.clear();
    InjectionContainer.getIt<Logger>().w(
      "End `clear` in |CacheService| ~~isClear~~ $clear ",
    );
    return Future.value(unit);
  }
}
