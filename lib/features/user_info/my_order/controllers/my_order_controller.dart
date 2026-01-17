import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/user_info/my_order/Models/order_models.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  final networkCaller = NetworkCaller();

  final isLoading = false.obs;
  final ongoingOrders = <OrderModel>[].obs;
  final completedOrders = <OrderModel>[].obs;
  final cancellingOrderId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async {
    isLoading.value = true;

    final response = await networkCaller.getRequest(url: AppUrls.myOrders);

    if (response.isSuccess) {
      final List list = response.responseData?['data'] ?? [];
      final orders = list.map((e) => OrderModel.fromJson(e)).toList();


      ongoingOrders.value = orders.where((o) => o.status == "PENDING").toList();


      completedOrders.value = orders.where((o) => o.status == "COMPLETED").toList();
    }

    isLoading.value = false;
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      cancellingOrderId.value = orderId;

      final response = await networkCaller.deleteRequest(
        url: '${AppUrls.baseUrl}/orders/$orderId/cancel',
        body: {'status': 'CANCELLED'},
      );

      if (response.isSuccess) {
        Get.snackbar('Success', 'Order cancelled successfully');
        await getOrders();
      } else {
        Get.snackbar(
          'Error',
          response.responseData?['message'] ?? 'Failed to cancel order',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
      print('Cancel order error: $e');
    } finally {
      cancellingOrderId.value = '';
    }
  }
}