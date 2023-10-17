import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/storages.dart';
import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/main.dart';
import 'package:field_service_app/navigation/bottom_bar.dart';
import 'package:field_service_app/views/auth/forget_password.dart';
import 'package:field_service_app/views/auth/sign_up.dart';
import 'package:field_service_app/widgets/common/auth_text_input.dart';
import 'package:field_service_app/widgets/common/loading_indicator.dart';
import 'package:field_service_app/widgets/common/simple_button.dart';
import 'package:flutter/material.dart';

import "package:get/get.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.isBack = false});
  final bool isBack;
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var isValidate = false;

  String email = "";
  String password = "";

  bool rememberMe = false;
  int activeTab = 1;
  readToken() async {
    String token = await MyApp().storage.read(tokenPath) ?? "";
    if (token.isNotEmpty) {
      Get.offAll(const BottomNavigation());
    }
  }

  @override
  void initState() {
    readToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SafeArea(
        child: GetX<AuthController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: SizedBox(
                height: height * 0.68,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (widget.isBack)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (() => {Navigator.pop(context)}),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: primaryColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          Column(
                            children: [
                              SizedBox(
                                  height: height * 0.1,
                                  width: width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40, top: 30),
                                    child: Image.asset(
                                      "assets/logo.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Sales Field",
                                style: TextStyles.textBoldStyle50(context),
                              ),
                              Text(
                                "Field Service Officer",
                                style: TextStyles.textBoldStyle4(context,
                                    color: textSecandaryColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              AuthInputField(
                                title: "email".tr,
                                initialValue: email,
                                hint: "enterYourEmail".tr,
                                onTextChange: (val) {
                                  setState(() {
                                    email = val;
                                  });

                                  controller.emailResponseError("");
                                },
                                validator: isValidate
                                    ? controller.emailValidator(email)
                                    : "",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AuthInputField(
                                title: "enterPassword".tr,
                                isPassword: true,
                                initialValue: password,
                                validator: isValidate
                                    ? controller.passwordValidator(password)
                                    : "",
                                hint: "enterYourPassword".tr,
                                onTextChange: (val) {
                                  setState(() {
                                    password = val;
                                  });

                                  controller.passwordResponseError("");
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(const ForgetPassword());
                                      },
                                      child: Text(
                                        "forgetPassword".tr,
                                        style: const TextStyle(
                                            fontFamily: "primary",
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: width * 0.9,
                                height: height * 0.06,
                                child: controller.loading.value
                                    ? const MyLoadingIndicator()
                                    : SimpleButton(
                                        title: "login".tr,
                                        onPress: () {
                                          setState(() {
                                            isValidate = true;
                                          });
                                          if (controller.passwordValidator(
                                                      password) ==
                                                  "" &&
                                              controller
                                                      .emailValidator(email) ==
                                                  "") {
                                            controller.login(
                                                context: context,
                                                email: email,
                                                password: password);
                                          }
                                        },
                                      ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget topTabItem(double width,
      {required String title,
      required bool isActive,
      required dynamic onChange}) {
    return GestureDetector(
      onTap: onChange,
      child: Container(
          width: width * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isActive ? primaryColor : lightBgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Center(
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: "primary",
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.045,
                    color: isActive ? Colors.white : Colors.black),
              ),
            ),
          )),
    );
  }
}
