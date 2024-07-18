import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:slideable/slideable.dart';

class HistoryCard extends StatelessWidget {
// props
  final Payee? payee;
  final String? amount;
// const
  const HistoryCard({super.key, this.payee, this.amount});

// build
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.dark.withAlpha(30),
              offset: const Offset(0, 0),
              blurRadius: 5,
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Slideable(
          backgroundColor: Colors.white,
          resetSlide: false,
          items: <ActionItems>[
            ActionItems(
              icon: const Icon(
                Ionicons.repeat,
                color: Colors.white,
              ),
              onPress: () {},
              backgroudColor: AppColors.primaryColor,
            ),
          ],
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Ionicons.person_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${payee?.name}",
                          style: AppText.headingTwo(),
                        ),
                        Text(
                          "${payee?.phone}",
                          style: AppText.body(),
                        ),
                      ]),
                ),
                Text(
                  "AED $amount",
                  style: AppText.headingTwo(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
