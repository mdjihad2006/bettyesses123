import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:get/get.dart';

class BookFlowController extends GetxController {
  List<BookTemplate>? data;

  void setData(List<BookTemplate> newData) {
    data = newData;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      data = args['data'] as List<BookTemplate>?;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final List<String> allImages = [
    'assets/images/book_image.png',
    'assets/images/app_image2.png',
    'assets/images/app_image3.png',
    'assets/images/app_image4.png',
    'assets/images/app_image5.png',
    'assets/images/app_image6.png',
    'assets/images/book_image.png',
    'assets/images/app_image2.png',
    'assets/images/app_image3.png',
    'assets/images/app_image4.png',
    'assets/images/app_image5.png',
    'assets/images/app_image6.png',
  ];
}
