import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalizeBookController extends GetxController {

  final TextEditingController cityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  int? selectedAge;
  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;
  RxString selectedValue = "Select Gender".obs;
  RxBool isSelected = false.obs;
  RxString selectedDate = "dd/mm/yyyy".obs;
  final networkCaller  = NetworkCaller();
  String templateId = "";

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    templateId = args["templateId"];

  }

  Future<void> postDetails() async {
    final response = await networkCaller.postRequest(
        url: AppUrls.userDetails,
        body: {
          "templateId": templateId,
          "childName": nameController.text,
          "age": selectedAge,
          "gender": selectedValue.value.toUpperCase(),
          "birthMonth": selectedDate.value,
    });
    if(response.isSuccess){
      Get.snackbar("Success", "Details posted successfully");
      Get.toNamed(Routes.UPLOAD_PHOTO,arguments: {"templateId": templateId});
    }
    else{
      Get.snackbar("Error", "Error posting details",  backgroundColor: Colors.red);
    }
  }


  RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }
  void selectOption(String option) {
    selectedOption.value = option;
  }
  final List<String> options = [
    "Male",
    "Female",
    "Non-Binary",
    "Prefer not to say",
  ];

  void selectGender(String value) {
    selectedValue.value = value;
    Get.back();
  }
  void setDate(DateTime date) {
    selectedDate.value = DateFormat("MMM").format(date);
    print(selectedDate.value);
    Get.back();
  }
}
