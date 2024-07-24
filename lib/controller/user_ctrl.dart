import 'package:get/get.dart';
import 'package:recharge_app/model/user.dart';

class UserController extends GetxController {
  var user = User(name: 'John Doe', isVerified: true).obs;

  int getMonthlyTopUpLimit() {
    return user.value.isVerified ? 500 : 1000;
  }

  int getTransactionFee() {
    return 1;
  }

  void updateMonthlyTopUp(String beneficiary, int amount) {
    user.update((val) {
      if (val != null) {
        val.totalMonthlyTopUp += amount;
        val.monthlyTopUpsPerBeneficiary.update(
            beneficiary, (topUp) => topUp + amount,
            ifAbsent: () => amount);
      }
    });
  }

  void setUserVerificationStatus(bool status) {
    user.update((val) {
      if (val != null) {
        val.isVerified = status;
      }
    });
  }
}
