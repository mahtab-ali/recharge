import 'package:get/get.dart';

class RechargeController extends GetxController {
  // Variable to hold the index of the selected box
  var selectedIndex = (-1).obs;

  // Function to set the selected index
  void selectBox(int index) {
    selectedIndex.value = index;
  }
}
