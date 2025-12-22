import 'package:get/get.dart';

import '../controllers/promo_code_controller.dart';

class PromoCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromoCodeController>(
      () => PromoCodeController(),
    );
  }
}
