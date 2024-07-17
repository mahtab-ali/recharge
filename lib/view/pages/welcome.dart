import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recharge_app/controller/tab_ctrl.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';
import 'package:recharge_app/view/pages/history.dart';
import 'package:recharge_app/view/pages/home.dart';

class Welcome extends StatelessWidget {
  // Props

  Welcome({super.key});

  // Props
  final TabPageController _tabController = Get.put(TabPageController());

  // Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            _tabController.selectedIndex.value == 0 ? "Home" : "History",
            style: AppText.mainTitle(),
          );
        }),
        elevation: 0,
      ),
      body: Obx(() {
        return IndexedStack(
          index: _tabController.selectedIndex.value,
          children: const [
            Home(),
            History(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          currentIndex: _tabController.selectedIndex.value,
          onTap: (index) => _tabController.changeTabIndex(index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: 'Home',
              activeIcon: Icon(
                Ionicons.home,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.arrow_undo_outline,
              ),
              label: 'History',
              activeIcon: Icon(
                Ionicons.arrow_undo,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // Get.to(NumpadPage());
        },
        child: const Icon(
          Ionicons.card,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
