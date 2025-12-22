import 'package:bettyesses123/app/common/widgets/app_appbar.dart'
    show AppAppbar;
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
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
              ListView.builder(
                padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext, context) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffEEF2FF),
                          child: Icon(Icons.notifications_none, size: 35),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Your book is shipped',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                            Spacer(),
                            Text('2h'),
                          ],
                        ),
                        subtitle: Text(
                          'Your book is shipped. Order ID: 172477ZXY',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
