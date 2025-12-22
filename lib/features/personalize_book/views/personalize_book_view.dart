import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_text_style.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/personalize_book_controller.dart';

class PersonalizeBookView extends GetView<PersonalizeBookController> {
  const PersonalizeBookView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? selectedAddressType;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAppbar(title: 'Personalize Book'),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Child’s Name',
                      style: CustomTextStyles.t16(
                        weight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 7.h),

                    TextFormField(
                      controller: controller.cityController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.sw),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Child’s Name';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),

                        DropdownButtonFormField<String>(
                          value: selectedAddressType,
                          hint: const Text('Select age'),
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
                              value: '5 year',
                              child: Text('5 year'),
                            ),
                            DropdownMenuItem(
                              value: '6 year',
                              child: Text('6 year'),
                            ),
                            DropdownMenuItem(
                              value: '7 year',
                              child: Text('7 year'),
                            ),
                            DropdownMenuItem(
                              value: '8 year',
                              child: Text('8 year'),
                            ),
                            DropdownMenuItem(
                              value: '9 year',
                              child: Text('9 year'),
                            ),
                            DropdownMenuItem(
                              value: '10 year',
                              child: Text('10 year'),
                            ),
                            DropdownMenuItem(
                              value: '11 year',
                              child: Text('11 year'),
                            ),
                            DropdownMenuItem(
                              value: '12 year',
                              child: Text('12 year'),
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

                    SizedBox(height: 20.h),

                    Text(
                      'Select Gender',
                      style: CustomTextStyles.t16(
                        weight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 7.h),

                    GestureDetector(
                      onTap: () => _showGenderDialog(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.selectedValue.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Text(
                      'Select The Birth Month Of The Child',
                      style: CustomTextStyles.t16(
                        weight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    GestureDetector(
                      onTap: () => _showDateDialog(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.selectedDate.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const Icon(Icons.calendar_month_rounded),
                            ],
                          ),
                        ),
                      ),
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
                        SizedBox(width: 5.w),
                        Expanded(
                          child: GradientElevatedButton(
                            text: "Go To Next Step",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Get.toNamed(Routes.UPLOAD_PHOTO);
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
      ),
    );
  }

  void _showGenderDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Select Gender", style: CustomTextStyles.t18()),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: controller.options.map((item) {
            return ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
                        style: CustomTextStyles.t16(color: Colors.black54),
                      ),
                      Obx(
                        () => Icon(
                          controller.selectedValue.value == item
                              ? Icons.check
                              : null,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
              onTap: () => controller.selectGender(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showDateDialog() {
    Get.dialog(
      AlertDialog(
        title: const Center(child: Text("Select Date")),
        content: SizedBox(
          height: 350,
          width: 300,
          child: SfDateRangePicker(
            onSelectionChanged: (args) {
              controller.setDate(args.value);
            },
            selectionMode: DateRangePickerSelectionMode.single,
          ),
        ),
      ),
    );
  }
}
