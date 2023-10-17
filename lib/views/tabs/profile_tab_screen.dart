import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/views/auth/sign_in.dart';
import 'package:field_service_app/widgets/common/app_bar.dart';
import 'package:field_service_app/widgets/items/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key, this.isBack = false});
  final bool isBack;
  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  var isValidate = false;

  String email = "";
  String password = "";
  AuthController authController = Get.find<AuthController>();
  bool rememberMe = false;
  int activeTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.white(title: "Profile"),
        backgroundColor: bgColor,
        body: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200/300'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Akash Ashraf",
                      style: TextStyles.textBoldStyle50(context),
                    ),
                    Text(
                      "Field Service Officer",
                      style: TextStyles.textStyle45(context),
                    ),
                    Text(
                      "+968 72722798",
                      style: TextStyles.textStyle45(context,
                          color: textSecandaryColor),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyles.textBoldStyle50(context),
                    ).paddingSymmetric(horizontal: 15, vertical: 5),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: shadowColor,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: screenWidth(context),
                  child: Column(
                    children: [
                      ProfileListItem(
                          icon: const Icon(
                            Icons.create_outlined,
                          ),
                          title: "Edit Profile"),
                      ProfileListItem(
                          icon: const Icon(
                            Icons.document_scanner_outlined,
                          ),
                          title: "Progress Report"),
                      ProfileListItem(
                          icon: const Icon(
                            Icons.password,
                          ),
                          title: "Update Password"),
                      ProfileListItem(
                        icon: const Icon(
                          Icons.lock,
                        ),
                        title: "Privacy Policy",
                      ),
                      GestureDetector(
                        onTap: () {
                          authController.logout();

                          Get.offAll(const SignIn());
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Logout",
                                  style: TextStyles.textBoldStyle50(context),
                                ),
                                const Icon(
                                  Icons.logout,
                                ),
                              ],
                            ).paddingSymmetric(vertical: 15, horizontal: 15),
                          ],
                        ),
                      )
                    ],
                  ),
                ).paddingSymmetric(horizontal: 10)
              ],
            ),
          ],
        )));
  }
}
