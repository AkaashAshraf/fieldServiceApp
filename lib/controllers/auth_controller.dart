import 'package:field_service_app/config/api_urls.dart';
import 'package:field_service_app/config/storages.dart';
import 'package:field_service_app/controllers/otp_controller.dart';
import 'package:field_service_app/http/http.dart';
import 'package:field_service_app/main.dart';
import 'package:field_service_app/models/response/errors_422.dart';
import 'package:field_service_app/models/response/login_response.dart';
import 'package:field_service_app/models/response/successResponse.dart';
import 'package:field_service_app/models/simple/user.dart';
import 'package:field_service_app/navigation/bottom_bar.dart';
import 'package:field_service_app/widgets/common/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class AuthController extends GetxController {
  RxInt userType = 0.obs;
  RxString otp = "".obs;
  Rx<User> user = User().obs;
  RxString forgetContact = "".obs;

  RxString recievedOtp = "".obs;
  RxString token = "".obs;

  RxBool otpLoading = false.obs;
  OtpTimerButtonController otpTimerButtonController =
      OtpTimerButtonController();

  RxString addressTitle = "".obs;
  RxString emailResponseError = "".obs;
  RxString passwordResponseError = "".obs;
  RxString contactResponseError = "".obs;

  RxBool loading = false.obs;
  @override
  void onInit() {
    readUser();

    super.onInit();
  } //onInit

  String emailValidator(String value) {
    return !RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)
        ? "invalidEmail".tr
        : emailResponseError.value;
  }

  String phoneValidator(String value) {
    return value.length < 8
        ? "phoneNumebrCannotBeLessThan8Digits".tr
        : contactResponseError.value;
  }

  String passwordValidator(String value) {
    return value.length < 6
        ? "passwordCannotBeLessThan6Digits".tr
        : passwordResponseError.value;
  }

  logout() {
    MyApp().storage.remove(tokenPath);
    MyApp().storage.remove(userDataPath);
    // Get.put(CartController()).cartItems([]);
    // user(User());
    userType(0);
  }

  login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      loading(true);

      var raw = await post(loginUrl, {
        "email": email,
        "password": password,
      });

      if (raw?.statusCode == 200) {
        var response = loginFromJson(raw?.body);
        // if (rememberMe)
        {
          MyApp().storage.write(userDataPath, loginToJson(response));
          MyApp().storage.write(tokenPath, (response.accessToken));
        }
        token(response.accessToken);
        user.value = response.user;
        userType(response.user.appUserType);
        // Get.put(CartController()).loadCart();

        Get.offAll(const BottomNavigation());
      } else if (raw?.statusCode == 422) {
        var response = error422FromJson(raw?.body);
        emailResponseError(response.errors!.email!.isNotEmpty
            ? response.errors?.email![0]
            : "");
        passwordResponseError(response.errors!.password!.isNotEmpty
            ? response.errors?.password![0]
            : "");
      } else if (raw?.statusCode == 401) {
        var jsonResponse = successResponseFromJson(raw?.body);
        passwordResponseError(Get.locale.toString() == "en"
            ? jsonResponse.messageEn
            : jsonResponse.messageAr);
      } else if (raw?.statusCode == 402) {
        var jsonResponse = successResponseFromJson(raw?.body);
        passwordResponseError(Get.locale.toString() == "en"
            ? jsonResponse.messageEn
            : jsonResponse.messageAr);
        // ignore: use_build_context_synchronously
        myToastMessage(
                type: "warning",
                context: context,
                descripetion: Get.locale.toString() == "en"
                    ? jsonResponse.messageEn
                    : jsonResponse.messageAr)
            .show(context);
      }
    } catch (e) {
    } finally {
      loading(false);
    }
  }

  updatePassword({
    required String password,
    required bool logoutOthers,
    required BuildContext context,
  }) async {
    try {
      loading(true);

      var raw = await post(updatePasswordUrl, {
        "password": password,
        "logout_all": logoutOthers ? "1" : "0",
        "contact": forgetContact.value
      });

      if (raw?.statusCode == 200) {
        //   var response = loginFromJson(raw?.body);
        //   MyApp().storage.write(userDataPath, loginToJson(response));
        //   MyApp().storage.write(tokenPath, (response.accessToken ?? ""));

        //   user.value = response.user ?? User();
        //   userType(response.user?.info?.userType ?? 0);
        //   Get.offAll(const BottomNavigation());
        // } else if (raw?.statusCode == 422) {
        //   var response = error422FromJson(raw?.body);
        //   emailResponseError(response.errors!.email!.isNotEmpty
        //       ? response.errors?.email![0]
        //       : "");
        //   passwordResponseError(response.errors!.password!.isNotEmpty
        //       ? response.errors?.password![0]
        //       : "");
      } else if (raw?.statusCode == 401) {
        // var jsonResponse = successResponseFromJson(raw?.body);
        // passwordResponseError(Get.locale.toString() == "en"
        //     ? jsonResponse.messageEn
        //     : jsonResponse.messageAr);
      } else if (raw?.statusCode == 402) {
        // var jsonResponse = successResponseFromJson(raw?.body);
        // passwordResponseError(Get.locale.toString() == "en"
        //     ? jsonResponse.messageEn
        //     : jsonResponse.messageAr);
        // ignore: use_build_context_synchronously

        // myToastMessage(
        //         type: "warning",
        //         context: context,
        //         descripetion: Get.locale.toString() == "en"
        //             ? jsonResponse.messageEn
        //             : jsonResponse.messageAr)
        //     .show(context);
      }
    } catch (e) {
    } finally {
      loading(false);
    }
  }

  // signup(
  //     {required String name,
  //     required String email,
  //     required BuildContext context,
  //     required String contact,
  //     required String password,
  //     required String crNo,
  //     required String vatIn,
  //     required String taxCard,
  //     required int accountType,
  //     required String address,
  //     required List<int> bussinessTypes}) async {
  //   try {
  //     loading(true);

  //     var raw = await postWithJsonBody(
  //         signUpUrl,
  //         json.encode({
  //           "password": password,
  //           "email": email,
  //           "user_type": accountType.toString(),
  //           "address": address,
  //           "name_en": name,
  //           "name_ar": name,
  //           "contact": contact,
  //           "cr_no": crNo,
  //           "var_in": vatIn,
  //           "tax_card": taxCard,
  //           "types": bussinessTypes
  //         }));

  //     if (raw?.statusCode == 200) {
  //       if (accountType == 1) {
  //         Get.back();

  //         // ignore: use_build_context_synchronously
  //         myToastMessage(
  //                 type: "warning",
  //                 context: context,
  //                 descripetion:
  //                     "Your request has been regitered. You will recieve a message when your account will be approved. Thank you")
  //             .show(context);
  //         return;
  //       }
  //       // var response = loginFromJson(raw?.body);

  //       // MyApp().storage.write(userDataPath, loginToJson(response));
  //       // MyApp().storage.write(tokenPath, (response.accessToken ?? ""));

  //       user.value = response.user ?? User();
  //       userType(response.user?.info?.userType ?? 0);
  //       Get.offAll(const BottomNavigation());
  //     } else if (raw?.statusCode == 422) {
  //       var response = error422FromJson(raw?.body);
  //       emailResponseError(response.errors!.email!.isNotEmpty
  //           ? response.errors?.email![0]
  //           : "");
  //       passwordResponseError(response.errors!.password!.isNotEmpty
  //           ? response.errors?.password![0]
  //           : "");
  //     } else if (raw?.statusCode == 401) {
  //       passwordResponseError("invalidPassword".tr);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     loading(false);
  //   }
  // }

  readUser() async {
    try {
      var cacheUser = MyApp().storage.read(userDataPath);

      // if (cacheUser.isNotEmpty) {
      //   var jsonUser = loginFromJson(cacheUser);
      //   user(jsonUser.user);
      //   userType(user.value.info?.userType ?? 0);
      // }
    } finally {}
  }

  // updateProfile(
  //     {String email = "",
  //     String password = "",
  //     String contact = "",
  //     String nameEn = "",
  //     String nameAr = "",
  //     String address = "",
  //     bool logoutAll = false,
  //     String minimunOrder = "",
  //     String paymentMethod = "",
  //     XFile? image,
  //     bool isGoBack = true}) async {
  //   try {
  //     loading(true);

  //     // var raw = await post(updateProfileUrl, {
  //     //   "email": email,
  //     //   "password": password,
  //     //   "name_en": nameEn,
  //     //   "name_ar": nameAr,
  //     //   "contact": contact,
  //     //   "address": address,
  //     //   "payment_method": paymentMethod,
  //     //   "minimum_order": minimunOrder.isNotEmpty
  //     //       ? double.tryParse(minimunOrder)?.toStringAsFixed(3)
  //     //       : "",
  //     // });

  //     var request = http.MultipartRequest('POST', Uri.parse(updateProfileUrl));
  //     request.fields['email'] = email;
  //     request.fields['name_en'] = nameEn;
  //     request.fields['name_ar'] = nameAr;
  //     request.fields['contact'] = contact;
  //     // request.fields['logout_all'] = logoutAll ? "1" : "0";

  //     request.fields['address'] = address;
  //     request.fields['payment_method'] = paymentMethod;
  //     request.fields['minimum_order'] = (minimunOrder.isNotEmpty
  //             ? double.tryParse(minimunOrder)?.toStringAsFixed(3)
  //             : "") ??
  //         "0";

  //     request.fields['password'] = password;

  //     // print(request);
  //     if (image != null) {
  //       http.MultipartFile multipartFile =
  //           await http.MultipartFile.fromPath('image', image.path);
  //       request.files.add(multipartFile);
  //     }

  //     var raw = await multirequestPost(request);

  //     // inspect(raw);

  //     if (raw?.statusCode == 200) {
  //       var resData = await raw.stream.toBytes();
  //       var fRes = String.fromCharCodes(resData);
  //       var response = loginFromJson(fRes);
  //       if (isGoBack) {
  //         Get.back();
  //       }
  //       MyApp().storage.write(userDataPath, loginToJson(response));

  //       user.value = response.user ?? User();
  //       userType(response.user?.info?.userType ?? 0);
  //     } else if (raw?.statusCode == 422) {
  //       var response = error422FromJson(raw?.body);
  //       emailResponseError(response.errors!.email!.isNotEmpty
  //           ? response.errors?.email![0]
  //           : "");
  //       passwordResponseError(response.errors!.password!.isNotEmpty
  //           ? response.errors?.password![0]
  //           : "");
  //     } else if (raw?.statusCode == 401) {
  //       passwordResponseError("invalidPassword".tr);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     loading(false);
  //   }
  // }

  Future<bool> sendOtp(BuildContext context, String phone,
      {required dynamic codeSent}) async {
    try {
      var res = false;
      otpLoading(true);
      var response = await post(isContactExist, {"contact": phone});
      if (response?.statusCode != 200) {
        otpLoading(false);
        // ignore: use_build_context_synchronously
        myToastMessage(
                context: context,
                type: "error",
                descripetion: "numberNotExist".tr)
            .show(context);
        return false;
      }
      forgetContact(phone);
      // ignore: use_build_context_synchronously
      await Get.put(OtpController()).sendOtp(
          authController: this,
          context: context,
          phone: "+968$phone",
          sent: () {
            codeSent();
            res = true;
            otpLoading(false);
          },
          failed: (String msg) {
            myToastMessage(context: context, type: "error", descripetion: msg)
                .show(context);
            otpLoading(false);
          });
      // recievedOtp("");

      // otpLoading(true);
      // var res = await post(sendOtpUrl, {"contact": phone});
      // if (res != null) {
      //   var response = optModelFromJson(res?.body);
      //   recievedOtp(response.otp.toString());
      //   // ignore: use_build_context_synchronously
      //   tamweenToastMessage(
      //           context: context,
      //           descripetion: Get.locale.toString() == "en"
      //               ? response.messageEn
      //               : response.messageAr,
      //           type: response.status == 1 ? "success" : "error")
      //       .show(context);
      // }
      // inspect(res);
      return res;
    } catch (e) {
      return false;
    } finally {}
  }
}
