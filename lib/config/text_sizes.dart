import 'package:flutter/material.dart';

class TextSizes {
  double navTitle;
  double searchBoxText;

  double dashboardItem;
  double itemMainText;
  double itemSubText;
  double authTitleText;
  double drawerText;

  double smallItemMainText;
  double smallItemSubText;

  double twoColumnGridMainText;
  double twoColumnGridSubText;

  TextSizes(
      {required this.dashboardItem,
      required this.drawerText,
      required this.searchBoxText,
      required this.itemMainText,
      required this.authTitleText,
      required this.itemSubText,
      required this.navTitle,
      required this.smallItemMainText,
      required this.smallItemSubText,
      required this.twoColumnGridMainText,
      required this.twoColumnGridSubText});
}

TextSizes getTextSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final sizes = TextSizes(
    dashboardItem: width * 0.045,
    drawerText: width * 0.045,
    searchBoxText: width * 0.04,
    authTitleText: width * 0.055,
    itemMainText: width * 0.045,
    itemSubText: width * 0.038,
    navTitle: width * 0.055,
    smallItemMainText: width * 0.045,
    smallItemSubText: width * 0.032,
    twoColumnGridMainText: width * 0.035,
    twoColumnGridSubText: width * 0.03,
  );
  return sizes;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
