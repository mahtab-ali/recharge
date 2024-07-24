import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/mock_payee_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayeeController extends GetxController {
  var payees = <Payee>[].obs;
  var isLoading = true.obs;
  final PayeeService _payeeService = PayeeService();

  @override
  void onInit() {
    super.onInit();
    loadPayees();
  }

  Future<void> loadPayees() async {
    isLoading(true);
    try {
      final fetchedPayees = await _payeeService.fetchPayees();
      payees.value = fetchedPayees;
    } catch (e) {
      isLoading(false);
      debugPrint("Error loading payees: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> _savePayees() async {
    final jsonData = json.encode(
      payees.map((payee) => payee.toJson()).toList(),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('payees', jsonData);
  }

  void addPayee(Payee payee) {
    payees.add(payee);
    Get.back();
    _savePayees();
  }

  void deletePayee(Payee payee) {
    payees.remove(payee);
    _savePayees();
  }
}
