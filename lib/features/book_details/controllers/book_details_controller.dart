import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController {
   BookTemplate? book;

  @override
  void onInit() {
    super.onInit();
    book = Get.arguments as BookTemplate;
    print('Book title: ${book?.title}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
