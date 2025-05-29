
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';

import '../../data/services/navigation_service.dart';
import 'notification_adapter.dart';

class NotificationMobile implements NotificationAdapter {
  @override
  void showNotification({required RemoteMessage message,required int count}) async {
    String title = message.data['pinpoint.notification.title']?? message.notification?.title ?? 'Notification';
    String body = message.data['pinpoint.notification.body'] ?? message.notification?.body ?? 'You have a new message';
    Map<String, dynamic> payloadData = message.data;

    // if (message.data.containsKey('pinpoint.jsonBody')) {
    //   Map<String, dynamic> jsonDataUrl = jsonDecode(message.data['pinpoint.jsonBody']);
    //   payloadData['jsonDataUrl'] = jsonDataUrl;

    // }


    // Handle Android/iOS notification using Awesome Notifications
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: ++count,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        payload: payloadData.map((key, value) => MapEntry(key, value.toString())),
      ),
    );
    print('Mobile Notification Title: $title');
    print('Mobile Notification Body: $body');
  }

  @override
  void handleRedirection({ required BuildContext context, required String payload, required String target, required String targetId}) {
  print('Mobile Notification redirct: $target');
    print('Mobile Notification redirct: $targetId');

//
  }

}

NotificationAdapter showNotificationConfig() => NotificationMobile();
