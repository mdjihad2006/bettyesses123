import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset(
                            AppImages.profilePic,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            // controller.pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [],
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Color(0xff4D2F00),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Edit Your Profile',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Edit information you provided about yourself. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
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
                            'Write New Name',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.firstNameController,
                            decoration: InputDecoration(
                              hintText: 'Allan ',
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

                          SizedBox(height: 10.h),
                          Text(
                            'Write New Email',
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
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomOutlineButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: GradientElevatedButton(
                                  text: 'Save',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Get.toNamed(Routes.VERIFY_OTP,  arguments: {
                                      //   'email': controller.emailController.text,
                                      // });
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
