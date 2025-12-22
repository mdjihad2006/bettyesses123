import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart'
    show CustomTextStyles;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
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
                            'Current Password',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),

                          Obx(
                            () => TextFormField(
                              controller: controller.currentPasswordController,
                              obscureText:
                                  controller.isCurrentPasswordHidden.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: Colors.black54,
                                    controller.isCurrentPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    controller
                                        .toggleCurrentPasswordVisibility(); // fixed here
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
                            'New Password',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),

                          Obx(
                            () => TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.isSetPasswordHidden.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: Colors.black54,
                                    controller.isSetPasswordHidden.value
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
                              controller: controller.newPasswordController,
                              obscureText:
                                  controller.isSetNewPasswordHidden.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: Colors.black54,
                                    controller.isSetNewPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    controller
                                        .toggleNewPasswordVisibility(); // fixed here
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
                                  onPressed: () {},
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: GradientElevatedButton(
                                  text: 'Save',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // Get.toNamed(Routes.AUTH_SELECTION);
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Please fill all the fields',
                                      );
                                    }
                                  },
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
