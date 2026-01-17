import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final token = await SharedPreferencesHelper.getAccessToken();

      if (token != null && token.isNotEmpty) {
        Get.offAllNamed(Routes.BottomNavBar);
      } else {
        Get.offAllNamed(Routes.LOG_IN);
      }
    });


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppImages.newImage)
            ),
          ],
        ),
      )
    );
  }
}
