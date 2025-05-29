import 'package:flutter/foundation.dart';
import 'package:kias/core/data/services/locator.dart';

void printLog(String message) {
  if (kDebugMode) {
    logger.e(message);
  }
}
