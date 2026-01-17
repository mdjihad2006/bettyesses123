import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/features/user_info/my_order/Models/order_models.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final networkCaller = NetworkCaller();

  final isLoading = false.obs;
  final Rx<OrderModel?> orderDetails = Rx<OrderModel?>(null);

  // Get orderId from route arguments
  String get orderId => Get.arguments ?? '';

  @override
  void onInit() {
    super.onInit();
    if (orderId.isNotEmpty) {
      getOrderDetails();
    }
  }

  Future<void> getOrderDetails() async {
    isLoading.value = true;

    final response = await networkCaller.getRequest(
      url: '${AppUrls.orders}/$orderId',
    );

    if (response.isSuccess) {
      final data = response.responseData?['data'];
      if (data != null) {
        orderDetails.value = OrderModel.fromJson(data);
      }
    } else {
      Get.snackbar(
        'Error',
        response.responseData?['message'] ?? 'Failed to load order details',
      );
    }

    isLoading.value = false;
  }

  String getOrderStatus() {
    final status = orderDetails.value?.status ?? '';
    switch (status) {
      case 'PENDING':
        return 'Processing';
      case 'PROCESSING':
        return 'Processing';
      case 'SHIPPED':
        return 'Shipped';
      case 'DELIVERED':
        return 'Delivered';
      case 'COMPLETED':
        return 'Completed';
      case 'CANCELLED':
        return 'Cancelled';
      default:
        return status;
    }
  }

  String getPaymentStatus() {
    // You can customize this based on your payment object structure
    final payment = orderDetails.value?.payment;
    if (payment != null) {
      return 'Successful';
    }
    return 'Pending';
  }
}