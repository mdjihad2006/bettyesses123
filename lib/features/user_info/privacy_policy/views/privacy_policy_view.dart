import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/privacy_policy_controller.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            AppAppbar(title: 'Privacy Policy'),
            SizedBox(height: 20.h),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.privacyPolicyList.isEmpty) {
                  return const Center(child: Text('No Privacy Policy Found'));
                }

                return ListView.builder(
                  itemCount: controller.privacyPolicyList.length,
                  itemBuilder: (context, index) {
                    final policy =
                    controller.privacyPolicyList[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${policy.policyNumber}. ${policy.title}',
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          ...policy.features.map(
                                (f) => Padding(
                              padding: EdgeInsets.only(bottom: 6.h),
                              child: Text('• $f',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
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
