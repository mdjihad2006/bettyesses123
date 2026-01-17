import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.orderDetails.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Order not found'),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        }

        final order = controller.orderDetails.value!;
        final firstItem = order.orderItems?.first;
        final book = firstItem?.book;
        final template = book?.template;

        return Padding(
          padding: const EdgeInsets.all(17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAppbar(title: 'Order Details'),
                SizedBox(height: 20.h),
                _cartCard(order, book, template),
                SizedBox(height: 30.h),
                _orderTracking(order.status),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _orderTracking(String status) {
    final steps = [
      {'title': 'Order Processed', 'icon': AppImages.box, 'status': 'PENDING'},
      {'title': 'Order Shipped', 'icon': AppImages.giftBox, 'status': 'SHIPPED'},
      {'title': 'Order En Route', 'icon': AppImages.truck, 'status': 'IN_TRANSIT'},
      {'title': 'Order Arrived', 'icon': AppImages.parsel, 'status': 'DELIVERED'},
    ];

    int currentStep = 0;
    if (status == 'PENDING' || status == 'PROCESSING') currentStep = 1;
    if (status == 'SHIPPED') currentStep = 2;
    if (status == 'IN_TRANSIT') currentStep = 3;
    if (status == 'DELIVERED' || status == 'COMPLETED') currentStep = 4;

    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep - 1;

        return Column(
          children: [
            Row(
              children: [
                Icon(
                  isCompleted ? Icons.check_circle : Icons.circle_outlined,
                  color: isCompleted || isCurrent ? Colors.blue : Colors.grey,
                ),
                SizedBox(width: 12.w),
                Image.asset(
                  step['icon'] as String,
                  color: isCompleted || isCurrent ? null : Colors.grey,
                ),
                SizedBox(width: 12.w),
                Text(
                  step['title'] as String,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: isCompleted || isCurrent ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
            if (index < steps.length - 1) SizedBox(height: 20.h),
          ],
        );
      }),
    );
  }

  Widget _cartCard(order, book, template) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          _buildInfoRow('Customer Name:', '${order.firstName} ${order.lastName}'),
          _buildInfoRow('Book Name:', template?.title ?? 'N/A'),
          _buildInfoRow('Child Name:', book?.childName ?? 'N/A'),
          _buildInfoRow('Age:', '${book?.age ?? 'N/A'}'),
          _buildInfoRow('Total Amount:', '\${order.total.toStringAsFixed(2)}'),
          _buildInfoRow('Order ID:', order.orderNumber),
          _buildInfoRow('Order Date:', DateFormat('dd-MM-yyyy').format(order.createdAt)),
          _buildInfoRow('Payment:', controller.getPaymentStatus()),
          _buildInfoRow('Status:', controller.getOrderStatus()),
          _buildInfoRow('Delivery Address:', '${order.city}, ${order.country}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140.w,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}