import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/step_indicator.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/cart_order_controller.dart';

class CartOrderView extends GetView<CartOrderController> {
  const CartOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartOrderController());
    controller.setStep(1);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppAppbar(title: 'Cart & Order Summary'),
              SizedBox(height: 20.h),

              Obx(() => StepIndicator(step: controller.currentStep.value)),
              SizedBox(height: 20.h),
              Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              _cartCard(),
              SizedBox(height: 16.h),

              _addMoreBook(),
              SizedBox(height: 20.h),

              Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),

              SizedBox(height: 13.h),

              _orderSummary(),

              SizedBox(height: 25.h),

              _continueButton(),

              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }

  // CART CARD

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

  // ADD BOOK

  Widget _addMoreBook() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF6C8CFF)),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Add personalized books',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF6C8CFF)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Add more personalized books',
                  style: TextStyle(color: Color(0xFF6C8CFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ORDER SUMMARY

  Widget _orderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF6C8CFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),

          _priceRow('Book 1', '€30.00'),
          _priceRow('Book 2', '€30.00'),

          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Code',
                    suffix: InkWell(child: Text('Apply')),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Divider(height: 30.h),

          _priceRow(
            'Total',
            '€50.00',
            isBold: true,
            color: const Color(0xFF7B61FF),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    String price, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // BUTTON

  Widget _continueButton() {
    return GradientElevatedButton(
      text: 'Save Preview & Continue to Payment',
      onPressed: () {
        Get.toNamed(Routes.ADDRESS_DETAILS);
      },
    );
  }
}
