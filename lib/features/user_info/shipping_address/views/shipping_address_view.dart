import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/shipping_address_controller.dart';

class ShippingAddressView extends GetView<ShippingAddressController> {
  const ShippingAddressView({super.key});
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
              AppAppbar(title: 'Shipping Address'),
              SizedBox(height: 20.h),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _cartCard(),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
              GradientElevatedButton(
                text: 'Add New Address',
                onPressed: () {
                  Get.toNamed(Routes.ADD_ADDRESS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Home', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text('Allan Benny'),
                SizedBox(height: 5),
                Text('+084683467386'),
                SizedBox(height: 5),
                Text('270/2 Frank fruit, Germany'),
                SizedBox(height: 5),
              ],
            ),
            Spacer(),
            SizedBox(height: 5),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              padding: EdgeInsets.symmetric(horizontal: 12),
              onSelected: (value) {
                if (value == 'edit') {
                  /// Edit action
                } else if (value == 'delete') {
                  /// Delete action
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  value: 'delete',
                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    ),
  );
}
