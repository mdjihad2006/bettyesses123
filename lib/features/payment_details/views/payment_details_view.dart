import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart' show GradientElevatedButton;
import 'package:bettyesses123/app/common/widgets/step_indicator.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {
  const PaymentDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Get.put(PaymentDetailsController());
    controller.setStep(3);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppAppbar(title: 'Cart & Order Summary'),
                SizedBox(height: 20.h),
                Obx(() => StepIndicator(step: controller.currentStep.value)),
                SizedBox(height: 20.h),
                Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10.h),

                Obx(
                      () => Column(
                    children: [
                      paymentMethodCard(
                        index: 0,
                        selectedIndex: controller.selectedIndex.value,
                        icon: Icons.circle_outlined,
                        title: Image.asset(AppImages.stripe),
                        onTap: () => controller.select(0),
                      ),
                      SizedBox(height: 12.h),
                      paymentMethodCard(
                        index: 1,
                        selectedIndex: controller.selectedIndex.value,
                        icon: Icons.circle_outlined,
                        title: Text('Card',),
                        onTap: () => controller.select(1),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text('All transactions are secured and encrypted',),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Card number',
                    suffix: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Street adress',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: ' MM/YY',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Security code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),


                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.toggleRememberMe(value!);
                        },
                      ),
                    ),
                    Text('Save this information for next time'),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Order Summary',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),

                SizedBox(height: 13.h),

                _orderSummary(),

                SizedBox(height: 20.h),

                _continueButton(),

                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
        Get.toNamed(Routes.PAYMENT_SUCCESS);
      },
    );
  }

  Widget paymentMethodCard({
    required int index,
    required int selectedIndex,
    required IconData icon,
    required Widget title,
    required VoidCallback onTap,
  }) {
    final bool isSelected = index == selectedIndex;

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEDEAFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7B61FF)
                : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20.r,
              width: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF7B61FF)
                    : Colors.grey.shade200,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(width: 12.w),
            title,
          ],
        ),
      ),
    );
  }

}
