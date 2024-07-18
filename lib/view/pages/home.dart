import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/view/pages/recharge.dart';
import 'package:recharge_app/view/skeletons/payee_skeleton.dart';
import 'package:recharge_app/view/widgets/balance_card.dart';
import 'package:recharge_app/view/widgets/custom_heading.dart';
import 'package:recharge_app/view/widgets/payee_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PayeeController payeeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: BalanceCard(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              title: "3000 AED",
              subTitle: "Available Credit",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: CustomHeading(
              title: "Your Payees",
              trailing: const Icon(
                Ionicons.refresh,
                color: AppColors.primaryColor,
              ),
              onTrailingClick: () {
                payeeController.fetchPayees();
              },
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
                      color: AppColors.primaryColor,
                      payee: payee,
                      onPressed: () {
                        Get.to(Recharge());
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
