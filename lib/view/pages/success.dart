import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppText.mainTitle(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withAlpha(50),
                ),
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withAlpha(30),
                    ),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withAlpha(30),
                        ),
                        child: const Center(
                          child: Icon(
                            Ionicons.checkmark_done,
                            color: AppColors.primaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Recharge Successfull!",
                style: AppText.headingOne(color: AppColors.primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Dear Customer, you have successfully recharged the +971-50224432 with 50AED. You will recieve the confirmation message shortly",
                style: AppText.body(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
