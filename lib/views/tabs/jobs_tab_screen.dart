import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class JobsTabScreen extends StatefulWidget {
  const JobsTabScreen({super.key, this.isBack = false});
  final bool isBack;
  @override
  State<JobsTabScreen> createState() => _JobsTabScreenState();
}

class _JobsTabScreenState extends State<JobsTabScreen> {
  var isValidate = false;

  String email = "";
  String password = "";

  bool rememberMe = false;
  int activeTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(child: Center(child: Text("Jobs"))));
  }
}
