import 'package:field_service_app/config/storages.dart';
import 'package:field_service_app/models/simple/profile.dart';
import 'package:field_service_app/widgets/items/language_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert languageModal(BuildContext context, String msg, dynamic successAction) {
  var currentLang = Get.locale.toString();

  var storage = GetStorage();
  return Alert(
      style: const AlertStyle(
          isOverlayTapDismiss: true,
          alertPadding: EdgeInsets.all(8),
          overlayColor: Colors.black54),
      context: context,
      content:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(height: 10),
        Text(
          // msg,
          '',
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          textAlign: TextAlign.center,
        ),
        LanguageItem(
          item: Profile(title_1: "English"),
          isSelected: currentLang == 'en' ? 1 : 0,
          onClick: () {
            Get.updateLocale(const Locale('en'));
            storage.write(localizationPath, 'en');

            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        LanguageItem(
          item: Profile(
            id: 1,
            title_1: 'العربية',
          ),
          isSelected: currentLang == 'ar' ? 1 : 0,
          onClick: () => {
            Get.updateLocale(const Locale('ar')),
            storage.write(localizationPath, 'ar'),
            Navigator.pop(context)
          },
        ),
      ]),
      buttons: []);
}
