import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../../../firebase_options.dart';
import '../../repository/common_repository.dart';
import '../../utils/common_utils.dart';
import '../../utils/constants/app_keys.dart';
import '../../utils/notification_helper/notification_adapter.dart';
import 'common_api_service.dart';
import 'locator.dart';
import 'navigation_service.dart';
import 'notification_storage.dart';

/// Add it to getIt if we want to use it in multiple places
class PushNotificationService {
  PushNotificationService._();

  static int _count = 0;
  //  static const String _key = 'notifications';

  // static BuildContext get context => null;

  static void initialize(BuildContext context) async {
    // Handle foreground message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kIsWeb) {
        // _showWebNotification(message);
        NotificationAdapter.getNotification()
            .showNotification(message: message, count: _count);
      } else if (Platform.isIOS) {
        message = _modifyNotificationJson(message);
      } else {
        // _showNotification(message);
        NotificationAdapter.getNotification()
            .showNotification(message: message, count: _count);
      }

      NotificationStorage.saveNotification({
        'id': message.messageId,
        'title': message.notification?.title ??
            message.data['pinpoint.notification.title'],
        'body': message.notification?.body ??
            message.data['pinpoint.notification.body'],
        'data': message.data,
        'status': 'unread',
        'receivedAt': DateTime.now().toIso8601String(),
      }).then((_) {
        if (message.messageId != null) {
          String notificationId =
          message.messageId!;
          NotificationStorage.markAsRead(notificationId);
        }
      });
    });

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(
            (message) => _firebaseMessagingBackgroundHandler(message, context));

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((message) => _handleMessage(message, context));
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleMessage(message, context));
    // initLocalNotifications();
    // _initializeLocalNotification(context);
    initAwesomeNotifications(context);
  }

  static void initAwesomeNotifications(BuildContext context) {
    AwesomeNotifications().initialize(
      // Assets.images.kiaLogo,
      null,
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'High Importance Notifications',
          channelDescription: 'Notification channel for important messages',
          importance: NotificationImportance.Max,
          playSound: true,
          channelShowBadge: true,
          onlyAlertOnce: true,
          criticalAlerts: true,
        )
      ],
      // debug: true
    );

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) =>
          onActionReceivedHandler(receivedAction, context),
      onNotificationCreatedMethod:
          (ReceivedNotification receivedNotification) async {
        print("Notification created: ${receivedNotification.id}");
      },
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) async {
        print("Notification displayed: ${receivedNotification.id}");
      },
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {
        print("Notification dismissed: ${receivedAction.id}");
      },
    );
  }

  static Future<void> onActionReceivedHandler(
      ReceivedAction receivedAction, BuildContext context) async {
    try { if (receivedAction.payload != null) {
      print("Notification payload: ${receivedAction.payload}");

      if (receivedAction.payload!.containsKey('pinpoint.jsonBody')) {
        Map<String, dynamic> jsonDataUrl =
        jsonDecode(receivedAction.payload!['pinpoint.jsonBody']!);


        String? url = jsonDataUrl['url'];
        String? target = jsonDataUrl['target'];
        String? targetId = jsonDataUrl['target_id'];


        if (url != null && target != null && targetId != null) {
          print("Navigating to URL: $url");
          print("Navigating to target: $target");
          print("Navigating to targetId: $targetId");
          NotificationAdapter.getNotification().handleRedirection(
            context: context,
            payload: url,
            target: target,
            targetId: targetId,
          );
        } else {
          print("One or more required fields are null: url: $url, target: $target, targetId: $targetId");
        }
      }
    }} catch (e) {
      print("Error while handling notification action: $e");
    }
  }

  static Future<bool> requestPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> getToken() async {
    // use the registration token to send messages to users from your trusted server environment
    String? token;

    if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
      token = await FirebaseMessaging.instance.getToken(
        // vapidKey: AppKeys.vapidKey,
      );
    } else {
      token = await FirebaseMessaging.instance.getToken();
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((String token) async {
      logger.i('Refresh Token=$token');
      // await sendToken(token);
    });

    if (kDebugMode) {
      logger.i('Registration Token=$token');
    }

    // await sendToken(token);
  }

  // static Future<void> sendToken(String? token) async {
  //   await CommonRepositoryImpl(apiService: CommonApiService(locator<Dio>()))
  //       .updateUserNotificationToken(body: {
  //     "device_token": token,
  //   });
  // }

  /// This method will modify the message format of iOS Notification Data
  static RemoteMessage _modifyNotificationJson(RemoteMessage message) {
    message.data['data'] = Map.from(message.data);
    message.data['notification'] = message.data['aps']['alert'];
    return message;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message, BuildContext context) async {
    _handleMessage(message, context);
  }

  static void _handleMessage(RemoteMessage? message, BuildContext context) {
    if (message == null) return;

    logger.i(
        "Title: ${message.notification?.title ?? message.data['pinpoint.notification.title']}");
    logger.i(
        "Body: ${message.notification?.body ?? message.data['pinpoint.notification.body']}");
    logger.i("Payload: ${message.data}");

    // For Web
    if (kIsWeb) {
      NotificationAdapter.getNotification().showNotification(
        message: message,
        count: _count,
      );
    } else if (Platform.isIOS) {
      message = _modifyNotificationJson(message);
    } else {
      // _showNotification(message);
      NotificationAdapter.getNotification()
          .showNotification(message: message, count: _count);
    }


    if (message.data["url"] != null) {
      NavigationService.kiaPushNamed(context, message.data["url"]);
    }


    NotificationStorage.saveNotification({
      'id': message.messageId,
      'title': message.notification?.title ??
          message.data['pinpoint.notification.title'],
      'body': message.notification?.body ??
          message.data['pinpoint.notification.body'],
      'data': message.data,
      'status': 'unread',
      'receivedAt': DateTime.now().toIso8601String(),
    });
    // .then((_) {
    //   // Mark the notification as read after saving it
    //   if (message.messageId != null) {
    //     String notificationId = message.messageId!;
    //     NotificationStorage.markAsRead(notificationId);
    //   }
    // });
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(
//     RemoteMessage message, BuildContext context) async {
//   _handleMessage(message, context);
// }

// void _handleMessage(RemoteMessage? message, BuildContext context) {

//   if (message == null) return;

//   logger.i("Title: ${message.data['pinpoint.notification.title']}");
//   logger.i("Body: ${message.data['pinpoint.notification.body']}");
//   logger.i("Payload: ${message.data}");
//   if (message.data["route"] != null) {
//     NavigationService.kiaPushNamed(context, message.data["route"]);
//   }
// }
