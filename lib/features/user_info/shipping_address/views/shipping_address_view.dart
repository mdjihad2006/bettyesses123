import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/shipping_address_controller.dart';

class ShippingAddressView extends GetView<ShippingAddressController> {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: RefreshIndicator(
        onRefresh: controller.getShippingAddress,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(17),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AppAppbar(title: 'Shipping Address'),
                  SizedBox(height: 20.h),
                ]),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              final data = controller.addressModel.value?.data;

              if (data == null || data.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_off,
                            size: 60,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No addresses found',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 10 : 0,
                          bottom: 20.h,
                        ),
                        child: _cartCard(index, controller),
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              );
            }),
            SliverPadding(
              padding: const EdgeInsets.all(17),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  GradientElevatedButton(
                    text: 'Add New Address',
                    onPressed: () {
                      Get.toNamed(Routes.ADD_ADDRESS);
                    },
                  ),
                  SizedBox(height: 20.h), // Bottom padding
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cartCard(int index, ShippingAddressController controller) {
  final data = controller.addressModel.value?.data;
  final item = data?[index];

  // Handle null safety for all fields
  final addressType = item?.addressType ?? 'Unknown';
  final firstName = item?.firstName ?? '';
  final lastName = item?.lastName ?? '';
  final fullName = '$firstName $lastName'.trim();
  final phone = item?.phone ?? 'No phone';

  // Build address string dynamically
  List<String> addressParts = [];
  if (item?.streetAddress != null && item!.streetAddress.isNotEmpty) {
    addressParts.add(item.streetAddress);
  }
  if (item?.city != null && item!.city.isNotEmpty) {
    addressParts.add(item.city);
  }
  if (item?.state != null && item!.state.isNotEmpty) {
    addressParts.add(item.state);
  }
  if (item?.country != null && item!.country.isNotEmpty) {
    addressParts.add(item.country);
  }
  if (item?.zipCode != null && item!.zipCode.isNotEmpty) {
    addressParts.add(item.zipCode);
  }

  final fullAddress = addressParts.isNotEmpty
      ? addressParts.join(', ')
      : 'No address available';

  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressType,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              if (fullName.isNotEmpty) ...[
                SizedBox(height: 5.h),
                Text(fullName, style: TextStyle(fontSize: 14.sp)),
              ],
              SizedBox(height: 5.h),
              Text(phone, style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 5.h),
              Text(
                fullAddress,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          padding: EdgeInsets.symmetric(horizontal: 12),
          onSelected: (value) {
            if (value == 'edit') {
              Get.toNamed(Routes.ADD_ADDRESS, arguments: item);
            } else if (value == 'delete') {
              Get.dialog(
                AlertDialog(
                  title: const Text('Delete Address'),
                  content: const Text(
                    'Are you sure you want to delete this address?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement delete logic here
                        Get.back();
                        Get.snackbar(
                          'Deleted',
                          'Address deleted successfully',
                        );
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'edit', child: Text('Edit')),
            const PopupMenuDivider(),
            const PopupMenuItem(
              padding: EdgeInsets.symmetric(horizontal: 12),
              value: 'delete',
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    ),
  );
}