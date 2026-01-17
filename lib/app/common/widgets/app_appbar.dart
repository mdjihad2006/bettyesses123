import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppAppbar extends StatelessWidget {
  final String? title;
  const AppAppbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 45.h, left: 14.w,),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),

          // Title (center)
          Text(
            title ?? '',
            style: TextStyle(fontSize: 21.sp,fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,

          ),
        ],
      ),
    );
  }
}

