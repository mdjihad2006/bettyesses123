import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController homeController = TextEditingController();
  final TextEditingController aptController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final address = "".obs;

  final networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;

  Future<void> postShippingAddress() async {
    final response = await networkCaller.postRequest(
      url: AppUrls.postAddress,
      body: {
        "addressType":address.value,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "streetAddress": streetController.text,
        "aptBuilding": aptController.text,
        "city": cityController.text,
        "state": stateController.text,
        "zipCode": zipCodeController.text,
        "country": countryController.text,
        "phone": phoneController.text,
        "isDefault": true
      },
    );

    if(response.isSuccess){
      Get.snackbar('Success', 'Successfully uploaded');
    }
    else{
      Get.snackbar('Error', 'Something went wrong',backgroundColor: Colors.red);
    }
  }

  final count = 0.obs;



  void increment() => count.value++;
}
