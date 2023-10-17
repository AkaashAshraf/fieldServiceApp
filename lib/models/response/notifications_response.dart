// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

import 'package:field_service_app/models/simple/notification.dart';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

class Notifications {
  int totalNotifications;
  List<Notificationn> data;

  Notifications({
    this.totalNotifications = 0,
    required this.data,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        totalNotifications: json["total_notifications"] ?? 0,
        data: List<Notificationn>.from(
            json["data"].map((x) => Notificationn.fromJson(x))),
      );
}
