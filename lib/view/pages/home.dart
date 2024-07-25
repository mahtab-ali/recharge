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
import 'package:recharge_app/view/pages/add_payee.dart';
import 'package:recharge_app/view/pages/recharge.dart';
import 'package:recharge_app/view/skeletons/payee_skeleton.dart';
import 'package:recharge_app/view/widgets/balance_card.dart';
import 'package:recharge_app/view/widgets/custom_heading.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';
import 'package:recharge_app/view/widgets/payee_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PayeeController payeeController = Get.find();
  final CreditController creditController = Get.find();
  final RechargeController rechargeController = Get.find();
  final UserController userController = Get.find();

  void handlePayeeSelection(Payee payee, int index) {
    rechargeController.selectedIndex.value = 0;
    int amount = rechargeController.rechargeValues[0];
    if (creditController.canRecharge(payee, amount)) {
      rechargeController.setSelectedPayee(payee);
      Get.to(() => Recharge(selectedPayee: payee));
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => BalanceCard(
                colors: const [
                  AppColors.primaryColor,
                  AppColors.secondaryColor
                ],
                title: "${creditController.availableCredit.value} AED",
                subTitle: "Available Credit",
                user: userController.user.value,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CustomHeading(
              title: "Your Payees",
              trailing: SizedBox(
                child: IconButton(
                  onPressed: () {
                    if (payeeController.payees.length == 5) {
                      Get.snackbar(
                        'Error',
                        'You can add only 5 payees at the moment',
                        backgroundColor: AppColors.primaryColor,
                        colorText: AppColors.light,
                      );
                    } else {
                      Get.to(() => CreatePayee());
                    }
                  },
                  icon: const Icon(
                    Ionicons.add,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (payeeController.isLoading.value) {
              return SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return PayeeSkeleton();
                  },
                ),
              );
            } else if (payeeController.payees.isEmpty) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Ionicons.folder_open_outline,
                        color: AppColors.primaryColor,
                        size: 60,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "There are no payees added yet, please add payees first!",
                        style: AppText.body(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      GradientButton(
                        onPressed: () {
                          Get.to(() => CreatePayee());
                        },
                        colors: const [
                          AppColors.primaryColor,
                          AppColors.secondaryColor,
                        ],
                        child: Text(
                          "Create Payee",
                          style: AppText.body(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: payeeController.payees.length,
                  itemBuilder: (BuildContext context, int index) {
                    final payee = payeeController.payees[index];
                    return PayeeCard(
                      payee: payee,
                      onPressed: () => handlePayeeSelection(payee, index),
                      onRemove: () {
                        payeeController.deletePayee(payee);
                      },
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
