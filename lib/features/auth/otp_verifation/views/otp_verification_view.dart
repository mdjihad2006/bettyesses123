import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/title_and_sub.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments?['email'];
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
        child: Column(
          children: [
            AppAppbar(),
            SizedBox(height: 40.h),

            Align(
              alignment: Alignment.centerLeft,
              child: TitleNSub(
                title: 'Confirm your verification',
                subtitle:
                'Please give us one time verification code sent to $email email address.',
              ),
            ),

            SizedBox(height: 15.h),

            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Pinput(
                    length: 6,
                    showCursor: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // only numbers
                    ],
                    onCompleted: controller.verifyOtp,

                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Something went wrong. Try again';
                      }
                      return null;
                    },

                    defaultPinTheme: PinTheme(
                      width: 55,
                      height: 60,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),

                    errorPinTheme: PinTheme(
                      width: 55,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const Spacer(),

            GradientElevatedButton(
              text: 'Verify Code',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.toNamed(Routes.VERIFICATION_SUCCESSFUL);
                } else {
                  Get.snackbar(
                    'Invalid OTP',
                    'Enter a valid OTP',
                    snackPosition: SnackPosition.TOP,
                  );
                }
              },
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

