

import 'dart:ui';


import '../../../gen/colors.gen.dart';
import '../../repository/secured_local_repository.dart';
import '../../utils/constants/app_constants.dart';
import 'locator.dart';

enum AppThemeEnum { light, dark, custom }

class ThemeService {
  static const _key = AppConstants.userTheme;
  static const _keyColorPrimary = AppConstants.themePrimary;

  // Save the selected theme preference
  Future<void> setTheme(AppThemeEnum theme,{Color? primaryColor}) async {
    locator<SecuredLocalRepository>().saveInt(_key,theme.index);
    if(primaryColor!=null){
      locator<SecuredLocalRepository>().saveInt(_keyColorPrimary, primaryColor.value);
    }
  }


  Future<int> getSeedColor() async {
    return await locator<SecuredLocalRepository>().getInt(_keyColorPrimary) ?? ColorName.primaryColorDark.value;
  }


  // Load the selected theme preference
  Future<AppThemeEnum> loadTheme() async {
    int index = await locator<SecuredLocalRepository>().getInt(_key) ?? AppThemeEnum.light.index;
    return AppThemeEnum.values[index];
  }


}
