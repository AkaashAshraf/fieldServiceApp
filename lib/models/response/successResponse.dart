// To parse this JSON data, do
//
//     final successResponse = successResponseFromJson(jsonString);

import 'dart:convert';

SuccessResponse successResponseFromJson(String str) =>
    SuccessResponse.fromJson(json.decode(str));

class SuccessResponse {
  SuccessResponse({
    this.status = "",
    this.messageEn = "",
    this.id = 0,
    this.messageAr = "",
  });

  String status;
  String messageEn;
  String messageAr;
  int id;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        status: json["status"] ?? "",
        id: json["id"] ?? 0,
        messageEn: json["message_en"] ?? "",
        messageAr: json["message_ar"] ?? "",
      );
}
