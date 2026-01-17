import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookFlowController extends GetxController {
  List<BookTemplate>? data;
  final networkCaller = NetworkCaller();
  final bookTemplateResponse = Rxn<BookTemplateResponse>();
  final searchController = TextEditingController();

  void setData(List<BookTemplate> newData) {
    data = newData;
    update();
    getAllBooks();
  }



  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      data = args['data'] as List<BookTemplate>?;
    }
  }


  Future<void> getAllBooks({String searchTerm = ''}) async {
    final url = searchTerm.isEmpty
        ? AppUrls.getAllBookTemp
        : '${AppUrls.getAllBookTemp}?searchTerm=$searchTerm';

    final response = await networkCaller.getRequest(url: url);

    if (response.isSuccess) {
      final res = BookTemplateResponse.fromJson(response.responseData!);
      data = res.data;
      update();
    }
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
