import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:bettyesses123/features/notification/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final networkCaller = NetworkCaller();
  final bookTemplateResponse = Rxn<BookTemplateResponse>();
  final searchController = TextEditingController();

  /// ✅ Recently viewed books
  final RxList<BookTemplate> recentlyViewedBooks = <BookTemplate>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllBooks();
    Get.put(NotificationController());
  }

  Future<void> getAllBooks({String searchTerm = ''}) async {
    final url = searchTerm.isEmpty
        ? AppUrls.getAllBookTemp
        : '${AppUrls.getAllBookTemp}?searchTerm=$searchTerm';

    final response = await networkCaller.getRequest(url: url);

    if (response.isSuccess) {
      bookTemplateResponse.value =
          BookTemplateResponse.fromJson(response.responseData!);
    }
  }

  void addToRecentlyViewed(BookTemplate book) {
    // remove if already exists (avoid duplicate)
    recentlyViewedBooks.removeWhere((e) => e.id == book.id);

    // add to top
    recentlyViewedBooks.insert(0, book);


    if (recentlyViewedBooks.length > 10) {
      recentlyViewedBooks.removeLast();
    }
  }
}

