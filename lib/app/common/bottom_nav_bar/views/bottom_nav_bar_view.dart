import 'package:bettyesses123/features/home/book_flow/controllers/book_flow_controller.dart';
import 'package:bettyesses123/features/home/book_flow/views/book_flow_view.dart';
import 'package:bettyesses123/features/home/cart/views/cart_view.dart';
import 'package:bettyesses123/features/home/home/controllers/home_controller.dart';
import 'package:bettyesses123/features/home/home/views/home_view.dart';
import 'package:bettyesses123/features/home/menu/views/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../images/app_images.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomnavbarView extends GetView<BottomnavbarController> {
  BottomnavbarView({super.key});


  final List<String> icons = [
    AppImages.homeIcon,
    AppImages.book,
    AppImages.cart,
    AppImages.menu,
  ];

  final List<Widget> pages = [
    HomeView(),
    BookFlowView(),
    CartView(),
    MenuView(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),

      // Bottom Navigation Bar
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -7),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              bool isSelected = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () {
                  controller.changeIndex(index, maxLength: icons.length);

                  if (index == 1) {
                    final homeController = Get.find<HomeController>();
                    final data = homeController.bookTemplateResponse.value?.data;

                    if (data != null && data.isNotEmpty) {
                      final bookController = Get.put(BookFlowController());
                      bookController.setData(data);
                    }
                  }
                },


                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.linear,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: isSelected
                            ? const Color(0xFFF0E5FF)
                            : Colors.white,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        icons[index],
                        width: 28,
                        height: 28,
                        color: isSelected ? Colors.black : null,
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
