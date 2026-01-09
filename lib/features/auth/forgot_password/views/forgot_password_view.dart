import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(),
              SizedBox(height: 30.h),
              Column(
                children: [
                  Text(
                    'Forgot Password',
                    style: CustomTextStyles.t28(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please enter your email address to receive the verification code',
                    style: CustomTextStyles.t16(
                      weight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
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
                              hintText: 'null@gmail.com ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 30.h),
                          Obx(
                                () => GestureDetector(
                              onTap: () {
                                print("Signing up");
                                controller.submit();
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

                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
