import 'package:get/get.dart';
import 'package:recharge_app/util/color.dart';

class CreditController extends GetxController {
  // Default credit set to 3000 AED
  var availableCredit = 3000.obs;

  // Method to subtract the selected amount from the available credit
  void recharge(int amount) {
    if (availableCredit >= amount) {
      availableCredit.value -= amount;
    } else {
      Get.snackbar(
        'Error',
        'Insufficient credit',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.light,
      );
    }
  }
}
