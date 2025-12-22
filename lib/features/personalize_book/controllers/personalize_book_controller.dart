import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalizeBookController extends GetxController {
  final TextEditingController cityController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;
  RxString selectedValue = "Select Gender".obs;
  RxBool isSelected = false.obs;
  RxString selectedDate = "dd/mm/yyyy".obs;



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
    selectedDate.value = DateFormat("dd/MM/yyyy").format(date);
    Get.back();
  }
}
