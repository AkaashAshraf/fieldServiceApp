import 'dart:convert';

CheckVersion checkVersionFromJson(String str) =>
    CheckVersion.fromJson(json.decode(str));

String checkVersionToJson(CheckVersion data) => json.encode(data.toJson());

class CheckVersion {
  CheckVersion({
    required this.android,
    required this.ios,
    required this.androidVersion,
    required this.iosVersion,
  });

  bool android;
  bool ios;
  int androidVersion;
  int iosVersion;

  factory CheckVersion.fromJson(Map<String, dynamic> json) => CheckVersion(
        android: json["android"] ?? false,
        ios: json["ios"] ?? false,
        androidVersion: json["android_version"] ?? 1,
        iosVersion: json["ios_version"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "android": android,
        "ios": ios,
        "android_version": androidVersion,
        "ios_version": iosVersion,
      };
}
