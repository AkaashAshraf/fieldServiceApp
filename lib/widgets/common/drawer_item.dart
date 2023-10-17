import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    this.color,
    required this.onClick,
    this.title = "",
  }) : super(key: key);
  final String icon;
  final String title;
  final Color? color;

  final dynamic onClick;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ListTile(
      leading: Container(
          height: height * 0.05,
          width: height * 0.05,
          decoration: const BoxDecoration(
            color: imageLightBgColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icon,
              color: color,
              fit: BoxFit.contain,
            ),
          )),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "primary",
            fontSize: getTextSize(context).drawerText,
            fontWeight: FontWeight.w600),
      ),
      onTap: () {
        onClick();
      },
    );
  }
}
