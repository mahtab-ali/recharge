import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/view/pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
