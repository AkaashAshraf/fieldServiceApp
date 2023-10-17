import 'package:field_service_app/config/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar transparent(
      {required String title, bool showNotificatoin = true}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyles.textBoldStyle1(),
      ),
      actions: [
        if (showNotificatoin)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(CupertinoIcons.bell),
          )
      ],
    );
  }

  static AppBar white({required String title, bool showNotificatoin = true}) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyles.textBoldStyle1(),
      ),
      actions: [
        if (showNotificatoin)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(CupertinoIcons.bell),
          )
      ],
    );
  }
}
