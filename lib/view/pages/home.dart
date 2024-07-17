import 'package:flutter/material.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/view/widgets/balance_card.dart';
import 'package:recharge_app/view/widgets/custom_heading.dart';
import 'package:recharge_app/view/widgets/payee_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          children: [
            const BalanceCard(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              title: "200 AED",
              subTitle: "Your Balance",
            ),
            const CustomHeading(
              title: "Your Payees",
            ),
            Container(
              height: 240,
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const PayeeCard(
                    name: "John Doe",
                    color: AppColors.primaryColor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
