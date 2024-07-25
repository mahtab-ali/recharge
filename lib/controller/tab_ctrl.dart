import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabPageController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    cleanSharedPreferences();
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> cleanSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
