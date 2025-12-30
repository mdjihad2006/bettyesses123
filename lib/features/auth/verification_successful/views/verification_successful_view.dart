import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/pic_text.dart';
import 'package:bettyesses123/app/common/widgets/title_and_sub.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/verification_successful_controller.dart';

class VerificationSuccessfulView
    extends GetView<VerificationSuccessfulController> {
  const VerificationSuccessfulView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.BottomNavBar);
    });
     return Scaffold(
       backgroundColor: const Color(0xFFF6F6F6),
       body: Padding(
         padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset(AppImages.newImage,height: 160,width: 160,fit: BoxFit.cover,),
               SizedBox(height: 22.h),
               Image.asset(AppImages.right,height: 100,width: 100,fit: BoxFit.contain,),
               SizedBox(height: 22.h),
               Text('Sign In Successful',style: TextStyle(fontSize: 33,color: Colors.black87,fontWeight: FontWeight.w600),),
               SizedBox(height: 10.h),
               Text('Your password has been updated',style: TextStyle(fontSize: 17,color: Colors.black54,fontWeight: FontWeight.w500)),
             ],
           ),
         ),
       ),
     );
  }
}
