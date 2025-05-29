/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kias/core/data/services/locator.dart';
import 'package:kias/core/repository/secured_local_repository.dart';

import '../../utils/constants/app_constants.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final languageCode = await locator<SecuredLocalRepository>().getString(AppConstants.languageCode) ?? 'en';
    emit(Locale(languageCode));
  }

  Future<void> changeLocale(String languageCode) async {
    await locator<SecuredLocalRepository>().saveString(AppConstants.languageCode,languageCode);
    emit(Locale(languageCode));
  }
}
