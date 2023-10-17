import 'package:field_service_app/config/colors.dart';
import 'package:field_service_app/config/styles.dart';
import 'package:field_service_app/config/text_sizes.dart';
import 'package:field_service_app/models/simple/job.dart';
import 'package:field_service_app/models/simple/task.dart';
import 'package:field_service_app/widgets/common/app_bar.dart';
import 'package:field_service_app/widgets/items/home_job_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});
  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  var isValidate = false;

  String email = "";
  String password = "";

  bool rememberMe = false;
  int activeTab = 1;
  List<Job> jobs = [
    Job(
        image: "https://picsum.photos/200/300",
        title: "Field Service Design",
        description: "Contract Field service technician"),
    Job(
        image: "https://picsum.photos/200/300",
        title: "Field Service Design",
        description: "Contract Field service technician"),
    Job(
        image: "https://picsum.photos/200/300",
        title: "Field Service Design",
        description: "Contract Field service technician"),
    Job(
        image: "https://picsum.photos/200/300",
        title: "Field Service Design",
        description: "Contract Field service technician"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.transparent(title: "Home"),
        backgroundColor: bgColorMix2,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: screenHeight(context) * 0.38,
                      width: screenWidth(context),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello Akaash",
                                style: TextStyles.textBoldStyle45(context),
                              ),
                            ],
                          ).paddingOnly(left: 15, right: 15),
                          Row(
                            children: [
                              Text(
                                "Welcome to field service",
                                style: TextStyles.textStyle40(context),
                              ),
                            ],
                          ).paddingOnly(left: 15, right: 15, bottom: 20),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  DashBoardTopItem(
                                      color: Colors.green.shade100,
                                      onTap: () {},
                                      iconName:
                                          Icons.supervisor_account_outlined),
                                  DashBoardTopItem(
                                      color: Colors.blue.shade100,
                                      onTap: () {},
                                      iconName:
                                          Icons.store_mall_directory_outlined),
                                  DashBoardTopItem(
                                      color: Colors.brown.shade100,
                                      onTap: () {},
                                      iconName: Icons.list_alt_outlined),
                                  DashBoardTopItem(
                                      color: Colors.yellow.shade100,
                                      onTap: () {},
                                      iconName: Icons.currency_exchange_sharp),
                                  DashBoardTopItem(
                                      color: Colors.blueGrey.shade100,
                                      onTap: () {},
                                      iconName: Icons.send),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DashboardBigItem(
                                    color: Colors.green,
                                    text: "Check-In",
                                    onClick: () {},
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: screenHeight(context) * 0.07,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: DashboardBigItem(
                                    color: Colors.orange.shade400,
                                    text: "Jobs",
                                    onClick: () {},
                                    child: CircularPercentIndicator(
                                      radius: 30.0,
                                      lineWidth: 5.0,
                                      percent: 2 / 3,
                                      center: Text(
                                        "2/3",
                                        style: TextStyles.textBoldStyle45(
                                            context,
                                            color: Colors.white),
                                      ),
                                      progressColor: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: DashboardBigItem(
                                    color: Colors.orange.shade400,
                                    text: "Tasks",
                                    onClick: () {},
                                    child: CircularPercentIndicator(
                                      radius: 30.0,
                                      lineWidth: 5.0,
                                      percent: 2 / 3,
                                      center: Text(
                                        "2/3",
                                        style: TextStyles.textBoldStyle45(
                                            context,
                                            color: Colors.white),
                                      ),
                                      progressColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    // height: screenHeight(context) * 0.45,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Upcoming Tasks",
                                style: TextStyles.textBoldStyle50(context),
                              )
                            ],
                          ),
                          for (int i = 0; i < jobs.length; i++)
                            HomeJobItem(item: jobs[i])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

class DashboardBigItem extends StatelessWidget {
  DashboardBigItem({
    super.key,
    required this.text,
    required this.onClick,
    required this.child,
    required this.color,
  });
  String text;
  Widget child;
  dynamic onClick;
  Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(screenHeight(context) * 0.14, screenHeight(context) * 0.14)),
          maximumSize: MaterialStateProperty.all(
              Size(screenHeight(context) * 0.14, screenHeight(context) * 0.14)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          elevation: MaterialStateProperty.all(5),
          backgroundColor: MaterialStateProperty.all(color)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            Text(
              text,
              style: TextStyles.textBoldStyle45(context, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DashBoardTopItem extends StatelessWidget {
  DashBoardTopItem({
    super.key,
    required this.color,
    required this.onTap,
    required this.iconName,
  });
  Color color;
  IconData iconName;
  dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(screenHeight(context) * 0.08, screenHeight(context) * 0.08)),
          maximumSize: MaterialStateProperty.all(
              Size(screenHeight(context) * 0.08, screenHeight(context) * 0.08)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          elevation: MaterialStateProperty.all(5),
          backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onTap,
      child: Center(
        child: Icon(
          iconName,
          color: Colors.black,
          size: screenHeight(context) * 0.035,
        ),
      ),
    ).paddingAll(5);
  }
}
