import 'package:get/get.dart';

import '../controllers/upload_photo_controller.dart';

class UploadPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPhotoController>(
      () => UploadPhotoController(),
    );
  }
}
