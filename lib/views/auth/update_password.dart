import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/widgets/common/auth_text_input.dart';
import 'package:field_service_app/widgets/common/loading_indicator.dart';
import 'package:field_service_app/widgets/common/simple_button.dart';
import 'package:flutter/material.dart';

import "package:get/get.dart";

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String password = "";
  String confirmPassword = "";
  bool logoutAll = false;
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GetX<AuthController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: height * 0.1,
                      width: width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      AuthInputField(
                        title: "Enter New Password".tr,
                        isPassword: true,
                        initialValue: password,
                        // keyBoardType: TextInputType.number,
                        hint: "enterYourPassword".tr,
                        onTextChange: (val) {
                          setState(() {
                            password = val;
                          });

                          controller.emailResponseError("");
                        },
                        validator: isValidate && password.length < 8
                            ? "password should be greater than 7 digits"
                            : "",
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthInputField(
                        title: "Confirm Password".tr,
                        isPassword: true,
                        initialValue: confirmPassword,
                        // keyBoardType: TextInputType.number,
                        hint: "enterYourPassword".tr,
                        onTextChange: (val) {
                          setState(() {
                            confirmPassword = val;
                          });

                          controller.emailResponseError("");
                        },
                        validator: isValidate && confirmPassword.length < 8
                            ? "password should be greater than 7 digits"
                            : isValidate && confirmPassword != password
                                ? "password mismatch"
                                : "",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(primaryColor),
                            value: logoutAll,
                            onChanged: (bool? value) {
                              setState(() {
                                logoutAll = value!;
                              });
                            },
                          ),
                          Text(
                            "logoutOtherDevices".tr,
                            style: const TextStyle(
                                fontFamily: "primary",
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: width * 0.9,
                        height: height * 0.06,
                        child: controller.loading.value
                            ? const MyLoadingIndicator()
                            : SimpleButton(
                                title: "submit".tr,
                                onPress: () async {
                                  setState(() {
                                    isValidate = true;
                                  });
                                  if (password.length > 7 &&
                                      password == confirmPassword) {
                                    await controller.updatePassword(
                                        logoutOthers: logoutAll,
                                        password: password,
                                        context: context);
                                    // controller.sendOtp(context, phone);
                                    // otpModal(context).show();
                                  }
                                },
                              ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
