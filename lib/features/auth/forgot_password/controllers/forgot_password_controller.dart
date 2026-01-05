import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final emailError = Rx<String?>(null);
  final _networkCaller = NetworkCaller();
  String? userId = "";

  bool validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = "Email can't be empty";
      return false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = "Enter a valid email";
      return false;
    }
    emailError.value = null;
    return true;
  }

  Future<void> submit() async {
    isLoading.value = true;
    if (!validateEmail()) return;

    try {
      final response = await _networkCaller.postRequest(
        url: AppUrls.forgetPassword,
        body: {"email": emailController.text},
      );
      if (response.isSuccess) {
        final data = response.responseData;
        userId = data?["data"]["id"];
        Get.toNamed(
          Routes.OTP_VERIFICATION,
          arguments: {
            'id':userId,
            'isFromForgotPassword': "FORGET",
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }
}
