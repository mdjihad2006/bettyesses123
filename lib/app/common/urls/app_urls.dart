class AppUrls {
  static const String baseUrl = 'http://206.162.244.175:6005/api/v1';
  static const String signUp = '$baseUrl/auth/create-account';
  static const String uploadDocuments = '$baseUrl/users/profile/documents';
  static const String signIn = '$baseUrl/auth/login';
  static const String forgetPassword = '$baseUrl/auth/forgot-password';
  static const String verifyOtp = '$baseUrl/auth//email-verify';
  static const String forgotVerifyOtp = '$baseUrl/auth/verify-reset-password-otp';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String changePassword = '$baseUrl/auth/change-password';
  static const String createService = '$baseUrl/services';
  static const String userProfile = '$baseUrl/users/profile';
  static const String resendOtp = '$baseUrl/auth/resend-otp';


  /// all job list
  static  String getAlljobsList(int limit) => '$baseUrl/services/available?limit=$limit';
  static  String getServiceDetails(String id) => '$baseUrl/services/$id/details-with-provider';
}