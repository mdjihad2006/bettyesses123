import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/common/widgets/image_picker.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UploadPhotoController extends GetxController {
  final networkCaller = NetworkCaller();
  final ImagePickerController imagePickerController =
  Get.find<ImagePickerController>();

  String templateId = '';

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments ?? {};
    templateId = args["templateId"] ?? '';
  }

  Future<void> uploadPhoto() async {
    final imageFile = imagePickerController.selectedImage.value;

    if (imageFile == null) {
      Get.snackbar("Error", "Please select an image first");
      return;
    }

    final response = await networkCaller.patchRequest(
      url: AppUrls.uploadChildImg(templateId),
      body: {
        "photoUrl": imageFile,
      },
    );

    if (response.isSuccess) {
      Get.toNamed(Routes.BOOK_PREVIEW);
    } else {
      Get.snackbar("Error", response.errorMessage);
    }
  }
}
