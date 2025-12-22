import 'package:get/get.dart';

import '../controllers/personalize_book_controller.dart';

class PersonalizeBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalizeBookController>(
      () => PersonalizeBookController(),
    );
  }
}
