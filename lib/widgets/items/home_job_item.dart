import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/models/simple/job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeJobItem extends StatelessWidget {
  HomeJobItem({super.key, required this.item});
  Job item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  item.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.7,
                    child: Text(
                      item.title,
                      maxLines: 1,
                      style: TextStyles.textBoldStyle45(context),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.7,
                    child: Text(
                      item.description,
                      maxLines: 1,
                      style: TextStyles.textStyle45(context,
                          color: textSecandaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 5),
      ],
    );
  }
}
