import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/view/skeletons/payee_list_skeleton.dart';
import 'package:recharge_app/view/widgets/history_card.dart';

class History extends StatelessWidget {
// const
  History({super.key});

// props
  final PayeeController payeeController = Get.find();

// build
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (payeeController.isLoading.value) {
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
      } else {
        return ListView.builder(
          itemCount: payeeController.payees.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final payee = payeeController.payees[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: HistoryCard(
                payee: payee,
                amount: (50 * (index + 1)).toString(),
              ),
            );
          },
        );
      }
    });
  }
}
