/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
