import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/address_details_controller.dart';

class AddressDetailsView extends GetView<AddressDetailsController> {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Get.put(AddressDetailsController());
    controller.setStep(2);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppAppbar(title: 'Cart & Order Summary'),
                SizedBox(height: 20.h),
                Obx(() => StepIndicator(step: controller.currentStep.value)),
                SizedBox(height: 20.h),

                // Contact Section
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),

                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                Text(
                  'The Email will be used to keep you informed about your order status.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 20.h),

                // Delivery Section
                Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),

                TextFormField(
                  controller: controller.countryController,
                  decoration: InputDecoration(
                    hintText: 'Country / region',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.firstNameController,
                        decoration: InputDecoration(
                          hintText: 'First name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextFormField(
                        controller: controller.lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Last name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                TextFormField(
                  controller: controller.streetAddressController,
                  decoration: InputDecoration(
                    hintText: 'Street address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your street address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                TextFormField(
                  controller: controller.streetAddress2Controller,
                  decoration: InputDecoration(
                    hintText: 'Apartment, suite, etc. (optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: controller.cityController,
                        decoration: InputDecoration(
                          hintText: 'City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: Obx(() => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'State',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        initialValue: controller.selectedState.value.isEmpty
                            ? null
                            : controller.selectedState.value,
                        items: controller.states
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.setSelectedState(newValue);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      )),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: controller.postalCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'ZIP',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          if (value.length != 5) {
                            return 'Invalid';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

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
                    Expanded(
                      child: Text('Save this information for next time'),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                Text(
                  'Order Summary',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                SizedBox(height: 13.h),

                _orderSummary(),
                SizedBox(height: 20.h),

                _continueButton(formKey),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _orderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF6C8CFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),

          _priceRow('Book 1', '€30.00'),
          _priceRow('Book 2', '€30.00'),

          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Promo Code',
                    suffix: InkWell(
                      onTap: () {
                        // Apply promo code logic
                      },
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Divider(height: 30.h),

          _priceRow(
            'Total',
            '€50.00',
            isBold: true,
            color: const Color(0xFF7B61FF),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
      String title,
      String price, {
        bool isBold = false,
        Color? color,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueButton(GlobalKey<FormState> formKey) {
    return Obx(() => controller.isLoading.value
        ? Center(
      child: CircularProgressIndicator(),
    )
        : GradientElevatedButton(
      text: 'Save Preview & Continue to Payment',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          controller.submitOrder();
        } else {
          Get.snackbar(
            'Validation Error',
            'Please fill all required fields correctly',
            backgroundColor: Colors.orange,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
        }
      },
    ));
  }
}