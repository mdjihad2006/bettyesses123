import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();

  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;

  RxBool isSetPasswordHidden = true.obs;
  RxBool isSetNewPasswordHidden = true.obs;
  RxBool isCurrentPasswordHidden = true.obs;

  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordHidden.value = !isCurrentPasswordHidden.value;
  }

  void togglePasswordVisibility() {
    isSetPasswordHidden.value = !isSetPasswordHidden.value;
  }

  void toggleNewPasswordVisibility() {
    isSetNewPasswordHidden.value = !isSetNewPasswordHidden.value;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
