import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAppbar(
              title: 'Book Details',
            ),
            _picSet(),
            SizedBox(height: 10.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Tales of Afiya',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Age:  0-3 years',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Category: Early Learning',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(
                  'A beautifully crafted, personalized early-learning book designed to turn your child’s first steps into a joyful and meaningful journey. Filled with gentle stories, bright illustrations, and age appropriate learning moments, it helps little learners build.',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            GradientElevatedButton(text: 'Personalize This Book', onPressed: (){
              Get.toNamed(Routes.PERSONALIZE_BOOK);
            })
          ],
        ),
      )
    );
  }

  Widget _picSet() {
    return Column(
            children: [
              SizedBox(height: 20.h,),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.asset(
                  AppImages.BDImage,
                  width: double.infinity,
                  height: 210.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        AppImages.BDImage,
                        width: 170.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        AppImages.BDImage,
                        width: 170.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
            ],
          );
  }
}
