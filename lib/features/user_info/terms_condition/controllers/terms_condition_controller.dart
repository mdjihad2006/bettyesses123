import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/terms_condition_model.dart';

class TermsConditionController extends GetxController {
  final networkCaller = NetworkCaller();

  RxBool isLoading = false.obs;
  RxList<TermsData> termsList = <TermsData>[].obs;

  Future<void> getTerms() async {
    isLoading.value = true;

    final response =
    await networkCaller.getRequest(url: AppUrls.terms);

    if (response.isSuccess && response.responseData != null) {
      final model =
      TermsResponseModel.fromJson(response.responseData!);

      termsList.assignAll(model.data);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getTerms();
  }
}

