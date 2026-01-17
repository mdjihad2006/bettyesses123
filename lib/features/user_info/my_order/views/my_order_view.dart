import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/custom_outline_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/user_info/my_order/Models/order_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/my_order_controller.dart';

class MyOrderView extends GetView<MyOrderController> {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: RefreshIndicator(
          onRefresh: controller.getOrders,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAppbar(title: 'My Order'),
                SizedBox(height: 20.h),

                Row(
                  children: [
                    Text(
                      'Ongoing Orders',
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.ongoingOrders.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No ongoing orders'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.ongoingOrders.length,
                    itemBuilder: (context, index) {
                      final order = controller.ongoingOrders[index];
                      return _cartCard(order);
                    },
                  );
                }),

                SizedBox(height: 20.h),

                // Completed Orders Section (COMPLETED status only)
                Row(
                  children: [
                    Text(
                      'Completed Orders',
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.completedOrders.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No completed orders'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.completedOrders.length,
                    itemBuilder: (context, index) {
                      final order = controller.completedOrders[index];
                      return _completeCard(order);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSet(OrderModel order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlineButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Cancel Order',
                  middleText: 'Are you sure you want to cancel this order?',
                  textCancel: 'No',
                  textConfirm: 'Yes',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    Get.back();
                    controller.cancelOrder(order.id);
                  },
                );
              },
              child: Obx(() {
                return controller.cancellingOrderId.value == order.id
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text(
                  'Cancel Order',
                  style: TextStyle(color: Colors.blue),
                );
              }),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: GradientElevatedButton(
              text: 'Track Order',
              onPressed: () {
                Get.toNamed(Routes.ORDER_DETAILS, arguments: order.id);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Ongoing Order Card (for PENDING orders)
  Widget _cartCard(OrderModel order) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(AppImages.myOrderPic, width: 100, height: 120),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderItems?.first.book?.template?.title ?? 'Book',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Name: ${order.orderItems?.first.book?.childName ?? "N/A"}'),
                    Text('Status: ${order.status}'),
                    Text('Order ID: ${order.orderNumber}'),
                    Text('Order Date: ${order.createdAt.toLocal().toString().split(' ')[0]}'),
                  ],
                ),
              ),
            ],
          ),
          _buttonSet(order),
        ],
      ),
    );
  }


  Widget _completeCard(OrderModel order) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  AppImages.myOrderPic,
                  width: 100.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderItems?.first.book?.template?.title ?? 'Book',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text('Name: ${order.orderItems?.first.book?.childName ?? "N/A"}'),
                    SizedBox(height: 5),
                    Text('Status: ${order.status}'),
                    SizedBox(height: 5),
                    Text('Order ID: ${order.orderNumber}'),
                    SizedBox(height: 5),
                    Text('Order Date: ${order.createdAt.toLocal().toString().split(' ')[0]}'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomOutlineButton(
            onPressed: () {
              Get.toNamed(Routes.ORDER_DETAILS, arguments: order.id);
            },
            child: const Text(
              'View Details',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}