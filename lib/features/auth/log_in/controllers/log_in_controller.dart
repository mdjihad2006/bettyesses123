import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }
  void selectOption(String option) {
    selectedOption.value = option;
  }
}

class PasswordController extends GetxController {
  RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
