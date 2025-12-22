import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(title: 'Privacy Policy',),
              SizedBox(height: 30.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Privacy Policy',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                            'Our services are not intended for users under the age required by local law to create an account.\n\nYour personal data may be stored for as long as your account is active or as required by law.\n\nBy creating an account and using the app, you agree to our Privacy Policy and consent to the collection and use of your information as described.'),
                      ]
                  ),
                  SizedBox(height: 20.h),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. Privacy Policy',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                            'Our services are not intended for users under the age required by local law to create an account.\n\nYour personal data may be stored for as long as your account is active or as required by law.\n\nBy creating an account and using the app, you agree to our Privacy Policy and consent to the collection and use of your information as described.'),
                      ]
                  ),
                  SizedBox(height: 20.h),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3. Privacy Policy',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                            'Our services are not intended for users under the age required by local law to create an account.\n'
                                '\nYour personal data may be stored for as long as your account is active or as required by law.\n'
                                '\nBy creating an account and using the app, you agree to our Privacy Policy and consent to the collection and use of your information as described.'),
                      ]
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
