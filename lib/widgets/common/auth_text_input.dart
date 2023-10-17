import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatefulWidget {
  const AuthInputField(
      {Key? key,
      required this.onTextChange,
      this.validator = "",
      this.title = "",
      this.hint = "",
      this.keyBoardType = TextInputType.text,
      this.initialValue = "",
      this.isPassword = false})
      : super(key: key);

  final String title;
  final String hint;
  final String initialValue;

  final bool isPassword;
  final dynamic onTextChange;
  final String validator;
  final TextInputType keyBoardType;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool isObscure_ = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            // height: height * 0.1,
            width: width,
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
                  SizedBox(
                    width: width,
                    child: Text(
                      widget.title,
                      maxLines: 1,
                      style: const TextStyle(
                          color: authTextInputTitleColor,
                          fontFamily: "primary",
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      keyboardType: widget.keyBoardType,
                      maxLines: 1,
                      // controller: TextEditingController()
                      //   ..text = widget.initialValue,
                      obscureText: (widget.isPassword && isObscure_),
                      style: const TextStyle(
                          color: authTextInputTitleColor,
                          fontFamily: "primary"),
                      decoration: InputDecoration(
                          hintMaxLines: 1,
                          suffixIcon: widget.isPassword
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscure_ = !isObscure_;
                                    });
                                  },
                                  child: Icon(
                                    isObscure_
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                )
                              : const SizedBox(
                                  height: 1,
                                ),
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
