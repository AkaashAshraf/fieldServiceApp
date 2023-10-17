import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:flutter/material.dart';

class LightButton extends StatelessWidget {
  const LightButton(
      {Key? key,
      required this.title,
      required this.title2,
      required this.bGColor,
      this.isDropDown = false,
      required this.onTap,
      required this.title2Color})
      : super(key: key);
  final String title;
  final String title2;
  final Color bGColor;
  final bool isDropDown;
  final dynamic onTap;
  final Color title2Color;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight(context) * 0.06,
        decoration: BoxDecoration(
            color: bGColor,
            border: Border.all(
              color: bGColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "primary",
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth(context) * 0.0425),
                ),
                Row(
                  children: [
                    Text(
                      title2,
                      style: TextStyle(
                          color: title2Color,
                          fontFamily: "primary",
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth(context) * 0.0425),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (isDropDown)
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: textSecandaryColor,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
