import 'dart:async';
import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  var isLoading = false.obs;
  var otp = ''.obs;
  var isOtpValid = true.obs;

  var canResend = false.obs;
  var secondsLeft = 30.obs;
  Timer? _timer;

  final otpController = TextEditingController();
  String userId = '';
  String email = '';
  String? isFromForgotPassword;

  final _networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments ?? {};
    userId = args['id'] ?? '';
    email = args['email'] ?? '';
    isFromForgotPassword = args['isFromForgotPassword'] ?? "";
    print('hello${isFromForgotPassword}');

    startResendTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }

  Future<void> verifyOtp() async {
    if (otp.value.length != 6) {
      isOtpValid.value = false;
      Get.snackbar('Error', 'Please enter a valid 6-digit OTP');
      return;
    }

    isLoading.value = true;

    try {
      String url;
      if (isFromForgotPassword == "LOGIN") {
        url = AppUrls.verifyOtp;
      } else if (isFromForgotPassword == "SIGNUP") {
        url = AppUrls.verifyOtp;
      } else {
        url = AppUrls.forgotVerifyOtp;
      }
      final response = await _networkCaller.postRequest(
        url: url,
        body: {'userId': userId, 'otpCode': otp.value},
      );

      if (response.isSuccess) {

        if (isFromForgotPassword == "LOGIN") {
          final data = response.responseData;
          Get.toNamed(Routes.BottomNavBar);
          await SharedPreferencesHelper.saveAccessToken(
            data?['data']['accessToken'],
          );
        } else if (isFromForgotPassword == "SIGNUP") {
          final data = response.responseData;
          Get.toNamed(Routes.BottomNavBar);
          await SharedPreferencesHelper.saveAccessToken(
            data?['data']['accessToken'],
          );
        } else {
          Get.offNamed(Routes.RESET_PASSWORD, arguments: {'email': userId});
          print('everything ok');
        }
        clearOtp();
      } else {
        Get.snackbar(
          'Error',
          response.responseData?['message'] ?? 'OTP verification failed',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'OTP verification failed');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp() async {
    if (!canResend.value) return;

    try {
      canResend.value = false;
      secondsLeft.value = 30;
      startResendTimer();

      final response = await _networkCaller.postRequest(
        url: AppUrls.resendOtp,
        body: {'userId': userId},
      );

      if (response.isSuccess) {
        Get.snackbar('Success', 'OTP resent successfully');
        clearOtp();
      } else {
        Get.snackbar(
          'Error',
          response.responseData?['message'] ?? 'Failed to resend OTP',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to resend OTP');
    }
  }

  void startResendTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value == 0) {
        canResend.value = true;
        timer.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  void clearOtp() {
    otpController.clear();
    otp.value = '';
    isOtpValid.value = true;
  }
}
