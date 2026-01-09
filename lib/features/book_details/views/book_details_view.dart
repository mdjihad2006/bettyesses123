import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/home/home/model/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  BookDetailsView({super.key});
  BookTemplate? book;

  @override
  Widget build(BuildContext context) {
    book = Get.arguments;
    print('Book title: ${book?.title}');

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAppbar(title: 'Book Details'),
            _picSet(),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book?.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  book?.ageRange??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Category: ${book?.category??'Not Specified'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  book?.description ?? '',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Spacer(),
            GradientElevatedButton(
              text: 'Personalize This Book',
              onPressed: () {
                Get.toNamed(Routes.PERSONALIZE_BOOK,arguments: {"templateId":book?.id});
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _picSet() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: book?.coverImage ?? '',
            width: double.infinity,
            height: 210.h,
            fit: BoxFit.cover,

            placeholder: (context, url) => Container(
              width: double.infinity,
              height: 210.h,
              alignment: Alignment.center,
              color: Colors.grey.shade200,
              child:  const Icon(
                Icons.image_not_supported_outlined,
                size: 40,
                color: Colors.grey,
              ),
            ),

            errorWidget: (context, url, error) => Container(
              width: 170.w,
              height: 210.h,
              alignment: Alignment.center,
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.image_not_supported_outlined,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: book?.coverImage ?? '',
                  width: 170.w,
                  height: 100.h,
                  fit: BoxFit.cover,

                  placeholder: (context, url) => Container(
                    width: 170.w,
                    height: 100.h,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child:  const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),

                  errorWidget: (context, url, error) => Container(
                    width: 170.w,
                    height: 100.h,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: book?.coverImage ?? '',
                  width: 170.w,
                  height: 100.h,
                  fit: BoxFit.cover,

                  placeholder: (context, url) => Container(
                    width: 170.w,
                    height: 100.h,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child:  const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),

                  errorWidget: (context, url, error) => Container(
                    width: 170.w,
                    height: 100.h,
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
