import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/notification/controllers/notification_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

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
                  Text(
                    'Story Books',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),

                  Obx(() {

                    final notificationController = Get.isRegistered<NotificationController>()
                        ? Get.find<NotificationController>()
                        : Get.put(NotificationController());

                    final count = notificationController.unreadCount.value;

                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          icon: const Icon(Icons.notifications_none, size: 33),
                        ),
                        if (count > 0)
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
                                  count > 99 ? '99+' : '$count',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  })
                ],
              ),

              SizedBox(height: 10.h),

              /// Search Bar
              SearchBar(
                controller: controller.searchController,
                hintText: 'Search',
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                leading: const Icon(Icons.search),
                onChanged: (value) {
                  controller.getAllBooks(searchTerm: value);
                },
              ),

              SizedBox(height: 15.h),

              Text(
                'Recently Viewed',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.h),

              SizedBox(
                height: 300.h,
                child: Obx(() {
                  final data = controller.recentlyViewedBooks;

                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        'No recent books available',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final books = data[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            controller.addToRecentlyViewed(books);
                            Get.toNamed(Routes.BOOK_DETAILS, arguments: books);
                          },
                          child: Container(
                            width: 155.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Book Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: books.coverImage,
                                    width: 170.w,
                                    height: 190.h,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => Container(
                                      width: 170.w,
                                      height: 190.h,
                                      color: Colors.grey.shade200,
                                      child: const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    errorWidget: (_, __, ___) => Container(
                                      width: 170.w,
                                      height: 190.h,
                                      color: Colors.grey.shade200,
                                      child: const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 6.h),

                                Text(
                                  books.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Text(
                                  books.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),

                                Text(
                                  books.ageRange,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              SizedBox(height: 25.h),

              Row(
                children: [
                  Text(
                    'All Books',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      final books = controller.bookTemplateResponse.value?.data;
                      if (books != null && books.isNotEmpty) {
                        Get.toNamed(
                          Routes.BOOK_FLOW,
                          arguments: {"data": books},
                        );
                      } else {
                        Get.snackbar('Error', 'Books not loaded yet');
                      }
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              /// All Books Grid
              Obx(() {
                final data = controller.bookTemplateResponse.value?.data;

                if (data == null || data.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Text(
                        'No books available',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.only(top: 15.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 0.6,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final books = data[index];

                    return GestureDetector(
                      onTap: () {
                        controller.addToRecentlyViewed(books);
                        Get.toNamed(Routes.BOOK_DETAILS, arguments: books);
                                            },
                      child: Container(
                        width: 165.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: books.coverImage,
                                width: 170.w,
                                height: 190.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  width: 170.w,
                                  height: 190.h,
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 170.w,
                                  height: 190.h,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    books.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    books.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    books.ageRange,
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
