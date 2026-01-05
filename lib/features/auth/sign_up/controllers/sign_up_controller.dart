import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final isLoading = false.obs;

  final passwordVisible = false.obs;

  final rememberMe = false.obs;

  final  nameController = TextEditingController();
  final  lastNameController = TextEditingController();
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final _networkCaller = NetworkCaller();

  final emailError = RxnString();
  final passwordError = RxnString();
  final confirmPasswordError = RxnString();
  final nameError = RxnString();
  String? userId;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }


  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  bool validate(){
    bool valid = true;

    if(nameController.text.isEmpty){
      nameError.value = 'Name is required';
      valid = false;
    }else if(nameController.text.length < 2){
      nameError.value = 'Enter a valid name';
      valid = false;
    }else{
      nameError.value = null;
    }

    if(lastNameController.text.isEmpty){
      nameError.value = 'Last name is required';
      valid = false;
    }else if(lastNameController.text.length < 2){
      nameError.value = 'Enter a valid last name';
      valid = false;
    }else{
      nameError.value = null;
    }

    if (emailController.text.isEmpty) {
      emailError.value = "Email cannot be empty";
      valid = false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Enter a valid email";
      valid = false;
    } else {
      emailError.value = null;
    }

    // Password validation
    if (passwordController.text.isEmpty) {
      passwordError.value = "Password cannot be empty";
      valid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
      valid = false;
    } else {
      passwordError.value = null;
    }

    // Terms checkbox validation
    if (!rememberMe.value) {
      Get.snackbar(
        "Terms & Privacy",
        "Please accept the terms and privacy policy",
        snackPosition: SnackPosition.BOTTOM,
      );
      valid = false;
    }
    return valid;
  }

  Future<void> signupWithEmail()async{
    if(!validate())return;
    isLoading.value = true;

    try{
      final response = await _networkCaller.postRequest(
          url: AppUrls.signUp,
          body: {
            "firstName": nameController.text,
            "lastName": lastNameController.text,
            "email": emailController.text,
            "password": passwordController.text,
          }
      );
      if(response.isSuccess){
        final data = response.responseData;
        userId = data?["data"]["id"];
        isLoading.value = false;

        Get.toNamed(Routes.OTP_VERIFICATION,arguments: {
          "id":userId,
          "email":emailController.text,
          "isFromForgotPassword":"SIGNUP",
        });
        clearFields();
      } else{
        isLoading.value = false;
      }
    }catch(e){
      isLoading.value = false;
      print("Signup error: $e");
    }
    isLoading.value = false;
  }

  void signupWithGoogle() {
    print("Google signup clicked");
  }

  void clearFields() {
    nameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void goToOTP() {
    Get.toNamed(Routes.OTP_VERIFICATION);
  }

  RxString selectedOption = ''.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
