
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'choose_notification_platform.dart'
if (dart.library.io) 'notification_mobile.dart'
if (dart.library.html) 'notification_web.dart';

class NotificationAdapter {
  NotificationAdapter();

  factory NotificationAdapter.getNotification() => showNotificationConfig();

  void showNotification(
      {
        required RemoteMessage message,
        required int count
      }) async =>
      throw UnimplementedError();

  void handleRedirection(
      {
        required BuildContext context,
        required String payload,
        required String target,
        required String targetId
      }) async =>
      throw UnimplementedError();
}
