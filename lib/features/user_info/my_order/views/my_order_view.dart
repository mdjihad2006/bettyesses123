import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/my_order_controller.dart';

class MyOrderView extends GetView<MyOrderController> {
  const MyOrderView({super.key});
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
              AppAppbar(title: 'My Order'),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Ongoing Orders',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _cartCard(),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),

              Row(
                children: [
                  Text(
                    'Completed Orders',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _completeCard(),
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

  Widget _buttonSet() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlineButton(
              onPressed: () {},
              child: Text('Cancel Order', style: TextStyle(color: Colors.blue)),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: GradientElevatedButton(
              text: 'Track Order ',
              onPressed: () {
                Get.toNamed(Routes.ORDER_DETAILS);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  AppImages.myOrderPic,
                  width: 100.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tales of Afiya',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text('Name: Rakib'),
                    SizedBox(height: 5),
                    Text('Status: Shipped'),
                    SizedBox(height: 5),
                    Text('Order ID: #3472234'),
                    SizedBox(height: 5),
                    Text('Order Date: 10-12-2025'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _buttonSet(),
        ],
      ),
    );
  }

  Widget _completeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  AppImages.myOrderPic,
                  width: 100.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tales of Afiya',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text('Name: Rakib'),
                    SizedBox(height: 5),
                    Text('Status: Shipped'),
                    SizedBox(height: 5),
                    Text('Order ID: #3472234'),
                    SizedBox(height: 5),
                    Text('Order Date: 10-12-2025'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomOutlineButton(
            onPressed: () {
              Get.toNamed(Routes.ORDER_DETAILS);
            },
            child: Text('View Details', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
