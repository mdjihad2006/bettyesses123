class AppUrls {
  static const String baseUrl = 'http://206.162.244.175:6005/api/v1';
  static const String signUp = '$baseUrl/auth/create-account';
  static const String signIn = '$baseUrl/auth/login';
  static const String forgetPassword = '$baseUrl/auth/forgot-password';
  static const String verifyOtp = '$baseUrl/auth//email-verify';
  static const String forgotVerifyOtp = '$baseUrl/auth/verify-reset-password-otp';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String changePassword = '$baseUrl/auth/change-password';
  static const String userProfile = '$baseUrl/users/profile';
  static const String resendOtp = '$baseUrl/auth/resend-otp';
  static const String getAllBookTemp = '$baseUrl/books/templates';
  static const String userDetails = '$baseUrl/books';
  static const String cart = '$baseUrl/cart';
  static const String signInWithGoogle = 'https://api.dmvjobs.cloud/api/v1/auth/google-login';
  static const String menuItem = '$baseUrl/profile/me';
  static const String updateProfile = '$baseUrl/profile/update';
  static const String postAddress = '$baseUrl/shipping-addresses';
  static const String shippingAddress = '$baseUrl/shipping-addresses';
  static const String changePass = '$baseUrl/profile/change-password';
  static const String profilePic = '$baseUrl/profile/upload-image';
  static const String orders = '$baseUrl/orders';
  static const String myOrders = '$baseUrl/orders/my-orders?page=1&limit=10&sortBy=createdAt&sortOrder=desc';
  static const String terms = '$baseUrl/legal/public/terms';
  static const String privacyPolicy = '$baseUrl/legal/public/privacy';
  static const String getNotification = '$baseUrl/notifications';
  static const String unreadNotification = '$baseUrl/notifications/unread-count';


  /// all job list
  static  String getAlljobsList(int limit) => '$baseUrl/services/available?limit=$limit';
  static  String getServiceDetails(String id) => '$baseUrl/services/$id/details-with-provider';
  static  String uploadChildImg(String bookId) => '$baseUrl/books/$bookId/upload-photo';
  static  String cancelOrder(String orderId) => '$baseUrl/orders/$orderId/cancel';
}