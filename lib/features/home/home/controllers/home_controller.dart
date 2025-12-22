import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final List<String> allImages = [
    'assets/images/book_image.png',
    'assets/images/app_image2.png',
    'assets/images/app_image3.png',
    'assets/images/app_image4.png',
    'assets/images/app_image5.png',
    'assets/images/app_image6.png',
  ];

  final List<String> recentImages = [
    'assets/images/app_image5.png',
    'assets/images/app_image6.png',
    'assets/images/app_image3.png',
    'assets/images/app_image4.png',
  ];
}
