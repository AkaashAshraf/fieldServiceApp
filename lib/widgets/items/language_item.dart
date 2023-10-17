import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/models/simple/profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageItem extends StatelessWidget {
  Profile item;
  dynamic onClick;
  int? isSelected;
  LanguageItem({super.key, required this.item, this.onClick, this.isSelected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.075,
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            decoration:
                const BoxDecoration(color: profileItemImageBackgroundColor),
            child: ClipRRect(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(isSelected.toString()),
                        SizedBox(
                          width: width * 0.47,
                          child: Text(
                            item.title_1.toString(),
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04
                                // fontSize: width * 0.04
                                ),
                          ),
                        ),
                        SizedBox(
                          // height: width * 0.13,
                          width: width * 0.26,
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (item.title_2 != null)
                                  SizedBox(
                                      width: width * 0.18,
                                      child: Text(
                                        item.title_2.toString(),
                                        textAlign: TextAlign.end,
                                        style:
                                            const TextStyle(color: Colors.red),
                                        maxLines: 1,
                                      )),
                                Column(
                                  children: [
                                    // if (isSelected == 1)
                                    Icon(
                                      Icons.check_circle,
                                      color: isSelected == 1
                                          ? primaryColor
                                          : Colors.transparent,
                                      size: MediaQuery.of(context).size.width *
                                          0.08,
                                    ),
                                  ],
                                ),
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
