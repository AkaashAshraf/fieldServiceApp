import 'package:field_service_app/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

MotionToast myToastMessage(
    {required BuildContext context,
    String title = "",
    String type = "success",
    required String descripetion}) {
  switch (type) {
    case "success":
      return MotionToast.success(
        displaySideBar: false,
        enableAnimation: false,
        toastDuration: const Duration(milliseconds: 1800),
        width: screenWidth(context) * 0.9,
        height: screenWidth(context) * 0.2,
        position: MotionToastPosition.top,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary", fontWeight: FontWeight.bold),
        ),
        description: Text(
          descripetion,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
      );
    case "warning":
      return MotionToast.warning(
        displaySideBar: false,
        enableAnimation: false,
        width: screenWidth(context) * 0.9,
        height: screenWidth(context) * 0.2,
        position: MotionToastPosition.top,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary", fontWeight: FontWeight.bold),
        ),
        description: Text(
          descripetion,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
      );

    case "delete":
      return MotionToast.delete(
        displaySideBar: false,
        enableAnimation: false,
        width: screenWidth(context) * 0.9,
        height: screenWidth(context) * 0.2,
        position: MotionToastPosition.top,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary", fontWeight: FontWeight.bold),
        ),
        description: Text(
          descripetion,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
      );

    case "info":
      return MotionToast.info(
        displaySideBar: false,
        enableAnimation: false,
        width: screenWidth(context) * 0.9,
        height: screenWidth(context) * 0.2,
        position: MotionToastPosition.top,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary", fontWeight: FontWeight.bold),
        ),
        description: Text(
          descripetion,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
      );
    case "error":
      return MotionToast.error(
        displaySideBar: false,
        enableAnimation: false,
        width: screenWidth(context) * 0.9,
        height: screenWidth(context) * 0.2,
        position: MotionToastPosition.top,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary", fontWeight: FontWeight.bold),
        ),
        description: Text(
          descripetion,
          style: const TextStyle(
            fontFamily: "primary",
          ),
        ),
      );
  }
  return MotionToast.success(
    displaySideBar: false,
    enableAnimation: false,
    width: screenWidth(context) * 0.9,
    height: screenWidth(context) * 0.2,
    position: MotionToastPosition.top,
    title: Text(
      title,
      style:
          const TextStyle(fontFamily: "primary", fontWeight: FontWeight.bold),
    ),
    description: Text(
      descripetion,
      style: const TextStyle(
        fontFamily: "primary",
      ),
    ),
  );
}
