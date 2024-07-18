import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';

typedef VoidCallback = void Function();

class PayeeCard extends StatelessWidget {
  final Color? color;
  final Payee? payee;
  final VoidCallback? onPressed;

  const PayeeCard({
    super.key,
    this.color,
    this.payee,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withAlpha(30),
            offset: const Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            _buildGradientCircle(left: -40, top: -20),
            _buildGradientCircle(left: -5, top: -40),
            _buildGradientCircle(right: -30, bottom: -30),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIcon(),
                  const SizedBox(height: 15),
                  Text(
                    "${payee?.name}",
                    style: AppText.headingTwo(color: AppColors.dark),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${payee?.phone}",
                    style: AppText.body(color: AppColors.dark),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  GradientButton(
                    onPressed: onPressed!,
                    colors: const [
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ],
                    child: const Text("Recharge"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCircle(
      {double? left, double? top, double? right, double? bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: 0.2,
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(
        Ionicons.person_outline,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
