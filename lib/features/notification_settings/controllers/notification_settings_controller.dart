import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  RxBool isPushNotification = false.obs;

  final count = 0.obs;



  void increment() => count.value++;
}
