import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookPreviewController extends GetxController {
  //TODO: Implement BookPreviewController

}
class ImageSliderController extends GetxController {
  late List<PageController> pageControllers;
  late List<RxInt> currentIndexes;

  final List<String> images = [
    AppImages.bookFront,
    AppImages.appImage2,
    AppImages.bookFront,
  ];

  final int pageCount = 5;

  @override
  void onInit() {
    pageControllers =
        List.generate(pageCount, (_) => PageController());
    currentIndexes =
        List.generate(pageCount, (_) => 0.obs);
    super.onInit();
  }

  void next(int pageIndex) {
    if (currentIndexes[pageIndex].value < images.length - 1) {
      pageControllers[pageIndex].nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    for (final c in pageControllers) {
      c.dispose();
    }
    super.onClose();
  }
}

