import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(title: 'Change Password'),
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 14.h),
                          Text(
                            'New Password',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),

                          Obx(
                                () => TextFormField(
                              controller: controller.newPasswordController,
                              obscureText:
                              controller.passwordVisible.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
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
                                        .togglePasswordVisibility();
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

                          Text(
                            'Confirm Password',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),

                          Obx(
                                () => TextFormField(
                              controller: controller.confirmPasswordController,
                              obscureText:
                              controller.confirmPasswordVisible.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: Colors.black54,
                                    controller.confirmPasswordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    controller
                                        .toggleConfirmPasswordVisibility();
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

                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomOutlineButton(
                                  onPressed: () {
                                    Get.offAllNamed(Routes.LOG_IN);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Obx(
                                      () => GestureDetector(
                                    onTap: () {
                                      print("Save");
                                      controller.savePassword();
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
                                          'Save',
                                          style: CustomTextStyles.t16(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
