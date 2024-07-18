import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/welcome.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';

class Success extends StatelessWidget {
// const
  const Success({super.key});

// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Image.asset(
                  'images/success.png',
                  width: 300,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "All Done!",
                style: AppText.headingOne(color: AppColors.primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Dear Customer, you have successfully recharged the +971-50224432 with 50AED. You will recieve the confirmation message shortly.",
                style: AppText.body(color: AppColors.dark.withAlpha(180)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              GradientButton(
                onPressed: () {
                  Get.offAll(Welcome());
                },
                colors: const [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
                child: const Text("Take Me Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
