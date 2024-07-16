import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: Text(
          "Home",
          style: AppText.mainTitle(),
        ),
        elevation: 0.5,
        backgroundColor: AppColors.light,
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
          currentIndex: _tabController.selectedIndex.value,
          onTap: (index) => _tabController.changeTabIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(NumpadPage());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
