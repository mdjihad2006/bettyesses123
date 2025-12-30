import 'dart:ui';

import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_preview_controller.dart';

class BookPreviewView extends GetView<BookPreviewController> {
  const BookPreviewView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookPreviewController());
    final sliderController = Get.put(ImageSliderController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppAppbar(title: 'Rakibs Book Preview'),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Icon(Icons.arrow_downward, color: Colors.blueAccent),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Text(
                      'Pages are shown one below the other',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Icon(Icons.arrow_forward, color: Colors.blueAccent),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Text(
                      'Swipe & leave each page at the option you like best ',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: GradientElevatedButton(
                  text: 'Upload Another Photo',
                  onPressed: () {
                    Get.toNamed(Routes.UPLOAD_PHOTO);
                  },
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(
                        'Page 1',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 280.w,
                            height: 260.h,
                            child: PageView.builder(
                              controller:
                                  sliderController.pageControllers[index],
                              itemCount: sliderController.images.length,
                              onPageChanged: (i) {
                                sliderController.currentIndexes[index].value =
                                    i;
                              },
                              itemBuilder: (_, index) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    sliderController.images[index],
                                    width: 220.w,
                                    height: 220.h,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            right: -30,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff6C8CFF),
                                    Color(0xff9A6CFF),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  sliderController.pageControllers[index]
                                      .nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                      0.20,
                                    ), // important
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Made with Lorem Ipsum',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            sliderController.images.length,
                            (i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color:
                                    sliderController
                                            .currentIndexes[index]
                                            .value ==
                                        i
                                    ? const Color(0xFF7B61FF)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
              GradientElevatedButton(
                text: 'Save Preview & Continue to Payment',
                onPressed: () {
                  Get.toNamed(Routes.CART_ORDER);
                },
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
