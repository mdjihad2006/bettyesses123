import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/features/user_info/profile_info/controllers/profile_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileInfoController());
    final _formKey = GlobalKey<FormState>();
    String? selectedAddressType;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(title: 'Add New Address'),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'First Name',
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
                            'Last Name',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: 'Walker',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address Type',
                                style: CustomTextStyles.t16(
                                  weight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 7.h),

                              DropdownButtonFormField<String>(
                                value: selectedAddressType,
                                hint: const Text('Select address type'),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Home',
                                    child: Text('Home'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'School',
                                    child: Text('School'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Office',
                                    child: Text('Office'),
                                  ),
                                ],
                                onChanged: (value) {
                                  selectedAddressType = value;
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select address type';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'Home',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: '270/2',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Street Address';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'Apt / Building',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: '270/2',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Apt / Building';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'City',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: 'Toronto',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter City';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'State',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: 'Toronto',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Toronto';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'Zip Code',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: '11234',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Zip Code';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            'Country',
                            style: CustomTextStyles.t16(
                              weight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              hintText: 'Canada',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Country';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20.h),
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
                                  onPressed: () {},
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
