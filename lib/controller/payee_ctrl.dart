import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:recharge_app/model/payee.dart';

class PayeeController extends GetxController {
  var payees = <Payee>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPayees();
    super.onInit();
  }

  void fetchPayees() async {
    try {
      isLoading(true);
      final String response = await rootBundle.loadString('data/payees.json');
      var jsonData = jsonDecode(response);
      payees.value = (jsonData as List).map((i) => Payee.fromJson(i)).toList();
    } catch (e) {
      // Handle error
      print('Error loading payees: $e');
    } finally {
      // Add a 3-second delay before setting isLoading to false
      await Future.delayed(const Duration(seconds: 3));
      isLoading(false);
    }
  }
}
