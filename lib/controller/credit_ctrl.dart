import 'package:get/get.dart';
import 'package:recharge_app/controller/user_ctrl.dart';
import 'package:recharge_app/model/payee.dart';

class CreditController extends GetxController {
  var availableCredit = 3000.obs;
  final UserController userController = Get.find();

  bool canRecharge(Payee payee, int amount) {
    int limit = userController.getMonthlyTopUpLimit();
    String payeeIdentifier = payee.phone; // Using phone as identifier
    int currentTopUp = userController
            .user.value.monthlyTopUpsPerBeneficiary[payeeIdentifier] ??
        0;
    int transactionFee = userController.getTransactionFee();

    return availableCredit.value >= amount + transactionFee &&
        (currentTopUp + amount) <= limit;
  }

  void recharge(Payee payee, int amount) {
    int transactionFee = userController.getTransactionFee();
    availableCredit.value -= (amount + transactionFee);
    userController.updateMonthlyTopUp(payee.phone, amount);
  }
}
