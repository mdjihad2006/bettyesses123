import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_settings_controller.dart';

class NotificationSettingsView extends GetView<NotificationSettingsController> {
  const NotificationSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationSettingsController());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(title: 'Notification..'),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Push Notification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Obx(() {
                      return Switch(
                        value: controller.isPushNotification.value,
                        onChanged: (value) {
                          controller.isPushNotification.value = value;
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
