import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
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
              AppAppbar(title: 'Order Details'),
              SizedBox(height: 20.h),
              _cartCard(),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.box),
                      SizedBox(width: 12.w),
                      Text(
                        'Order Processed',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset(AppImages.giftBox),
                      SizedBox(width: 12.w),
                      Text(
                        'Order Shipped',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset(AppImages.truck),
                      SizedBox(width: 12.w),
                      Text(
                        'Order En Route',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset(AppImages.parsel),
                      SizedBox(width: 12.w),
                      Text(
                        'Order Arrived',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Customer Name: ',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Book Name:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Age:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Book Quantality:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Order ID: ',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Order Date',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Payment:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Status:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Delivery Address:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 7),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Rakib',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Tales of Afiya',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '  #3472234',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '10-12-2025',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      ' Successful',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Shipped',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      ' Dhaka, Bangladesh',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
