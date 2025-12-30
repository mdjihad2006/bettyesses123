import 'package:get/get.dart';

import '../../features/address_details/bindings/address_details_binding.dart';
import '../../features/address_details/views/address_details_view.dart';
import '../../features/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../../features/auth/forgot_password/views/forgot_password_view.dart';
import '../../features/auth/log_in/bindings/log_in_binding.dart';
import '../../features/auth/log_in/views/log_in_view.dart';
import '../../features/auth/otp_verifation/bindings/otp_verification_binding.dart';
import '../../features/auth/otp_verifation/views/otp_verification_view.dart';
import '../../features/auth/sign_up/bindings/sign_up_binding.dart';
import '../../features/auth/sign_up/views/sign_up_view.dart';
import '../../features/auth/verification_successful/bindings/verification_successful_binding.dart';
import '../../features/auth/verification_successful/views/verification_successful_view.dart';
import '../../features/book_details/bindings/book_details_binding.dart';
import '../../features/book_details/views/book_details_view.dart';
import '../../features/book_preview/bindings/book_preview_binding.dart';
import '../../features/book_preview/views/book_preview_view.dart';
import '../../features/cart_order/bindings/cart_order_binding.dart';
import '../../features/cart_order/views/cart_order_view.dart';
import '../../features/home/book_flow/bindings/book_flow_binding.dart';
import '../../features/home/book_flow/views/book_flow_view.dart';
import '../../features/home/cart/bindings/cart_binding.dart';
import '../../features/home/cart/views/cart_view.dart';
import '../../features/home/home/bindings/home_binding.dart';
import '../../features/home/home/views/home_view.dart';
import '../../features/home/menu/bindings/menu_binding.dart';
import '../../features/home/menu/views/menu_view.dart';
import '../../features/notification/bindings/notification_binding.dart';
import '../../features/notification/views/notification_view.dart';
import '../../features/notification_settings/bindings/notification_settings_binding.dart';
import '../../features/notification_settings/views/notification_settings_view.dart';
import '../../features/payment-success/bindings/payment_success_binding.dart';
import '../../features/payment-success/views/payment_success_view.dart';
import '../../features/payment_details/bindings/payment_details_binding.dart';
import '../../features/payment_details/views/payment_details_view.dart';
import '../../features/personalize_book/bindings/personalize_book_binding.dart';
import '../../features/personalize_book/views/personalize_book_view.dart';
import '../../features/splash_screen/bindings/splash_screen_binding.dart';
import '../../features/splash_screen/views/splash_screen_view.dart';
import '../../features/upload_photo/bindings/upload_photo_binding.dart';
import '../../features/upload_photo/views/upload_photo_view.dart';
import '../../features/user_info/add_address/bindings/add_address_binding.dart';
import '../../features/user_info/add_address/views/add_address_view.dart';
import '../../features/user_info/change_password/bindings/change_password_binding.dart';
import '../../features/user_info/change_password/views/change_password_view.dart';
import '../../features/user_info/edit-profile/bindings/edit_profile_binding.dart';
import '../../features/user_info/edit-profile/views/edit_profile_view.dart';
import '../../features/user_info/my_order/bindings/my_order_binding.dart';
import '../../features/user_info/my_order/views/my_order_view.dart';
import '../../features/user_info/order_details/bindings/order_details_binding.dart';
import '../../features/user_info/order_details/views/order_details_view.dart';
import '../../features/user_info/privacy_policy/bindings/privacy_policy_binding.dart';
import '../../features/user_info/privacy_policy/views/privacy_policy_view.dart';
import '../../features/user_info/profile_info/bindings/profile_info_binding.dart';
import '../../features/user_info/profile_info/views/profile_info_view.dart';
import '../../features/user_info/promo_code/bindings/promo_code_binding.dart';
import '../../features/user_info/promo_code/views/promo_code_view.dart';
import '../../features/user_info/shipping_address/bindings/shipping_address_binding.dart';
import '../../features/user_info/shipping_address/views/shipping_address_view.dart';
import '../../features/user_info/terms_condition/bindings/terms_condition_binding.dart';
import '../../features/user_info/terms_condition/views/terms_condition_view.dart';
import '../common/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../common/bottom_nav_bar/views/bottom_nav_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_FLOW,
      page: () => const BookFlowView(),
      binding: BookFlowBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.BottomNavBar,
      page: () => BottomnavbarView(),
      binding: BottomnavbarBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_SUCCESSFUL,
      page: () => const VerificationSuccessfulView(),
      binding: VerificationSuccessfulBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAILS,
      page: () => const BookDetailsView(),
      binding: BookDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALIZE_BOOK,
      page: () => const PersonalizeBookView(),
      binding: PersonalizeBookBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_PHOTO,
      page: () => const UploadPhotoView(),
      binding: UploadPhotoBinding(),
    ),
    GetPage(
      name: _Paths.CART_ORDER,
      page: () => const CartOrderView(),
      binding: CartOrderBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_DETAILS,
      page: () => const AddressDetailsView(),
      binding: AddressDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => const PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_PREVIEW,
      page: () => const BookPreviewView(),
      binding: BookPreviewBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO,
      page: () => const ProfileInfoView(),
      binding: ProfileInfoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.SHIPPING_ADDRESS,
      page: () => const ShippingAddressView(),
      binding: ShippingAddressBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => const AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => const TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDER,
      page: () => const MyOrderView(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROMO_CODE,
      page: () => const PromoCodeView(),
      binding: PromoCodeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTINGS,
      page: () => const NotificationSettingsView(),
      binding: NotificationSettingsBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
