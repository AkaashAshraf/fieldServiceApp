import 'dart:io';

import 'package:field_service_app/config/api_urls.dart';
import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/http/http.dart';
import 'package:field_service_app/models/response/version_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConstantsController extends GetxController {
  @override
  void onInit() {
    getConstants();

    super.onInit();
  } //onInit

  getConstants() async {
    try {
      var raw = await post(constantsUrl, {});
      // inspect(raw);
      // if (raw.statusCode == 200) {
      //   var response = constantsFromJson(raw.body);
      //   categories(response.categories);
      //   subCategories(response.subCategories);
      //   bussinessTypes(response.bussinessTypes);
      //   countries(response.countries);
      //   cities(response.cities);
      //   regions(response.regions);

      //   units(response.units);
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  void checkAppExpiry(BuildContext context) async {
    try {
      var response = await post(versionCheckUrl, {});
      if (response != null) {
        var jsonResponse = checkVersionFromJson(response?.body);

        if ((Platform.isAndroid &&
                jsonResponse.android &&
                jsonResponse.androidVersion > androidLocalVersion) ||
            (Platform.isIOS &&
                jsonResponse.ios &&
                jsonResponse.iosVersion > iosLocalVersion)) {
          // ignore: use_build_context_synchronously
          Alert(
              onWillPopActive: true,
              closeIcon: Container(),
              context: context,
              type: AlertType.warning,
              style: AlertStyle(
                  // ignore: use_build_context_synchronously
                  titleStyle: TextStyle(
                      fontFamily: "primary",
                      fontWeight: FontWeight.bold,
                      // ignore: use_build_context_synchronously
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  // ignore: use_build_context_synchronously
                  descStyle: TextStyle(
                      fontFamily: "primary",
                      // ignore: use_build_context_synchronously
                      fontSize: MediaQuery.of(context).size.width * 0.045)),
              title: "app_expired".tr,
              desc: "please_update".tr,
              content: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    // ignore: use_build_context_synchronously
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          LaunchReview.launch(
                              androidAppId:
                                  "smart_energy.tamween.buyer_supplier",
                              iOSAppId: "1633078775");
                          // Navigator.pop(context);
                        },
                        child: Text(
                          "upgrade_now".tr,
                          style: TextStyle(
                              fontFamily: "primary",
                              // ignore: use_build_context_synchronously
                              fontSize: screenWidth(context) * 0.04),
                        )),
                  )
                ],
              ),
              buttons: []).show();
        }
      }
    } catch (e) {}
  }
}
