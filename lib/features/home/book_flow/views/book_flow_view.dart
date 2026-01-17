import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/book_flow_controller.dart';

class BookFlowView extends StatelessWidget {
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

              /// AppBar Row
              Row(
                children: [
                  IconButton(
                    onPressed: Get.back,
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
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    icon: const Icon(Icons.notifications_none, size: 33),
                  ),
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
                'All Books',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10.h),

              /// Book Grid
              GetBuilder<BookFlowController>(
                builder: (controller) {
                  if (controller.data == null ||
                      controller.data!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('No books found'),
                      ),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 10.h),
                    itemCount: controller.data!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final books = controller.data![index];

                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.BOOK_DETAILS,
                            arguments: books,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: books.coverImage,
                                height: 190.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (_, __) => Container(
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 40,
                                  ),
                                ),
                                errorWidget: (_, __, ___) => Container(
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 6.h),

                            /// Title
                            Text(
                              books.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            /// Description
                            Text(
                              books.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey,
                              ),
                            ),

                            /// Age Range
                            Text(
                              books.ageRange,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
