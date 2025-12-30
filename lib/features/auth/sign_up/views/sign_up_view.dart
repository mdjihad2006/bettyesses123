import 'package:bettyesses123/app/common/core/const/app_color.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/common/widgets/pic_text.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(),
              PicText(title: 'Create Your Account'),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            hintText: 'Type your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 14.h),

                        Text(
                          'Last Name',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          controller: controller.lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Type your last name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Email',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            hintText: 'Type your email',
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
                        SizedBox(height: 14.h),
                        Text(
                          'Set Password',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),

                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.passwordVisible.value,
                            decoration: InputDecoration(
                              hintText: 'Type a password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: Colors.black54,
                                  controller.passwordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller
                                      .togglePasswordVisibility(); // fixed here
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
                        SizedBox(height: 14.h),
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
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ' terms of service and privacy policy',
                                    style: TextStyle(
                                      fontSize: 12.5.sp,
                                      color: Color(0xff6C8CFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(Routes.LOG_IN);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              print("Signing up");
                              controller.signupWithEmail();
                            },
                            child: Container(
                              height: 48.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6C8CFF),
                                    Color(0xFFCE6FFF),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Sign up',
                                        style: CustomTextStyles.t16(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Already have an account?  ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black54,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFF8B6914),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(Routes.LOG_IN);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
