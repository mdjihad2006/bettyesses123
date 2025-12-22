import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset(
                            AppImages.profilePic,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'James Tracy',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'mikejames@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          AppImages.profilePic,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Mike James',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'My profile',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_INFO);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.black54,
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'My Orders',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.MY_ORDER);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.SHIPPING_ADDRESS);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.confirmation_num_outlined),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Promo codes',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.PROMO_CODE);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.password),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.help_outline),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Terms & Condition ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.TERMS_CONDITION);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.privacy_tip_outlined),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.toNamed(Routes.PRIVACY_POLICY);
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.logout_outlined),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: Colors.white,
                          content: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Are you sure you want to logout?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                          actions: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomOutlineButton(
                                    onPressed: () {
                                      Get.offAllNamed(Routes.LOG_IN);
                                    },
                                    child: Text('Yes'),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: SizedBox(
                                    height: 47.h,
                                    child: GradientElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      text: 'No',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
