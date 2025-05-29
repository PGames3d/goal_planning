// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';

import '../../../application/app_router.dart';
import '../../data/services/navigation_service.dart';
import 'notification_adapter.dart';

class NotificationWeb implements NotificationAdapter {
  @override
  void showNotification({required RemoteMessage message,required int count}) async {
    String title = message.data['pinpoint.notification.title']?? message.notification?.title ?? 'Notification';
    String body = message.data['pinpoint.notification.body'] ?? message.notification?.body ?? 'You have a new message';

    // if (message.data.containsKey('pinpoint.jsonBody')) {
    //     Map<String, dynamic> jsonDataUrl = jsonDecode(message.data['pinpoint.jsonBody']);
    //     if (jsonDataUrl.containsKey('url')) {
    //       _handleUrlRedirection(jsonDataUrl['url']);
    //     }
    //   }

    // Handle Web notification
    html.Notification(title, body: body);
    print('Web Notification Title: $title');
    print('Web Notification Body: $body');
  }

  @override
  void handleRedirection({ required BuildContext context, required String payload, required String target, required String targetId}) {
      // html.window.open(payload, "_blank");

  }

}

NotificationAdapter showNotificationConfig() => NotificationWeb();
