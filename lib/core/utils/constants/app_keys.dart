import 'package:kias/core/data/services/locator.dart';
import 'package:kias/core/repository/secured_local_repository.dart';
import 'package:kias/core/utils/constants/app_constants.dart';

/// Represents the available app environments
enum Environment {
  staging,
  production,
}

/// Contains all API endpoint URLs and other app constants
class AppKeys {
  // Private constructor to prevent instantiation
  AppKeys._();

  static const Environment currentEnvironment = Environment.staging;

  static const String _baseDistStagingUrl =
      "https://kias.siainc.in/kias-staging-api/";
  static const String _baseDistProdUrl =
      "https://kias.siainc.in/kias-staging-api/";

  static const String distributorUrl = currentEnvironment == Environment.staging
      ? _baseDistStagingUrl
      : _baseDistProdUrl;

  static String apiUrl = distributorUrl; // default value

  static Future<void> init() async {
    try {
      final storedUrl =
      await locator<SecuredLocalRepository>().getString(AppConstants.apiUrl);
      apiUrl = storedUrl ?? distributorUrl;
    } catch (e) {
      logger.e("Error fetching stored API URL: $e");
      apiUrl = distributorUrl;
    }
  }
}

