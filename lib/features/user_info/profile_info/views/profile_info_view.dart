import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_info_controller.dart';

class ProfileInfoView extends GetView<ProfileInfoController> {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Obx(() => ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: controller.userImageUrl.value.isNotEmpty
                          ? Image.network(
                        controller.getFullImageUrl(),
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
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                          : Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                  )),
                  SizedBox(height: 20.h),
                  Text(
                    'Profile Information',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Profile information you provided. ',
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
                            'First name',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.firstNameController,
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Allan ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'Last name',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.lastNameController,
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'paul ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
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
                            'Email',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: 'null@gmail.com ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 30.h),
                          GradientElevatedButton(
                            text: 'Edit Information',
                            onPressed: () {
                              Get.toNamed(Routes.EDIT_PROFILE);
                            },
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