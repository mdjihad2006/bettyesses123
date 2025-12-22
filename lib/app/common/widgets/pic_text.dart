import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/common/widgets/custom_text_style.dart';

class PicText extends StatelessWidget {
  final String title;
  final String? subtitle;
  const PicText({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 17.h),
        Image.asset(
          AppImages.logo,
          height: 140.h,
          width: 140.w,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 15.h),
        Text(
          title,
          style: TextStyle(fontSize: 30.sp,  fontWeight: FontWeight.w300,color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 7.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Text(
            subtitle??'',
            textAlign: TextAlign.center,
            style: CustomTextStyles.t16(
              weight: FontWeight.w500,
              color: const Color(0xFF6E6E6E),
            ),
          ),
        ),
      ],
    );
  }
}
