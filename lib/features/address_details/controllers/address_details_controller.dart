import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  // Form Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final streetAddress2Controller = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();

  // Observable variables
  RxBool rememberMe = false.obs;
  RxString selectedState = ''.obs;
  RxInt currentStep = 2.obs;
  RxBool isLoading = false.obs;

  final networkCaller = NetworkCaller();

  // US States list
  final List<String> states = [
    'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA',
    'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
    'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ',
    'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
    'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'
  ];

  @override
  void onInit() {
    super.onInit();
    // Set default country
    countryController.text = 'United States';
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void setStep(int step) {
    currentStep.value = step;
  }

  void setSelectedState(String? state) {
    if (state != null) {
      selectedState.value = state;
    }
  }

  Future<void> submitOrder() async {
    try {
      isLoading.value = true;

      // Prepare request body
      final body = {
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
        "country": countryController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "streetAddress": streetAddressController.text.trim(),
        "city": cityController.text.trim(),
        "state": selectedState.value,
        "postalCode": postalCodeController.text.trim(),
      };

      print('📤 Submitting order with data: $body');

      final response = await networkCaller.postRequest(
        url: AppUrls.orders,
        body: body,
      );

      isLoading.value = false;

      print('📥 Order response status: ${response.statusCode}');
      print('📥 Order response data: ${response.responseData}');

      if (response.isSuccess && response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Order placed successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );

        // Navigate to payment details
        Get.toNamed(Routes.PAYMENT_DETAILS);
      } else {
        Get.snackbar(
          'Error',
          response.errorMessage ?? 'Failed to place order',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print('❌ Order submission error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    streetAddressController.dispose();
    streetAddress2Controller.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    super.onClose();
  }
}