import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/home/home/controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/book_flow_controller.dart';

class BookFlowView extends GetView<BookFlowController> {
  const BookFlowView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookFlowController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                  Text(
                    'Story Books',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.NOTIFICATION);
                        },
                        icon: const Icon(Icons.notifications_none,size: 33,),
                      ),
                      Positioned(
                          right: 5,
                          top: 4,
                          child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      )
                                  )
                              )
                          )
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              /// Search
              SearchBar(
                hintText: 'Search',
                elevation: WidgetStateProperty.all(0),
                backgroundColor:
                MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                leading: const Icon(Icons.search),
              ),

              SizedBox(height: 10.h),


              Row(
                children: [
                  Text(
                    'All Books',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              ),


              GridView.builder(
                padding: EdgeInsets.only(top: 15.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 0.6,
                ),
                itemCount: controller.data?.length,
                itemBuilder: (context, index) {
                  final books = controller.data?[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.BOOK_DETAILS,  arguments: books);
                    },
                    child: Container(
                      width: 165.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: books?.coverImage ?? '',
                              width: 170.w,
                              height: 190.h,
                              fit: BoxFit.cover,

                              placeholder: (context, url) => Container(
                                width: 170.w,
                                height: 190.h,
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
                                height: 190.h,
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
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  books?.title??'',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  books?.description??'',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  books?.ageRange??'',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
