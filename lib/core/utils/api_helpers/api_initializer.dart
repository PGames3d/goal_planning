import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';
import 'app_interceptors.dart';
import 'dio_adapters/dio_adapter_stub.dart'
    if (dart.library.js) 'dio_adapters/dio_adapter_web.dart';

class ApiInitializer {
  ApiInitializer._();

  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
        headers: <String, String>{
          'content-type': 'application/json',
          "Accept": "application/json"
        },
        receiveTimeout: const Duration(seconds: AppConstants.readTimeOut),
        connectTimeout: const Duration(seconds: AppConstants.connectTimeOut)
        // receiveTimeout: AppConstants.readTimeOut,
        // connectTimeout: AppConstants.connectTimeOut
        ));

    dio.interceptors.add(AppInterceptors(dio));
    // Custom `jsonDecodeCallback`.
    //dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;
    if (kIsWeb && !kReleaseMode) {
      dynamic adapter = getAdapter();
      //adapter.withCredentials = true;
      dio.httpClientAdapter = adapter;
    }

    return dio;
  }

  /// Must be top-level function
  static Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> parseJson(String text) {
    return compute(_parseAndDecode, text);
  }
}
