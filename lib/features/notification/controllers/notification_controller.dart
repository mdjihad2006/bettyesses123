import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:get/get.dart';
import 'package:bettyesses123/app/common/network_service/network_service.dart';

import '../models/notification_models.dart';

class NotificationController extends GetxController {
  final RxList<NotificationData> notifications = <NotificationData>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final RxInt currentPage = 1.obs;
  final RxInt totalPages = 1.obs;
  final RxInt total = 0.obs;
  final RxInt unreadCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications({int page = 1, int limit = 10}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await NetworkCaller().getRequest(
        url: '${AppUrls.getNotification}?page=$page&limit=$limit',
      );

      if (response.isSuccess && response.responseData != null) {
        final notificationResponse = NotificationResponse.fromJson(response.responseData!);

        notifications.value = notificationResponse.data;
        currentPage.value = notificationResponse.meta.page;
        totalPages.value = notificationResponse.meta.totalPage;
        total.value = notificationResponse.meta.total;

        // Calculate unread count
        unreadCount.value = notifications.where((n) => !n.isRead).length;

        print('📬 Loaded ${notifications.length} notifications');
        print('🔔 Unread: ${unreadCount.value}');
      } else {
        errorMessage.value = response.errorMessage;
        print('❌ Error: ${errorMessage.value}');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      print('❌ Notification fetch error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshNotifications() async {
    await fetchNotifications(page: 1);
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      // final response = await NetworkCaller().postRequest(
      //   '${AppUrls.markNotificationRead}/$notificationId',
      //   {},
      // );

      // For now, just update locally
      final index = notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        notifications[index] = notifications[index].copyWith(isRead: true);
        notifications.refresh();


        unreadCount.value = notifications.where((n) => !n.isRead).length;
      }
    } catch (e) {
      print('❌ Mark as read error: $e');
    }
  }

  String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y';
    }
  }
}