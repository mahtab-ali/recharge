import 'package:get/get.dart';
import 'package:recharge_app/controller/credit_ctrl.dart';
import 'package:recharge_app/util/color.dart';

class RechargeController extends GetxController {
// props
  final CreditController creditController = Get.find();
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

// select box
  void selectBox(int index) {
    selectedIndex.value = index;
    selectedAmount.value = rechargeValues[index];
  }

// recharge
  void doRecharge(int index) {
    creditController.recharge(rechargeValues[index]);
    Get.snackbar(
      'Success',
      'Recharge has been done.',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.light,
    );
  }
}
