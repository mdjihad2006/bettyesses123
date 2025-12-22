import 'package:get/get.dart';

class BottomnavbarController extends GetxController {
  var selectedIndex = 0.obs;

  /// Safely change index
  void changeIndex(int index, {required int maxLength}) {
    if (index >= 0 && index < maxLength) {
      selectedIndex.value = index;
    }
  }
}
