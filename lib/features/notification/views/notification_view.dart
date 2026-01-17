import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Stack(
              children: [
                AppAppbar(title: 'Notification'),
                Positioned(
                  top: 45,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATION_SETTINGS);
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xffEEF2FF),
                      child: const Icon(Icons.settings),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value && controller.notifications.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.errorMessage.isNotEmpty &&
                    controller.notifications.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 60, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          controller.errorMessage.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => controller.fetchNotifications(),
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.notifications.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_off,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No notifications yet',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: controller.refreshNotifications,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notifications[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: notification.isRead
                              ? Colors.white
                              : Color(0xffFFF4E6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xffEEF2FF),
                            child: Icon(
                              _getNotificationIcon(notification.type),
                              size: 28,
                              color: notification.isRead
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notification.title,
                                  style: TextStyle(
                                    fontWeight: notification.isRead
                                        ? FontWeight.w400
                                        : FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                controller.getTimeAgo(notification.createdAt),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              notification.message,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (!notification.isRead) {
                              controller.markAsRead(notification.id);
                            }
                            // Navigate based on notification type
                            if (notification.orderId != null) {
                              // TODO: Navigate to order details
                              // Get.toNamed(
                              //   Routes.ORDER_DETAILS,
                              //   arguments: notification.orderId,
                              // );
                            }
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'ORDER_STATUS':
        return Icons.local_shipping_outlined;
      case 'BOOK':
        return Icons.book_outlined;
      case 'REVIEW':
        return Icons.rate_review_outlined;
      default:
        return Icons.notifications_none;
    }
  }
}