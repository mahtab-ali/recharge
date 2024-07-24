import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/controller/credit_ctrl.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/controller/recharge_ctrl.dart';
import 'package:recharge_app/controller/user_ctrl.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/view/pages/welcome.dart';

void main() {
  Get.put(UserController());
  Get.put(CreditController());
  Get.put(PayeeController());
  Get.put(RechargeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
