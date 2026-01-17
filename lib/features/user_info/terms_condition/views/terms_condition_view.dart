import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/terms_condition_controller.dart';

class TermsConditionView extends GetView<TermsConditionController> {
  const TermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            AppAppbar(title: 'Terms & Condition'),
            SizedBox(height: 20.h),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.termsList.isEmpty) {
                  return const Center(
                    child: Text('No Terms & Conditions found'),
                  );
                }

                return ListView.builder(
                  itemCount: controller.termsList.length,
                  itemBuilder: (context, index) {
                    final term = controller.termsList[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          Text(
                            '${term.policyNumber}. ${term.title}',
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          /// Features
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: term.features
                                .map(
                                  (feature) => Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  '• $feature',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

