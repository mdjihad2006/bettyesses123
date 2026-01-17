import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final networkCaller = NetworkCaller();

  @override
  void onInit() {
    super.onInit();
    _cartShow();
  }

  Future<void> _cartShow() async{
    final response = await networkCaller.getRequest(url: AppUrls.cart);
    if(response.isSuccess){
      print(response.responseData);
      print('cart showing');
    }else{
      print('cart not showing');
    }
  }


}
