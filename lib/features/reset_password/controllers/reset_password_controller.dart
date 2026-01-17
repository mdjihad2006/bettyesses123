import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final isLoading = false.obs;
  final passwordVisible = false.obs;
  final confirmPasswordVisible = false.obs;

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final newPasswordError = RxnString();
  final confirmPasswordError = RxnString();

  final _networkCaller = NetworkCaller();

  RxBool rememberMe = false.obs;



  void toggleRememberMe(bool? value) {
    if (value != null) rememberMe.value = value;
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  bool validate() {
    bool valid = true;

    if (newPasswordController.text.isEmpty) {
      newPasswordError.value = 'Password cannot be empty';
      valid = false;
    } else if (newPasswordController.text.length < 6) {
      newPasswordError.value = 'Password must be at least 6 characters';
      valid = false;
    } else {
      newPasswordError.value = null;
    }

    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError.value = 'Confirm your password';
      valid = false;
    } else if (confirmPasswordController.text != newPasswordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
      valid = false;
    } else {
      confirmPasswordError.value = null;
    }

    return valid;
  }

  Future<void> savePassword() async {
    if (!validate()) return;

    isLoading.value = true;

    try {
      final response = await _networkCaller.postRequest(
        url: AppUrls.resetPassword,
        body: {"newPassword": newPasswordController.text},
      );

      if (response.isSuccess) {
        Get.offAllNamed(Routes.LOG_IN);
      } else {
        print('else else else');
        Get.snackbar(
          'Error',
          response.responseData?['message'] ?? 'Failed to reset password',
        );
      }
    } catch (e) {
      print('catch');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      print('else');
      isLoading.value = false;
    }
  }
}
