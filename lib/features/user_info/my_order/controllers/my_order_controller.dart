import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {

  final networkCaller = NetworkCaller();

  /*Future<void> getOrder() async{
    final response = await networkCaller.
  }*/

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
