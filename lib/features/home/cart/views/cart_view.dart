import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/notification/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Obx(() {

                    final notificationController = Get.isRegistered<NotificationController>()
                        ? Get.find<NotificationController>()
                        : Get.put(NotificationController());

                    final count = notificationController.unreadCount.value;

                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          icon: const Icon(Icons.notifications_none, size: 33),
                        ),
                        if (count > 0)
                          Positioned(
                            right: 5,
                            top: 4,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  count > 99 ? '99+' : '$count',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  })
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Story Books',
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _cartCard(),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomOutlineButton(
                              onPressed: () {},
                              child: Text(
                                'Add more books',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GradientElevatedButton(
                              text: 'Continue ',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
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

  Widget _cartCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF7B61FF)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.asset(
              AppImages.bookFront,
              width: 100.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'The adventure of Rakib to the amazon jungle',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text('Name: Rakib   Age: 11'),
                Text('Price: €30.00'),
                SizedBox(height: 4),
                Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xFF7B61FF),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
