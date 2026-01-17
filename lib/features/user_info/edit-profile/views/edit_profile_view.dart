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
    final formKey = GlobalKey<FormState>();

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
                      Obx(
                            () => ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: controller.selectedImage.value != null
                                ? Image.file(
                              controller.selectedImage.value!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            )
                                : (controller.menuController.userData.value?.image != null
                                ? Image.network(
                              controller.getFullImageUrl(
                                  controller.menuController.userData.value!.image),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey[600],
                                );
                              },
                            )
                                : Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Obx(
                              () => InkWell(
                            onTap: controller.isImageUploading.value
                                ? null
                                : () async {
                              await controller.pickFromGallery();

                              if (controller.selectedImage.value != null) {
                                controller.uploadProfileImage();
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: controller.isImageUploading.value
                                  ? Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff4D2F00),
                                  ),
                                ),
                              )
                                  : Icon(
                                Icons.camera_alt,
                                color: Color(0xff4D2F00),
                                size: 18,
                              ),
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
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Write New First Name',
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
                            'Write New Last name',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.lastNameController,
                            decoration: InputDecoration(
                              hintText: 'paul ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter last name';
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
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: GradientElevatedButton(
                                  text: 'Save',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      controller.updateProfile();
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