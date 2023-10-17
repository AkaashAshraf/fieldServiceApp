import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class SearchFilterDropDown extends StatelessWidget {
  const SearchFilterDropDown({
    Key? key,
    required this.items,
    this.selectedText = "",
    required this.onChange,
    this.color = primaryColor,
  }) : super(key: key);
  final dynamic onChange;
  final Color color;
  final String selectedText;

  final List<DropDownItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: selectedText.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      selectedText,
                      style: const TextStyle(
                          fontFamily: "primary", color: Colors.white),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                      // size: 30.0,
                    ),
                  ],
                )
              : Container(),
        ),
        SizedBox(
          height: 20,
          width: 20,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              // dropdownWidth: screenWidth(context) * 0.4,
              customButton: Image(
                  fit: BoxFit.fitHeight,
                  color: color,
                  // opacity: AlwaysStoppedAnimation<double>(0.4),
                  image: const AssetImage('assets/Filter.png')),
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
                  .map((item) => DropdownMenuItem<DropDownItem>(
                        value: item,
                        child: Text(
                          item.label,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "primary"),
                        ),
                      ))
                  .toList(),
              onChanged: (DropDownItem? value) {
                onChange(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem {
  final String label;
  final int id;
  DropDownItem({required this.label, required this.id});
}
