import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/controller/credit_ctrl.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/controller/recharge_ctrl.dart';
import 'package:recharge_app/controller/user_ctrl.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/recharge.dart';
import 'package:recharge_app/view/skeletons/payee_list_skeleton.dart';
import 'package:recharge_app/view/widgets/history_card.dart';

class History extends StatelessWidget {
  History({super.key});

  final RechargeController rechargeController = Get.find();
  final PayeeController payeeController = Get.find();
  final CreditController creditController = Get.find();
  final UserController userController = Get.find();

  void handleRecharge(Payee payee, int amount) {
    if (creditController.canRecharge(payee, amount)) {
      int? index = rechargeController.findIndexByAmount(amount);
      if (index != -1) {
        rechargeController.selectedIndex.value = index!;
        rechargeController.setSelectedPayee(payee);
        Get.to(() => Recharge(selectedPayee: payee));
      } else {
        Get.snackbar(
          'Error',
          'Invalid amount selected',
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.light,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Insufficient credit or monthly limit exceeded for ${payee.name}',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.light,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (rechargeController.isLoading.value) {
        return ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: PayeeListSkeleton(),
            );
          },
        );
      } else if (rechargeController.rechargeHistory.isEmpty) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.card_outline,
                  color: AppColors.primaryColor,
                  size: 60,
                ),
                const SizedBox(height: 15),
                Text(
                  "You haven't made any recharges yet, once you do history will appear here",
                  style: AppText.body(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: rechargeController.rechargeHistory.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final entry = rechargeController.rechargeHistory[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: HistoryCard(
                payee: entry.payee,
                amount: entry.amount.toString(),
                onSwipe: () {
                  handleRecharge(entry.payee, entry.amount);
                },
              ),
            );
          },
        );
      }
    });
  }
}
