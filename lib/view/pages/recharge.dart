import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_app/controller/recharge_ctrl.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/success.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';

class Recharge extends StatelessWidget {
  // Props
  final Payee selectedPayee;

  // Constructor
  const Recharge({super.key, required this.selectedPayee});

  @override
  Widget build(BuildContext context) {
    final RechargeController controller = Get.find();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Current Balance",
                  style: TextStyle(fontSize: 18.0),
                ),
                Obx(
                  () => Text(
                    "${controller.creditController.availableCredit}",
                    style: AppText.headingOne(),
                  ),
                ),
                const SizedBox(height: 25),
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
              itemCount: controller.rechargeValues.length,
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
                              : [Colors.white, Colors.white],
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
                        "${controller.rechargeValues[index].toString()} AED",
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
                      if (controller.selectedIndex.value != -1) {
                        controller.doRecharge(controller.selectedIndex.value);
                        Get.off(
                          () => Success(
                            amount: controller.selectedAmount.value.toString(),
                            phoneNumber: controller.selectedPayee!.phone,
                          ),
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please select an amount to recharge.',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    colors: const [
                      AppColors.primaryColor,
                      AppColors.secondaryColor
                    ],
                    child: const Text(
                      "Recharge Now",
                      style: TextStyle(color: Colors.white),
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
