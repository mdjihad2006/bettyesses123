import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final networkCaller = NetworkCaller();
  final bookTemplateResponse = Rxn<BookTemplateResponse>();

  @override
  void onInit() {
    super.onInit();
    _allBookTemp();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _allBookTemp() async {
    final response = await networkCaller.getRequest(
      url: AppUrls.getAllBookTemp,
    );

    if (response.isSuccess) {
      bookTemplateResponse.value = BookTemplateResponse.fromJson(
        response.responseData!,
      );
    }
  }

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
