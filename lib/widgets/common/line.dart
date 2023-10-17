import 'package:dotted_line/dotted_line.dart';
import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({Key? key, this.direction = Axis.horizontal}) : super(key: key);

  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: DottedLine(
        dashColor: inActiveBottomIconColor,
        dashGapColor: inActiveBottomIconColor,
      ),
    );
  }
}
