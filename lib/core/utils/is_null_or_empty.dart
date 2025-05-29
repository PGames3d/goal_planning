import 'package:flutter/material.dart';

extension OptStringX on String? {
  bool get isNullOrEmpty {
    final String? string = this;

    if (string != null) {
      bool hasSpace = RegExp(r'\s').hasMatch(string);
      bool hasAnythingButSpace = RegExp(r'[^ ]').hasMatch(string);
      return string.isEmpty || (hasSpace && !hasAnythingButSpace);
    }

    return this == null;
  }

  String get emptyIfNullString {
    final String? string = this;

    if (string != null) {
      return string != 'null' ? string : '';
    }

    return '';
  }

  String get addPlaceHolderIfNullString {
    final String? string = this;

    if (string != null) {
      return (string != 'null' && string.isNotEmpty) ? string : '-';
    }

    return '-';
  }

  String get orEmpty {
    return this ?? '';
  }

  String toCapitalized() => (this != null && this!.isNotEmpty)
      ? '${this![0].toUpperCase()}${this!.substring(1)}'
      : '';
  String toTitleCase() => this != null
      ? this!
          .replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.toCapitalized())
          .join(' ')
      : '';

  String get getApiErrorString {
    String error = "";
    if ((this ?? '').contains(",")) {
      error = "\u2022 ${(this ?? '').split(",").join("\n\u2022 ")}";
    } else {
      error = this ?? '';
    }
    return error;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  DateTime applyTimeOfDay({required int hour, required int minute}) {
    return DateTime(year, month, day, hour, minute);
  }

  DateTime applyNewDay({required int day}) {
    return DateTime(year, month, day);
  }
}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  void get dismissKeyBoard {
    FocusNode currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
