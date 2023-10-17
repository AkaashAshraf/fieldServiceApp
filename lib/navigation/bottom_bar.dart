import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:field_service_app/config/api_urls.dart';
import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/controllers/notifications_controller.dart';
import 'package:field_service_app/http/http.dart';
import 'package:field_service_app/views/tabs/home_tab_screen.dart';
import 'package:field_service_app/views/tabs/jobs_tab_screen.dart';
import 'package:field_service_app/views/tabs/profile_tab_screen.dart';
import 'package:field_service_app/views/tabs/stock_tab_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  AuthController authController = Get.put(AuthController());
  GlobalKey bottomNavigationKey = GlobalKey();
  int currentPage = 1;
  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return "";
  }

  Future<String?> getDeviceName() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    }
    return "";
  }

  updateDeviceInformation() async {
    var fcmtoken = ""; //await FirebaseMessaging.instance.getToken() ?? "";
    // log(fcmtoken);
    String? deviceId = await getDeviceId();
    String? deviceName = await getDeviceName();

    post(updateDeviceInfo, {
      "fcm_token": fcmtoken,
      "device_id": deviceId ?? "",
      "device_name": deviceName ?? "",
      "os": Platform.isIOS
          ? "ios"
          : Platform.isAndroid
              ? "android"
              : ""
    });
  }

  NotificationsController notificationsController =
      Get.put(NotificationsController());
  @override
  void initState() {
    updateDeviceInformation();
    notificationListener();
    super.initState();
  }

  notificationListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data}');

      if (message.notification != null) {
        if (message.data["body"] != "") {
          // Get.put(NotificationController()).unreadNotification.value += 1;
          Get.snackbar("", message.notification?.body ?? "",
              backgroundColor: Colors.white,
              colorText: primaryColor,
              overlayColor: Colors.orange);
          notificationsController.fetchNotifications();
          // Get.to(SearchScreen(
          //   defaultSearch: message.data["body"] ?? "",
          // ));
        }
        // else
        //   Get.to(NotificationList());
      }
    });
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  var isValidate = false;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(context),
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          colorBehindNavBar: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 4, blurStyle: BlurStyle.solid)]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      padding: const NavBarPadding.only(top: 15),
      navBarHeight: 70,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style8, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens(BuildContext context) {
  return [
    const HomeTabScreen(),
    const JobsTabScreen(),
    const StockTabScreen(),
    const ProfileTabScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.home,
        // size: 25,
      ),
      title: ("Home"),
      textStyle: TextStyles.bottomTabTextStyle(),
      activeColorPrimary: bottomTabSelectedColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.list_bullet),
      title: ("Jobs"),
      textStyle: TextStyles.bottomTabTextStyle(),
      activeColorPrimary: bottomTabSelectedColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.folder),
      title: ("Stock"),
      textStyle: TextStyles.bottomTabTextStyle(),
      activeColorPrimary: bottomTabSelectedColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_crop_circle),
      title: ("Profile"),
      textStyle: TextStyles.bottomTabTextStyle(),
      activeColorPrimary: bottomTabSelectedColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
