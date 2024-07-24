import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/model/user.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';

class BalanceCard extends StatelessWidget {
// Props

  final List<Color>? colors;
  final String? title;
  final String? subTitle;
  final User? user;

// Const

  const BalanceCard({
    super.key,
    this.colors,
    this.title,
    this.subTitle,
    this.user,
  });

// build

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors!,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withAlpha(30),
            offset: const Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            bottom: -20,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            left: -60,
            bottom: -90,
            child: Opacity(
              opacity: 0.2,
              child: Icon(
                Ionicons.card_outline,
                color: Colors.white,
                size: 250,
              ),
            ),
          ),
          Positioned(
            right: -5,
            bottom: -40,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: -10,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${user?.name}",
                            style: AppText.headingTwo(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          user!.isVerified
                              ? const Icon(
                                  Icons.verified,
                                  color: Colors.white,
                                  size: 15,
                                )
                              : Container(),
                        ],
                      ),
                      const Icon(
                        Ionicons.card,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "$title",
                  style: AppText.headingOne(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$subTitle',
                  style: AppText.headingTwo(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
