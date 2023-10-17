// To parse this JSON data, do
//
//     final error422 = error422FromJson(jsonString);

import 'dart:convert';

Error422 error422FromJson(String str) => Error422.fromJson(json.decode(str));

class Error422 {
  Error422({
    this.message,
    this.errors,
  });

  String? message;
  Errors? errors;

  factory Error422.fromJson(Map<String, dynamic> json) => Error422(
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );
}

class Errors {
  Errors({
    this.email,
    this.password,
    this.nameEn,
    this.nameAr,
    this.contact,
    this.crNo,
    this.bussinessTypeId,
    this.address,
  });

  List<String>? email;
  List<String>? password;
  List<String>? nameEn;
  List<String>? nameAr;
  List<String>? contact;
  List<String>? crNo;
  List<String>? bussinessTypeId;
  List<String>? address;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<String>.from(json["password"]!.map((x) => x)),
        nameEn: json["name_en"] == null
            ? []
            : List<String>.from(json["name_en"]!.map((x) => x)),
        nameAr: json["name_ar"] == null
            ? []
            : List<String>.from(json["name_ar"]!.map((x) => x)),
        contact: json["contact"] == null
            ? []
            : List<String>.from(json["contact"]!.map((x) => x)),
        crNo: json["cr_no"] == null
            ? []
            : List<String>.from(json["cr_no"]!.map((x) => x)),
        bussinessTypeId: json["bussiness_type_id"] == null
            ? []
            : List<String>.from(json["bussiness_type_id"]!.map((x) => x)),
        address: json["address"] == null
            ? []
            : List<String>.from(json["address"]!.map((x) => x)),
      );
}
