import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/user_info/shipping_address/models/shipping_address_models.dart';
import 'package:get/get.dart';

class ShippingAddressController extends GetxController {
  final networkCaller = NetworkCaller();
  RxBool isLoading = false.obs;
  final addressModel = Rxn<AddressResponseModel>();

  @override
  void onInit() {
    super.onInit();
    getShippingAddress();
  }

  Future<void> getShippingAddress() async {
    isLoading.value = true;
    final response = await networkCaller.getRequest(url: AppUrls.shippingAddress);
    if(response.isSuccess){
      isLoading.value = false;
      addressModel.value = AddressResponseModel.fromJson(response.responseData!);
      print(addressModel.value);
      Get.snackbar('Success', 'Shipping Address Loaded Successfully');
    } else {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to load shipping addresses');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}