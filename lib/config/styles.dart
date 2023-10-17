import 'package:field_service_app/config/text_sizes.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle textBoldStyle1() =>
      const TextStyle(fontFamily: "primary", fontWeight: FontWeight.w700);
  static TextStyle textBoldStyle45(BuildContext context,
          {Color color = Colors.black}) =>
      TextStyle(
          fontFamily: "primary",
          color: color,
          fontSize: screenWidth(context) * 0.045,
          fontWeight: FontWeight.w700);
  static TextStyle textBoldStyle4(BuildContext context,
          {Color color = Colors.black}) =>
      TextStyle(
          fontFamily: "primary",
          color: color,
          fontSize: screenWidth(context) * 0.04,
          fontWeight: FontWeight.w700);
  static TextStyle textBoldStyle50(BuildContext context,
          {Color color = Colors.black}) =>
      TextStyle(
          fontFamily: "primary",
          color: color,
          fontSize: screenWidth(context) * 0.05,
          fontWeight: FontWeight.w700);

  static TextStyle textStyle40(BuildContext context,
          {Color color = Colors.black}) =>
      TextStyle(
          fontFamily: "primary",
          fontSize: screenWidth(context) * 0.04,
          fontWeight: FontWeight.w400,
          color: color);
  static TextStyle textStyle45(
    BuildContext context, {
    Color color = Colors.black,
  }) =>
      TextStyle(
          fontFamily: "primary",
          fontSize: screenWidth(context) * 0.045,
          fontWeight: FontWeight.w400,
          color: color);
  static TextStyle bottomTabTextStyle() =>
      const TextStyle(fontFamily: "primary", fontSize: 13);
}
