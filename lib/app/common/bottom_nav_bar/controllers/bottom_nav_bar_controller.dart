import 'package:bettyesses123/features/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

class BottomnavbarController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize NotificationController
    Get.put(NotificationController());
  }

  /// Safely change index
  void changeIndex(int index, {required int maxLength}) {
    if (index >= 0 && index < maxLength) {
      selectedIndex.value = index;
    }
  }
}
