import 'package:get/get.dart';

class PaymentDetailsController extends GetxController {
  RxInt currentStep = 3.obs;
  RxBool rememberMe = false.obs;
  RxInt selectedIndex = 0.obs;

  void setStep(int step) {
    currentStep.value = step;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void select(int index) {
    selectedIndex.value = index;
  }
}
