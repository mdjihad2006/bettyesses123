import 'package:bettyesses123/app/common/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BottomnavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavbarController>(
          () => BottomnavbarController(),
    );
  }
}
