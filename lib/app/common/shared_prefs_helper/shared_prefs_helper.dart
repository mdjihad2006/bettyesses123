import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _accessTokenKey = 'token';
  static const String _refreshTokenKey = 'refreshtoken';
  static const String _userProfileImage = 'profileImage';
  static const String _userName = 'userName';
  static const String _userPhoneNumber = 'userPhoneNumber';
  static const String _userEmail = 'userEmail';
  static const String _fcmToken = 'fcmtoken';
  static const String _userID = 'userID';
  static const String _ageRange = 'agerange';
  static const String _userRole = 'agerange';
  static const String _isVerified = 'isVerified';

  // Save access token
  static Future<void> saveAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  static Future<void> saveUserRole(String role) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userRole, role);
  }

  static Future<String?> getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRole);
  }

  // Retrieve access token
  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Save USER ID
  static Future<void> saveUserID(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userID, id);
  }

  // Retrieve User ID
  static Future<String?> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userID);
  }

  // Save agerange
  static Future<void> saveAgeRange(String agerange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_ageRange, agerange);
  }

  // Retrieve ageRange
  static Future<String?> getAgeRange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_ageRange);
  }

  // Save FCM token
  static Future<void> saveFCMToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcmToken, token);
  }

  // Retrieve FCM token
  static Future<String?> getFCMToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcmToken);
  }

  // Save refreash token
  static Future<void> saveRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshTokenKey, token);
  }

  // Retrieve refreash token
  static Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  // Clear access token
  static Future<void> clearAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove('isLogin');
  }

  // Save user profile image
  static Future<void> saveUserProfileImage(String profileImage) async {
    if (kDebugMode) {
      print('Profile Image At Shared Pref: $profileImage');
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userProfileImage, profileImage);
  }

  // Retrieve user profile image
  static Future<String?> getUserProfileImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userProfileImage);
  }

  // Save user name
  static Future<void> saveUserName(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, username);
  }

  // Retrieve user name
  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }

  // Save user phone number
  static Future<void> saveUserPhoneNumber(String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPhoneNumber, phoneNumber);
  }

  // Retrieve user phone number
  static Future<String?> getUserPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPhoneNumber);
  }

  // Save user Emailaddress
  static Future<void> saveUserEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmail, email);
  }

  // Retrieve user address
  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmail);
  }
  // Save user isverifyed
  static Future<void> saveUserVerified(bool isVerified) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isVerified, isVerified);
  }

  // Retrieve user address
  static Future<bool> getUserVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isVerified) ?? false;
  }
  // Logout user and clear all data
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
