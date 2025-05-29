
import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData goalLightTheme = ThemeData(
      scaffoldBackgroundColor: ColorName.whiteColor,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
      dialogBackgroundColor: Colors.white,
      cardColor: ColorName.whiteColor,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor:  ColorName.whiteColor
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.primary)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: lightColorScheme.primary, width: 2)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.error, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.error, width: 2)),
          outlineBorder: BorderSide(color: lightColorScheme.primary)),
      useMaterial3: true,
      fontFamily: FontFamily.gilroy);

  static final ThemeData goalDarkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
      dialogBackgroundColor: Colors.black45,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.black45,
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: const OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorScheme.primary)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorScheme.primary, width: 2)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorScheme.error, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorScheme.error, width: 2)),
          outlineBorder: BorderSide(color: darkColorScheme.primary)),
      useMaterial3: true,
      fontFamily: FontFamily.gilroy);

  static final ThemeData goalYellowTheme = ThemeData(
      scaffoldBackgroundColor: ColorName.whiteColor,
      brightness: Brightness.light,
      colorScheme: lightYellowScheme,
      dialogBackgroundColor: Colors.white,
      cardColor: ColorName.whiteColor,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor:  ColorName.whiteColor
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.primary)),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: lightColorScheme.primary, width: 2)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.error, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColorScheme.error, width: 2)),
          outlineBorder: BorderSide(color: lightColorScheme.primary)),
      useMaterial3: true,
      fontFamily: FontFamily.gilroy);



}

/// Generated these colors using official material3 custom theme builder website
/// https://m3.material.io/theme-builder#/custom
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFAF52DE),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCBE6FF),
  onPrimaryContainer: Color(0xFF001E30),
  secondary: Color(0xFF50606F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD3E4F6),
  onSecondaryContainer: Color(0xFF0C1D29),
  tertiary: Color(0xFF65587B),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFEBDCFF),
  onTertiaryContainer: Color(0xFF211634),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFCFCFF),
  onSurface: Color(0xFF1A1C1E),
  surfaceContainerHighest: Color(0xFFDDE3EA),
  onSurfaceVariant: Color(0xFF41474D),
  outline: Color(0xFF72787E),
  onInverseSurface: Color(0xFFF0F0F3),
  inverseSurface: Color(0xFF2E3133),
  inversePrimary: Color(0xFF8ECDFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006494),
  outlineVariant: Color(0xFFC1C7CE),
  scrim: Color(0xFF000000),
);

const lightYellowScheme = ColorScheme(
brightness: Brightness.light,
primary: Color(0xff6e5d00),
surfaceTint: Color(0xff6e5d00),
onPrimary: Color(0xffffffff),
primaryContainer: Color(0xffffe368),
onPrimaryContainer: Color(0xff554800),
secondary: Color(0xff6b5e24),
onSecondary: Color(0xffffffff),
secondaryContainer: Color(0xfff6e39c),
onSecondaryContainer: Color(0xff544810),
tertiary: Color(0xff4d6700),
onTertiary: Color(0xffffffff),
tertiaryContainer: Color(0xffcbf26f),
onTertiaryContainer: Color(0xff3b5000),
error: Color(0xffba1a1a),
onError: Color(0xffffffff),
errorContainer: Color(0xffffdad6),
onErrorContainer: Color(0xff410002),
surface: Color(0xfffff9ee),
onSurface: Color(0xff1e1b11),
onSurfaceVariant: Color(0xff4c4733),
outline: Color(0xff7d7761),
outlineVariant: Color(0xffcfc6ad),
shadow: Color(0xff000000),
scrim: Color(0xff000000),
inverseSurface: Color(0xff343025),
inversePrimary: Color(0xffe5c524),
primaryFixed: Color(0xffffe25e),
onPrimaryFixed: Color(0xff221b00),
primaryFixedDim: Color(0xffe5c524),
onPrimaryFixedVariant: Color(0xff534600),
secondaryFixed: Color(0xfff5e29b),
onSecondaryFixed: Color(0xff221b00),
secondaryFixedDim: Color(0xffd8c682),
onSecondaryFixedVariant: Color(0xff52460e),
tertiaryFixed: Color(0xffc9f16e),
onTertiaryFixed: Color(0xff151f00),
tertiaryFixedDim: Color(0xffaed455),
onTertiaryFixedVariant: Color(0xff394d00),
surfaceDim: Color(0xffe0d9c9),
surfaceBright: Color(0xfffff9ee),
surfaceContainerLowest: Color(0xffffffff),
surfaceContainerLow: Color(0xfffbf3e2),
surfaceContainer: Color(0xfff5eddd),
surfaceContainerHigh: Color(0xffefe8d7),
surfaceContainerHighest: Color(0xffe9e2d1),
);


const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFAF52DE),
  onPrimary: Color(0xFF00344F),
  primaryContainer: Color(0xFF004B71),
  onPrimaryContainer: Color(0xFFCBE6FF),
  secondary: Color(0xFFB8C8D9),
  onSecondary: Color(0xFF22323F),
  secondaryContainer: Color(0xFF394956),
  onSecondaryContainer: Color(0xFFD3E4F6),
  tertiary: Color(0xFFD0C0E8),
  onTertiary: Color(0xFF362B4A),
  tertiaryContainer: Color(0xFF4D4162),
  onTertiaryContainer: Color(0xFFEBDCFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF1A1C1E),
  onSurface: Color(0xFFE2E2E5),
  surfaceContainerHighest: Color(0xFF41474D),
  onSurfaceVariant: Color(0xFFC1C7CE),
  outline: Color(0xFF8B9198),
  onInverseSurface: Color(0xFF1A1C1E),
  inverseSurface: Color(0xFFE2E2E5),
  inversePrimary: Color(0xFF006494),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF8ECDFF),
  outlineVariant: Color(0xFF41474D),
  scrim: Color(0xFF000000),
);

