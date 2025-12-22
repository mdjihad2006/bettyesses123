import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;
  RxInt currentStep = 2.obs;

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void setStep(int step) {
    currentStep.value = step;
  }

}
