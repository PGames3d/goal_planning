
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

  static const String _baseStagingUrl =
      "https://api.mfapi.in/mf";
  static const String _baseProdUrl =
      "https://api.mfapi.in/mf";

  static const String _baseStockStagingUrl =
      "https://stock.indianapi.in";
  static const String _baseStockProdUrl =
      "https://stock.indianapi.in";

  static const String apiMutualUrl = currentEnvironment == Environment.staging
      ? _baseStagingUrl
      : _baseProdUrl;
  static const String apiStockUrl = currentEnvironment == Environment.staging
      ? _baseStockStagingUrl
      : _baseStockProdUrl;


}

