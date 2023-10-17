import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/controllers/constants_controller.dart';
import 'package:field_service_app/views/auth/sign_in.dart';
import 'package:field_service_app/widgets/common/auth_text_input.dart';
import 'package:field_service_app/widgets/common/loading_indicator.dart';
import 'package:field_service_app/widgets/common/simple_button.dart';
import 'package:field_service_app/widgets/common/simple_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import "package:get/get.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var isValidate = false;
  int groupValue = 2;

  var isAgree = false;
  String name = "";
  String email = "";
  String contact = "";
  String crNo = "";
  String vatIn = "";
  String taxCard = "";
  String address = "";
  String password = "";

  String selectedBussinessTypesTitles = "select".tr;

  ConstantsController constantsController = Get.put(ConstantsController());
  AuthController authController = Get.put(AuthController());
  isValid() {
    if (isAgree &&
        name.isNotEmpty &&
        authController.emailValidator(email) == "" &&
        password.length > 5 &&
        contact.length > 7 &&
        crNo.isNotEmpty &&
        vatIn.isNotEmpty &&
        vatIn.startsWith("om") &&
        taxCard.isNotEmpty &&
        taxCard.startsWith("om")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "alreadyHaveAnAccount".tr,
                style: const TextStyle(
                    color: authTextInputTitleColor, fontFamily: "primary"),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(const SignIn());
                },
                child: Text(
                  "loginNow".tr,
                  style: const TextStyle(
                      color: primaryColor,
                      fontFamily: "primary",
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: GetX<AuthController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (() => {Navigator.pop(context)}),
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 15, right: 15),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: screenHeight(context) * 0.1,
                      width: screenWidth(context),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthInputField(
                    title: "comapnyName".tr,
                    hint: "enterYourCompanyNameHere".tr,
                    validator: isValidate && name.isEmpty
                        ? "nameCanNotBeEmpty".tr
                        : "",
                    onTextChange: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "email".tr,
                    hint: "enterYourEmail".tr,
                    validator:
                        isValidate ? controller.emailValidator(email) : "",
                    onTextChange: (val) {
                      controller.emailResponseError("");
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "contact".tr,
                    hint: "enterYourContact".tr,
                    keyBoardType: TextInputType.number,
                    validator:
                        isValidate ? controller.phoneValidator(contact) : "",
                    onTextChange: (val) {
                      setState(() {
                        contact = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "commercialRegisteration".tr,
                    hint: "registerationNumber".tr,
                    validator: isValidate && crNo.isEmpty
                        ? "commercialNumberCanNotBeEmpty".tr
                        : "",
                    onTextChange: (val) {
                      setState(() {
                        crNo = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "vatIn".tr,
                    hint: "enter Your VatIn".tr,
                    validator:
                        isValidate && (vatIn.isEmpty || !vatIn.startsWith("om"))
                            ? "vatInInvalid".tr
                            : "",
                    onTextChange: (val) {
                      setState(() {
                        vatIn = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "taxCard".tr,
                    hint: "enter Your TaxCard".tr,
                    validator: isValidate &&
                            (taxCard.isEmpty || !taxCard.startsWith("om"))
                        ? "taxCardInvalid".tr
                        : "",
                    onTextChange: (val) {
                      setState(() {
                        taxCard = val;
                      });
                    },
                  ),
                  AuthInputField(
                    title: "address".tr,
                    hint: "enterYourAddress".tr,
                    validator: isValidate && address.isEmpty
                        ? "addressCanNotBeEmpty".tr
                        : "",
                    onTextChange: (val) {
                      setState(() {
                        address = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    title: "enterPassword".tr,
                    isPassword: true,
                    hint: "enterYourPassword",
                    validator: isValidate && password.length < 6
                        ? "passwordCanNotBeLessThan6Characters".tr
                        : "",
                    onTextChange: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          myRadioButton(
                              title: "bussinessOwner".tr,
                              value: 2,
                              onChanged: (newValue) {
                                setState(() => groupValue = newValue);
                                // authController.updateProfile(
                                //     paymentMethod: "both");
                              }),
                          myRadioButton(
                              title: "partner".tr,
                              value: 1,
                              onChanged: (newValue) {
                                setState(() => groupValue = newValue);
                                // authController.updateProfile(
                                //     paymentMethod: "debit");
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(primaryColor),
                        value: isAgree,
                        onChanged: (bool? value) {
                          setState(() {
                            isAgree = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.9,
                    height: screenHeight(context) * 0.06,
                    child: controller.loading.value
                        ? const MyLoadingIndicator(
                            width: 25,
                            height: 25,
                          )
                        : SimpleButton(
                            title: "continue".tr,
                            disable: !isAgree,
                            onPress: () {
                              setState(() {
                                isValidate = true;
                              });
                              if (!isValid()) {
                                return;
                              }
                              // controller.signup(
                              //     name: name,
                              //     context: context,
                              //     email: email,
                              //     accountType: groupValue,
                              //     contact: contact,
                              //     password: password,
                              //     crNo: crNo,
                              //     vatIn: vatIn,
                              //     taxCard: taxCard,
                              //     address: address,
                              //     bussinessTypes: selectedBussinessTypes
                              //         .map((e) => e.id)
                              //         .toList());
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget myRadioButton(
      {required String title, required int value, required dynamic onChanged}) {
    return SizedBox(
      width: screenWidth(context) * 0.45,
      child: RadioListTile(
        activeColor: primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "primary",
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
