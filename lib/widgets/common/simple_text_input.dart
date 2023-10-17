import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleInputField extends StatefulWidget {
  const SimpleInputField({
    Key? key,
    required this.onTextChange,
    this.title = "",
    this.body = "",
    this.maxLines = 1,
    this.minLines = 1,
    this.validator = "",
    this.initialValue = "",
    this.hint = "",
    this.suffix,
    this.maxLength,
    this.inputFormatters,
    this.readOnly = false,
    this.keyBoardType = TextInputType.text,
  }) : super(key: key);

  final String title;

  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  final String hint;
  final TextInputType keyBoardType;
  final bool readOnly;
  final Widget? suffix;
  final dynamic onTextChange;
  final String initialValue;
  final String body;

  final String validator;
  final dynamic inputFormatters;
  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  bool isObscure_ = true;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.initialValue;
    textEditingController.selection =
        TextSelection.collapsed(offset: textEditingController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            // height: height * 0.1,
            // width: widget.width,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.validator == "" ? primaryColor : Colors.red,
                  width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        style: TextStyle(
                            color: authTextInputTitleColor,
                            fontFamily: "primary",
                            fontSize: Get.locale.toString() == "en" ? 15 : 13),
                      ),
                      widget.suffix ?? Container()
                    ],
                  ),
                  SizedBox(
                    width: width,
                    child: widget.readOnly
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              widget.body,
                              style: const TextStyle(
                                  color: Colors.grey, fontFamily: "primary"),
                            ),
                          )
                        : TextField(
                            readOnly: widget.readOnly,
                            keyboardType: widget.keyBoardType,
                            minLines: widget.minLines,
                            maxLines: widget.maxLines,
                            maxLength: widget.maxLength,
                            inputFormatters: widget.inputFormatters ?? [],
                            controller: textEditingController,
                            style: const TextStyle(
                                color: authTextInputTitleColor,
                                fontFamily: "primary"),
                            decoration: InputDecoration(
                                hintMaxLines: 1,
                                // suffix: widget.suffix,
                                border: InputBorder.none,
                                hintText: widget.hint,
                                hintStyle: const TextStyle(
                                  color: authTextInputHintColor,
                                  fontFamily: "primary",
                                )),
                            onChanged: (value) => {widget.onTextChange(value)},
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: Text(
              widget.validator,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.red, fontFamily: "primary", fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
