import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../application/app_theme.dart';
import '../../../gen/colors.gen.dart';
import '../../data/services/locator.dart';
import '../../data/services/theme_service.dart';
import '../../repository/secured_local_repository.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeChanged>(_themeChangeEvent);
    on<InitialTheme>(_initialThemeEvent);
  }

  void _themeChangeEvent(ThemeChanged event, Emitter<ThemeState> emit) async{
    emit(ThemeInitial());
    emit(ThemeLoaded(event.theme));
  }

  void _initialThemeEvent(InitialTheme event, Emitter<ThemeState> emit) async{
    emit(ThemeInitial());
    var theme = await ThemeService().loadTheme();
    late ThemeData themeData;
    switch (theme) {
      case AppThemeEnum.light:
        themeData = AppTheme.goalLightTheme;
        break;
      case AppThemeEnum.dark:
        themeData = AppTheme.goalDarkTheme;
        break;
      case AppThemeEnum.custom:
        int seedColor = await ThemeService().getSeedColor();
        themeData = ThemeData(
            colorScheme: ColorScheme.light(
              // seedColor: Color(seedColor),
                primary: Color(seedColor),
                secondary: const Color(0xFF50606F),
            ),
        );
        break;
      default :
        themeData = AppTheme.goalLightTheme;
    }
    emit(ThemeLoaded(themeData));
  }
}
