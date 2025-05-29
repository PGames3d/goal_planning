import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kias/core/data/model/all_flag_model.dart';
import 'package:kias/core/data/model/basic_info_model.dart';
import 'package:kias/core/data/model/switch_model.dart';

import '../data/services/common_api_service.dart';
import '../data/services/locator.dart';
import '../utils/constants/app_keys.dart';


abstract class CommonRepository {
  Future<AllFlagsModel?> getAllFlags({required Map<String,dynamic> body});
  Future<BasicInfoModel?> getBasicInfo({required Map<String,dynamic> body});
  Future<SwitchModel?> getSwitches({required Map<String,dynamic> body});
}

class CommonRepositoryImpl extends CommonRepository {
  final CommonApiService _apiService;

  /// Constructor that takes CommonApiService
  CommonRepositoryImpl(this._apiService);

  /// Singleton instance
  static CommonRepositoryImpl? _instance;

  /// Factory constructor that returns a singleton instance
  factory CommonRepositoryImpl.getInstance() {
    _instance ??= CommonRepositoryImpl(
      CommonApiService(locator<Dio>(),baseUrl: AppKeys.apiUrl),
    );
    return _instance!;
  }

  @override
  Future<AllFlagsModel?> getAllFlags({required Map<String,dynamic> body}) async{
    try {
      final response = await _apiService.allFlags(body);

      if (response.response.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(response.data);
        final apiResponse = AllFlagsModel.fromJson(jsonResponse);

        return apiResponse;
      } else {
        logger.e('Failed to fetch user details: ${response.response.statusMessage}');
        return null;
      }
    } catch (e) {
      logger.e('Error fetching user details: $e');
      return null;
    }
  }

  @override
  Future<BasicInfoModel?> getBasicInfo({required Map<String,dynamic> body}) async{
    try {
      final response = await _apiService.basicInfo(body);

      if (response.response.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(response.data);
        final apiResponse = BasicInfoModel.fromJson(jsonResponse);

        return apiResponse;
      } else {
        logger.e('Failed to fetch user details: ${response.response.statusMessage}');
        return null;
      }
    } catch (e) {
      logger.e('Error fetching user details: $e');
      return null;
    }
  }

  @override
  Future<SwitchModel?> getSwitches({required Map<String,dynamic> body}) async{
    try {
      final response = await _apiService.switches(body);

      if (response.response.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(response.data);
        final apiResponse = SwitchModel.fromJson(jsonResponse);

        return apiResponse;
      } else {
        logger.e('Failed to fetch user details: ${response.response.statusMessage}');
        return null;
      }
    } catch (e) {
      logger.e('Error fetching user details: $e');
      return null;
    }
  }

}
