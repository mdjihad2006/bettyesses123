import 'package:bettyesses123/app/common/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:bettyesses123/features/home/book_flow/controllers/book_flow_controller.dart';
import 'package:bettyesses123/features/home/home/controllers/home_controller.dart';
import 'package:bettyesses123/features/home/menu/controllers/menu_controller.dart';
import 'package:get/get.dart';

class BottomnavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomnavbarController(), permanent: true);
    Get.put(MyMenuController(), permanent: true);
    Get.lazyPut<BottomnavbarController>(() => BottomnavbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BookFlowController>(() => BookFlowController());
    // Get.put<MyMenuController>(() => MyMenuController(),  permanent: true);
  }
}
