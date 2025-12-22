import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/promo_code_controller.dart';

class PromoCodeView extends GetView<PromoCodeController> {
  const PromoCodeView({super.key});
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
              AppAppbar(title: 'Promo Codes'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      _cartCard(),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
              SizedBox(height: 30.h),
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
      color: const Color(0xFFF1F3FF),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFF7B61FF)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 130.w,
              height: 65.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  '12% Off',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Code: New 10',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text('Order over €30'),
                  SizedBox(height: 5),
                  Text('30H 25 Min left'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        GradientElevatedButton(text: 'Copy', onPressed: () {}),
      ],
    ),
  );
}
