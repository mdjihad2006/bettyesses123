import 'package:bettyesses123/features/home/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfoController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final menuController = Get.find<MyMenuController>();

  RxString userImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _setDataFromMenu();
  }

  void _setDataFromMenu() {
    final user = menuController.userData.value;

    if (user != null) {
      firstNameController.text = user.firstName;
      lastNameController.text = user.lastName;
      emailController.text = user.email;
      userImageUrl.value = user.image ?? '';
    }
  }

  // Helper to get full image URL
  String getFullImageUrl() {
    if (userImageUrl.value.isEmpty) return '';
    if (userImageUrl.value.startsWith('http')) return userImageUrl.value;
    return 'http://206.162.244.175:6005${userImageUrl.value}';
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}