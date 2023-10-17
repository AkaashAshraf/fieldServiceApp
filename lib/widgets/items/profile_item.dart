import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/widgets/common/line.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  ProfileListItem({
    super.key,
    required this.icon,
    this.isLine = true,
    required this.title,
  });
  String title;
  Icon icon;
  bool isLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.titleHeight,
          horizontalTitleGap: 30,
          title: Text(
            title,
            style: TextStyles.textStyle45(context),
          ),
          leading: icon,
        ),
        if (isLine) const Line(),
      ],
    );
  }
}
