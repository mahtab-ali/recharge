import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/controller/recharge_ctrl.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/success.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';

class Recharge extends StatelessWidget {
// Props
  final RechargeController controller = Get.put(RechargeController());

  final List<String> rechargeValues = [
    '5 AED',
    '10 AED',
    '20 AED',
    '30 AED',
    '50 AED',
    '75 AED',
    '100 AED',
    '150 AED',
    '200 AED',
  ];

// const
  Recharge({super.key});

// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recharge",
          style: AppText.mainTitle(),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Balance",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "3000 AED",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: rechargeValues.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.selectBox(index),
                  child: Obx(() {
                    bool isSelected = controller.selectedIndex.value == index;
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isSelected
                              ? [
                                  AppColors.primaryColor,
                                  AppColors.secondaryColor
                                ]
                              : [
                                  Colors.white,
                                  Colors.white
                                ], // Replace with your colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.dark.withAlpha(30),
                            offset: const Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        rechargeValues[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: GradientButton(
                    onPressed: () {
                      Get.to(
                        const Success(),
                        preventDuplicates: true,
                        fullscreenDialog: true,
                      );
                    },
                    colors: const [
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ],
                    child: const Text(
                      "Recharge Now",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: AppText.body(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
