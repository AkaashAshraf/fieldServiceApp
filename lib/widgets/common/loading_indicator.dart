import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator(
      {Key? key, this.height = 35, this.width = 35, this.color = primaryColor})
      : super(key: key);
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.lineSpinFadeLoader,

          /// Required, The loading type of the widget
          colors: [color],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          // Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
