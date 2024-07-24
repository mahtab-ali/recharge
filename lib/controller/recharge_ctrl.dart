import 'dart:convert';

import 'package:get/get.dart';
import 'package:recharge_app/controller/credit_ctrl.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RechargeController extends GetxController {
  final CreditController creditController = Get.find();
  Payee? selectedPayee;

  var isLoading = true.obs;
  var selectedIndex = (-1).obs;
  var selectedAmount = 0.obs;
  final List<int> rechargeValues = [
    5,
    10,
    20,
    50,
    75,
    100,
    150,
    200,
    250,
  ];

  var rechargeHistory = <RechargeHistoryEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRechargeHistory();
  }

  int? findIndexByAmount(int amount) {
    return rechargeValues.indexOf(amount);
  }

  void setSelectedPayee(Payee payee) {
    selectedPayee = payee;
  }

  void selectBox(int index) {
    selectedIndex.value = index;
    selectedAmount.value = rechargeValues[index];
  }

  void doRecharge(int index) async {
    int amount = rechargeValues[index];
    if (selectedPayee != null) {
      creditController.recharge(selectedPayee!, amount);
      RechargeHistoryEntry entry = RechargeHistoryEntry(
        payee: selectedPayee!,
        amount: amount,
      );
      rechargeHistory.add(entry);
      await saveRechargeHistory();
    }
    Future.delayed(
      const Duration(seconds: 2),
    ).then((e) {
      isLoading(false);
    });
  }

  Future<void> saveRechargeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyJson = rechargeHistory.map((entry) {
      return jsonEncode(entry.toJson());
    }).toList();
    await prefs.setStringList('rechargeHistory', historyJson);
  }

  Future<void> loadRechargeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyJson = prefs.getStringList('rechargeHistory');
    if (historyJson != null) {
      rechargeHistory.value = historyJson.map((jsonString) {
        return RechargeHistoryEntry.fromJson(jsonDecode(jsonString));
      }).toList();
    }
    isLoading(false);
  }
}

class RechargeHistoryEntry {
  final Payee payee;
  final int amount;

  RechargeHistoryEntry({required this.payee, required this.amount});

  Map<String, dynamic> toJson() => {
        'payee': payee.toJson(),
        'amount': amount,
      };

  factory RechargeHistoryEntry.fromJson(Map<String, dynamic> json) {
    return RechargeHistoryEntry(
      payee: Payee.fromJson(json['payee']),
      amount: json['amount'],
    );
  }
}
