import 'package:get/get.dart';

import '../controllers/book_flow_controller.dart';

class BookFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookFlowController>(
      () => BookFlowController(),
    );
  }
}
