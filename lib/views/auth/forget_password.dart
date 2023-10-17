import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/widgets/common/loading_indicator.dart';
import 'package:field_service_app/widgets/common/simple_button.dart';
import 'package:field_service_app/widgets/common/simple_text_input.dart';
import 'package:field_service_app/widgets/modals/otp_modal.dart';
import 'package:flutter/material.dart';

import "package:get/get.dart";

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String phone = "";
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
                      SimpleInputField(
                        title: "phone".tr,
                        initialValue: phone,
                        keyBoardType: TextInputType.number,
                        maxLength: 8,
                        hint: "enterYourPhone".tr,
                        onTextChange: (val) {
                          setState(() {
                            phone = val;
                          });

                          controller.emailResponseError("");
                        },
                        validator: isValidate && phone.length < 8
                            ? "invalid phone number"
                            : "",
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: width * 0.9,
                        height: height * 0.06,
                        child: controller.otpLoading.value
                            ? const MyLoadingIndicator()
                            : SimpleButton(
                                title: "submit".tr,
                                onPress: () async {
                                  setState(() {
                                    isValidate = true;
                                  });
                                  if (phone.length > 7) {
                                    var res = await controller
                                        .sendOtp(context, phone, codeSent: () {
                                      {
                                        otpModal(context).show();
                                      }
                                    });
                                    // if (res) {
                                    //   // ignore: use_build_context_synchronously
                                    //   otpModal(context).show();
                                    // }
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
