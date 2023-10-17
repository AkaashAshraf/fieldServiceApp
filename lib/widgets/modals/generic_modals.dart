import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert modal(
  BuildContext context,
  Column content, {
  bool isCancelButton = true,
  bool overlayDismiss = true,
}) {
  return Alert(
      style: AlertStyle(
          isOverlayTapDismiss: overlayDismiss,
          isCloseButton: isCancelButton,
          alertPadding: const EdgeInsets.all(8),
          overlayColor: Colors.black54),
      context: context,
      content: content,
      buttons: []);
}
