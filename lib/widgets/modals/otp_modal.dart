import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/controllers/otp_controller.dart';
import 'package:field_service_app/views/auth/update_password.dart';
import 'package:field_service_app/widgets/common/loading_indicator.dart';
import 'package:field_service_app/widgets/common/simple_button.dart';
import 'package:field_service_app/widgets/common/toast_message.dart';
import 'package:field_service_app/widgets/modals/generic_modals.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

Alert otpModal(BuildContext context) {
  String code = "";

  return modal(
      context,
      Column(
        children: [
          GetX<AuthController>(builder: (controller) {
            return Column(children: [
              Text(
                'Enter OTP To Verify'.tr,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              PinFieldAutoFill(
                codeLength: 6,
                decoration: UnderlineDecoration(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder:
                      FixedColorBuilder(Colors.black.withOpacity(0.3)),
                ),
                currentCode: code,
                onCodeSubmitted: (code) {
                  // controller.checkval(context);
                },
                onCodeChanged: (value) {
                  if (value!.length == 6) {
                    code = value;
                    controller.otp.value = value;
                    // FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              controller.otpLoading.value == false
                  ? Column(
                      children: [
                        SizedBox(
                          width: screenWidth(context) * 0.9,
                          height: screenHeight(context) * 0.06,
                          child: SimpleButton(
                              title: 'verify'.tr,
                              textSize: screenWidth(context) * 0.038,
                              onPress: () async {
                                // print(controller.otp.value);
                                if (controller.otp.value.length < 6) {
                                  return;
                                }
                                controller.otpLoading(true);
                                await Get.find<OtpController>().verifyOtp(
                                    otp: controller.otp.value,
                                    failed: (String msg) {
                                      controller.otpLoading(false);

                                      myToastMessage(
                                              context: context,
                                              type: "error",
                                              descripetion: "invalidOtp".tr)
                                          .show(context);
                                    },
                                    success: () {
                                      controller.otpLoading(false);

                                      Get.to(const UpdatePassword());
                                    });
                              }),
                        ),
                      ],
                    )
                  : const Center(
                      child: MyLoadingIndicator(
                      height: 50,
                      width: 50,
                    )),
              const SizedBox(
                height: 10,
              ),
            ]);
          }),
        ],
      ),
      overlayDismiss: false);
}
