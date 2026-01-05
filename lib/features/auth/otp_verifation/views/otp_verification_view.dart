import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/common/widgets/title_and_sub.dart';
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
    final controller = Get.put(OtpVerificationController());
    final args = Get.arguments ?? {};
    controller.userId = args['id'] ?? '';
    controller.email = args['email'] ?? '';
    controller.isFromForgotPassword = args['isFromForgotPassword'] ?? false;
    print('hello${controller.isFromForgotPassword}');
    print("my id is here${controller.userId}");

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppAppbar(),
              SizedBox(height: 40.h),
              TitleNSub(
                title: 'Confirm your verification',
                subtitle:
                    'Please enter the 6-digit verification code sent to ${controller.email} email address.',
              ),
              SizedBox(height: 20.h),

              // OTP input
              Pinput(
                controller: controller.otpController,
                length: 6,
                showCursor: true,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  controller.otp.value = value;
                  controller.isOtpValid.value = true;
                },
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Enter a valid OTP';
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

              SizedBox(height: 30.h),

              Obx(
                () => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : controller.verifyOtp,
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C8CFF), Color(0xFFCE6FFF)],
                      ),
                    ),
                    child: Center(
                      child: controller.isLoading.value
                          ? SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Verify OTP',
                              style: CustomTextStyles.t16(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive OTP? ",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    controller.canResend.value
                        ? GestureDetector(
                            onTap: controller.resendOtp,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6C8CFF),
                              ),
                            ),
                          )
                        : Text(
                            "Resend in ${controller.secondsLeft.value}s",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
