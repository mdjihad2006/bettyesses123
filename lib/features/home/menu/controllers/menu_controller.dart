import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/home/menu/models/menu_models.dart';
import 'package:get/get.dart';

class MyMenuController extends GetxController {
  final networkCaller = NetworkCaller();

  Rxn<UserData> userData = Rxn<UserData>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMenu();
  }

  Future<void> getMenu() async {
    isLoading.value = true;
    print('📡 getMenu() called');

    final response = await networkCaller.getRequest(
      url: AppUrls.menuItem,
    );

    isLoading.value = false;

    print('📥 API statusCode: ${response.statusCode}');
    print('📥 API success: ${response.isSuccess}');
    print('📥 Raw response: ${response.responseData}');

    if (response.isSuccess && response.responseData != null) {
      try {
        final model = UserProfileModel(
          success: true,
          statusCode: response.statusCode,
          message: 'ok',
          data: UserData.fromJson(response.responseData?['data']),
        );

        userData.value = model.data;

        print('✅ User parsed successfully');
        print('👤 Name: ${model.data?.firstName} ${model.data?.lastName}');
        print('📧 Email: ${model.data?.email}');
        print('🖼 Image: ${model.data?.image}');
      } catch (e) {
        print('❌ Parsing error: $e');
      }
    } else {
      print('❌ API failed: ${response.errorMessage}');
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
