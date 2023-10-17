import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/widgets/common/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString verificationID = "".obs;
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  } //onInit

  Future<bool> sendOtp(
      {required String phone,
      required dynamic sent,
      required BuildContext context,
      required AuthController authController,
      required dynamic failed}) async {
    try {
      loading(true);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          failed(e.message);
          authController.otpLoading(false);
        },
        codeSent: (String verificationId, int? resendToken) async {
          verificationID(verificationId);
          authController.otpLoading(false);

          sent();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          myToastMessage(
                  context: context,
                  type: "error",
                  descripetion: "somethingWentWrongPleaseTryAgain".tr)
              .show(context);
          Get.back();
          authController.otpLoading(false);
        },
      );
      loading(true);

      return false;
    } catch (e) {
      failed(e.toString());
      authController.otpLoading(false);

      return false;
    } finally {
      loading(false);
    }
  }

  verifyOtp({
    required String otp,
    required dynamic failed,
    required dynamic success,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID.value, smsCode: otp);
      await auth.signInWithCredential(credential);
      success();
    } catch (e) {
      // inspect(e);
      failed(e.toString());
    }
  }
}
