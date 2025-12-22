import 'package:get/get.dart';

import '../controllers/book_preview_controller.dart';

class BookPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookPreviewController>(
      () => BookPreviewController(),
    );
  }
}
