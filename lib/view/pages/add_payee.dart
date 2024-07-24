import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/model/payee.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/widgets/gradient_button.dart';

class CreatePayee extends StatelessWidget {
  final PayeeController payeeController = Get.put(PayeeController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final RxBool activated = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Payee',
          style: AppText.mainTitle(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.dark.withAlpha(50),
                blurRadius: 5,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.fromLTRB(15, 25, 15, 40),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Ionicons.person_add_outline,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    } else if (value.length > 20) {
                      return 'Name must be 20 characters or less';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: AppText.body(),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "+971",
                        style: AppText.body(),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          hintStyle: AppText.body(),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  final newPayee = Payee(
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                  if (nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty) {
                    if (nameController.text.length <= 20 &&
                        payeeController.payees.length < 5) {
                      payeeController.addPayee(newPayee);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Payee limit reached or nickname too long',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.primaryColor,
                        colorText: AppColors.light,
                        margin: const EdgeInsets.all(10),
                        borderRadius: 8,
                      );
                    }
                  } else {
                    Get.snackbar(
                      'Error',
                      'Name and phone number both are required',
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.light,
                      margin: const EdgeInsets.all(10),
                      borderRadius: 8,
                    );
                  }
                },
                colors: const [
                  AppColors.primaryColor,
                  AppColors.secondaryColor
                ],
                child: Text(
                  "Create Payee",
                  style: AppText.body(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
