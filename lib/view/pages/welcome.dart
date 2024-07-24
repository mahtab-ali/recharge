import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/controller/payee_ctrl.dart';
import 'package:recharge_app/controller/tab_ctrl.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/add_payee.dart';
import 'package:recharge_app/view/pages/history.dart';
import 'package:recharge_app/view/pages/home.dart';

class Welcome extends StatelessWidget {
  // Props

  Welcome({super.key});

  // Props
  final TabPageController _tabController = Get.put(TabPageController());
  final PayeeController payeeController = Get.find();

  // Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(() {
          return Text(
            _tabController.selectedIndex.value == 0 ? "Home" : "History",
            style: AppText.mainTitle(),
          );
        }),
      ),
      body: Obx(() {
        return IndexedStack(
          index: _tabController.selectedIndex.value,
          children: [
            Home(),
            History(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 5,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: _tabController.selectedIndex.value,
          onTap: (index) => _tabController.changeTabIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppText.body(),
          unselectedLabelStyle: AppText.body(),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.repeat_outline,
              ),
              label: 'History',
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          if (payeeController.payees.length == 5) {
            Get.snackbar(
              'Error',
              'You can add only 5 payees at the moment',
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.light,
            );
          } else {
            Get.to(() => CreatePayee());
          }
        },
        child: const Icon(
          Ionicons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
