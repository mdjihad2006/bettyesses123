import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/common/widgets/pic_text.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/auth/service/google_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const AppAppbar(),
                  SizedBox(height: 20.h),
                  const PicText(title: 'Log In To Your Account'),
                  SizedBox(height: 20.h),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: CustomTextStyles.t16(
                          weight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),

                      // Password Field
                      Text(
                        'Password',
                        style: CustomTextStyles.t16(
                          weight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(
                            () => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.passwordVisible.value,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.passwordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black54,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Sign In Button
                  Obx(
                        () => GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.loginWithEmail();
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6C8CFF), Color(0xFFCE6FFF)],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'Sign In',
                          style: CustomTextStyles.t16(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),


                  Obx(
                        () => GestureDetector(
                      onTap: () {
                        final service = AuthService();
                        service.login();
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: controller.isGoogleLoading.value
                            ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: const CircularProgressIndicator(strokeWidth: 2),
                        )
                            : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppImages.googleIcon,
                              height: 24.h,
                              width: 24.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Sign in with Google',
                              style: CustomTextStyles.t16(
                                color: Colors.black87,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Sign Up Text
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(Routes.SIGN_UP),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Privacy & Terms
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.PRIVACY_POLICY);
                        },
                        child: const Text('Privacy Policy', style: TextStyle(color: Colors.black)),
                      ),
                      const VerticalDivider(
                        color: Colors.black87,
                        thickness: 1.5,
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.TERMS_CONDITION);
                        },
                        child: const Text('Terms of Service', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
