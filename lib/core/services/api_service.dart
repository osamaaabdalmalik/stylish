import 'dart:convert';
import 'dart:io';

import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/constants/app_keys.dart';
import 'package:stylish/core/helpers/exception.dart';
import 'package:stylish/core/services/caching_service.dart';
import 'package:stylish/core/services/network_info_service.dart';
import 'package:stylish/core/services/state_manager_service.dart';
import 'package:stylish/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class ApiService {
  Future<dynamic> get({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  });

  Future<dynamic> post({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    List<FileField> files = const [],
    bool needToken = true,
    String? alternativeToken,
  });

  Future<dynamic> put({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  });

  Future<dynamic> delete({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  });
}

class ApiServiceImpl extends ApiService {
  final http.Client client;
  final NetworkInfoService networkInfo;
  final CacheService cacheService;

  ApiServiceImpl({
    required this.client,
    required this.networkInfo,
    required this.cacheService,
  });

  @override
  Future<dynamic> get({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `get` |ApiServiceImpl| url: `$baseUrl$subUrl` parameters: $parameters headers: $headers',
      );
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final newHeaders = Map.of(headers);
      if (needToken) {
        newHeaders.addAll({
          'Authorization': 'Bearer ${alternativeToken ?? cacheService.getData<String>(
                key: AppKeys.accessToken,
              )}'
        });
      }
      final response = await client.get(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        headers: newHeaders,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `get` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${response.body}',
      );
      return Future.value((json.decode(response.body)));
    } catch (e, s) {
      if (e is UnAuthorizedException) {
        try {
          await getAccessToken();
          InjectionContainer.getIt<Logger>().f('Restart `get` `$subUrl` |ApiServiceImpl|');
          return await get(
            subUrl: subUrl,
            baseUrl: baseUrl,
            parameters: parameters,
            headers: headers,
            needToken: needToken,
            alternativeToken: alternativeToken,
          );
        } catch (e) {
          rethrow;
        }
      }
      InjectionContainer.getIt<Logger>().e(
        'End `get`|ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType} $s',
      );
      rethrow;
    }
  }

  @override
  Future<dynamic> post({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    List<FileField> files = const [],
    bool needToken = true,
    String? alternativeToken,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `post` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      if (files.isNotEmpty) {
        return _postWithFiles(
          subUrl: subUrl,
          baseUrl: baseUrl,
          data: data,
          parameters: parameters,
          headers: headers,
          files: files,
          needToken: needToken,
          token: alternativeToken,
        );
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final newHeaders = Map.of(headers);
      if (needToken) {
        newHeaders.addAll({
          'Authorization': 'Bearer ${alternativeToken ?? cacheService.getData<String>(
                key: AppKeys.accessToken,
              )}'
        });
      }
      final response = await client.post(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        body: json.encode(data),
        headers: newHeaders,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `post` `$baseUrl$subUrl` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      if (e is UnAuthorizedException) {
        try {
          await getAccessToken();
          InjectionContainer.getIt<Logger>().f('Restart `post` `$subUrl` |ApiServiceImpl|');
          return await post(
            subUrl: subUrl,
            baseUrl: baseUrl,
            data: data,
            parameters: parameters,
            headers: headers,
            needToken: needToken,
            alternativeToken: alternativeToken,
          );
        } catch (e) {
          rethrow;
        }
      }
      InjectionContainer.getIt<Logger>().e(
        'End `post` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }

  @override
  Future<dynamic> put({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `put` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final newHeaders = Map.of(headers);
      if (needToken) {
        newHeaders.addAll({
          'Authorization': 'Bearer ${alternativeToken ?? cacheService.getData<String>(
                key: AppKeys.accessToken,
              )}'
        });
      }
      final response = await client.put(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        body: json.encode(data),
        headers: newHeaders,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `put` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      if (e is UnAuthorizedException) {
        try {
          await getAccessToken();
          InjectionContainer.getIt<Logger>().f('Restart `put` `$subUrl` |ApiServiceImpl|');
          return await put(
            subUrl: subUrl,
            baseUrl: baseUrl,
            data: data,
            parameters: parameters,
            headers: headers,
            needToken: needToken,
            alternativeToken: alternativeToken,
          );
        } catch (e) {
          rethrow;
        }
      }
      InjectionContainer.getIt<Logger>().e(
        'End `put` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }

  @override
  Future<dynamic> delete({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool needToken = true,
    String? alternativeToken,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final newHeaders = Map.of(headers);
      if (needToken) {
        newHeaders.addAll({
          'Authorization': 'Bearer ${alternativeToken ?? cacheService.getData<String>(
                key: AppKeys.accessToken,
              )}'
        });
      }
      final response = await client.delete(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        body: json.encode(data),
        headers: newHeaders,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      if (e is UnAuthorizedException) {
        try {
          await getAccessToken();
          InjectionContainer.getIt<Logger>().f('Restart `delete` `$subUrl` |ApiServiceImpl|');
          return await delete(
            subUrl: subUrl,
            baseUrl: baseUrl,
            data: data,
            parameters: parameters,
            headers: headers,
            needToken: needToken,
            alternativeToken: alternativeToken,
          );
        } catch (e) {
          rethrow;
        }
      }
      InjectionContainer.getIt<Logger>().e(
        'End `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }

  Future<dynamic> _postWithFiles({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    List<FileField> files = const [],
    bool needToken = true,
    String? token,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Redirect` to _postWithFiles` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        Uri.http(
          baseUrl,
          subUrl,
        ),
      );
      Map<String, String> fields = {};
      data?.forEach(
        (key, value) {
          if (value is List) {
            for (var i = 0; i < value.length; i++) {
              fields.addAll({'$key[$i]': jsonEncode(value[i])});
            }
          } else {
            fields.addAll({key: value.toString()});
          }
        },
      );
      request.fields.addAll(fields);
      final contentTypeMap = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      };
      final newHeaders = Map.of(headers);
      newHeaders.addAll(contentTypeMap);
      parameters?.removeWhere((key, value) => value == 'null');
      if (needToken) {
        newHeaders.addAll({
          'Authorization': 'Bearer ${token ?? cacheService.getData<String>(
                key: AppKeys.accessToken,
              )}'
        });
      }
      request.headers.addAll(newHeaders);
      for (var e in files) {
        if (e.file != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              e.name,
              e.file!.path,
              filename: e.file!.path.split('/').last,
            ),
          );
        }
      }

      http.StreamedResponse res = await request.send();
      http.Response response = await http.Response.fromStream(res);
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `_postWithFiles` `$baseUrl$subUrl` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${jsonDecode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e) {
      if (e is UnAuthorizedException) {
        try {
          await getAccessToken();
          InjectionContainer.getIt<Logger>().f('Restart `_postWithFiles` `$subUrl` |ApiServiceImpl|');
          return await _postWithFiles(
            subUrl: subUrl,
            baseUrl: baseUrl,
            data: data,
            parameters: parameters,
            headers: headers,
            files: files,
            needToken: needToken,
            token: token,
          );
        } catch (e) {
          rethrow;
        }
      }
      InjectionContainer.getIt<Logger>().e(
        'End `_postWithFiles` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}',
      );
      rethrow;
    }
  }

  Future<Unit> getAccessToken() async {
    try {
      InjectionContainer.getIt<Logger>().i('Start getAccessToken |ApiServiceImpl|');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      final response = await client.post(
        Uri.http(AppEndpoints.baseUrl, AppEndpoints.refreshToken),
        headers: {
          'Authorization': 'Bearer ${cacheService.getData<String>(
            key: AppKeys.refreshToken,
          )}'
        },
      );
      StateManagerService.getExceptionStatusCode(response);
      final res = json.decode(response.body);
      cacheService.setData(
        key: AppKeys.accessToken,
        value: res['data']['access_token'],
      );
      cacheService.setData(
        key: AppKeys.refreshToken,
        value: res['data']['refresh_token'],
      );
      InjectionContainer.getIt<Logger>().f(
        'End getAccessToken |ApiServiceImpl| response:$res',
      );
      return Future.value(unit);
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        'End getAccessToken |ApiServiceImpl| Exception: ${e.runtimeType}',
      );
      rethrow;
    }
  }
}

class FileField {
  final String name;
  final File? file;

  FileField({required this.name, this.file});
}
