import 'package:get/get.dart';
import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import '../models/privacy_model.dart';

class PrivacyPolicyController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  RxBool isLoading = false.obs;
  RxList<PolicyData> privacyPolicyList = <PolicyData>[].obs;

  Future<void> getPrivacyPolicy() async {
    isLoading.value = true;

    final response =
    await _networkCaller.getRequest(url: AppUrls.privacyPolicy);

    if (response.isSuccess && response.responseData != null) {
      final model =
      PolicyResponseModel.fromJson(response.responseData!);


      privacyPolicyList.assignAll(
        model.data
            .where((e) => e.type == 'PRIVACY_POLICY' && e.isActive)
            .toList()
          ..sort((a, b) => a.policyNumber.compareTo(b.policyNumber)),
      );
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }
}
