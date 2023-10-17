import 'package:field_service_app/config/colors.dart';
import 'package:flutter/material.dart';

class StockTabScreen extends StatefulWidget {
  const StockTabScreen({super.key, this.isBack = false});
  final bool isBack;
  @override
  State<StockTabScreen> createState() => _StockTabScreenState();
}

class _StockTabScreenState extends State<StockTabScreen> {
  var isValidate = false;

  String email = "";
  String password = "";

  bool rememberMe = false;
  int activeTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(child: Center(child: Text("Stock"))));
  }
}
