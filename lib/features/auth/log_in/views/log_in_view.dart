import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/common/widgets/pic_text.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    final controller = Get.put(LogInController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppAppbar(),
                SizedBox(height: 20.h),
                PicText(title: 'Log In To Your Account'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: CustomTextStyles.t16(
                          weight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                      Text(
                        'Password',
                        style: CustomTextStyles.t16(
                          weight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 7.h),

                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          obscureText:
                              passwordController.isPasswordHidden.value,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                color: Colors.black54,
                                passwordController.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                passwordController.togglePasswordVisibility();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              'Forget Password',
                              style: TextStyle(fontSize: 17, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      GradientElevatedButton(
                        text: "Login",
                        onPressed: () {
                          controller.selectOption('email');
                          Get.toNamed(Routes.OTP_VERIFICATION);
                        },
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'If you don’t have any account please?  ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.SIGN_UP);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 70.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),

                          SizedBox(
                            height: 20, // divider height
                            child: VerticalDivider(
                              color: Colors.black87,
                              thickness: 2,
                            ),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Terms of service',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
