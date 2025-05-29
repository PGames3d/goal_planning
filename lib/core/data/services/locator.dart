import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:kias/core/data/services/theme_service.dart';
import 'package:logger/logger.dart';
import '../../repository/secured_local_repository.dart';
import '../../utils/api_helpers/api_initializer.dart';
import '../../utils/app_info.dart';

final GetIt locator = GetIt.instance;

Logger logger = Logger(
  filter: null,
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);

Future<void> setupLocator(FlutterSecureStorage sharedPreferences) async {
  locator.registerLazySingleton<Dio>(() => ApiInitializer.createDio());
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
  locator.registerLazySingleton<SecuredLocalRepository>(
      () => SecuredLocalRepository(sharedPreferences));
  ///get device info singleton
  final appInfo = AppInfo();
  await appInfo.load();
  locator.registerLazySingleton<AppInfo>(()=>appInfo);
}
