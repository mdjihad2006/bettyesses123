import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/shared_prefs_helper/shared_prefs_helper.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final isLoading = false.obs;
  final passwordVisible = false.obs;
  final rememberMe = false.obs;


  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final _networkCaller = NetworkCaller();

  final emailError = RxnString();
  final passwordError = RxnString();
  RxBool isGoogleLoading = false.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  bool validate(){
    bool valid = true;

    if(emailController.text.isEmpty){
      emailError.value = 'Please enter your email';
      valid = false;
    } else if(!GetUtils.isEmail(emailController.text)){
      emailError.value = "Enter a valid email";
      valid = false;
    }else{
      passwordError.value = null;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = "Password cannot be empty";
      valid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
      valid = false;
    } else {
      passwordError.value = null;
    }
    return valid;
  }

  Future<void> loginWithEmail() async{
    if(!validate())return;
    isLoading.value = true;

    try{
      final response =  await _networkCaller.postRequest(
          url: AppUrls.signIn,
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          }
      );
      if(response.isSuccess){
        final data = response.responseData;
        await SharedPreferencesHelper.saveAccessToken(data?['data']['accessToken']);
        isLoading.value = false;
        Get.offAllNamed(Routes.BottomNavBar,  arguments: {"email":emailController.text,"isFromForgotPassword":"LOGIN"});
      }
    }catch(e){
      isLoading.value = false;
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle(String token) async {
    final response = await _networkCaller.postRequest(
      url: AppUrls.signInWithGoogle,
      body: {"googleToken": token},
    );
    if (response.isSuccess) {
      print('success');
    }
  }


  void clearFields(){
    emailController.clear();
    passwordController.clear();
  }

  void forgetPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  @override
  void onInit() {
    emailController.clear();
    passwordController.clear();
    super.onInit();
  }

  RxString selectedOption = ''.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
