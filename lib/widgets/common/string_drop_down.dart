import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class SimpleDropDown extends StatelessWidget {
  const SimpleDropDown({
    Key? key,
    required this.items,
    required this.selected,
    required this.onChange,
  }) : super(key: key);
  final dynamic onChange;
  final dynamic selected;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
                width: 0.3,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                alignment: AlignmentDirectional.centerEnd,
                hint: Text(
                  '',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "primary",
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "primary"),
                          ),
                        ))
                    .toList(),
                value: selected,
                onChanged: (value) {
                  onChange(value);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
