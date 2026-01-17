import 'dart:io';

import 'package:bettyesses123/app/common/network_service/network_service.dart';
import 'package:bettyesses123/app/common/urls/app_urls.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:bettyesses123/features/home/menu/controllers/menu_controller.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final networkCaller = NetworkCaller();
  final menuController = Get.find<MyMenuController>();

  RxBool isLoading = false.obs;
  RxBool isImageUploading = false.obs;

  // Image picker
  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    _setDataFromMenu();
  }

  void _setDataFromMenu() {
    final user = menuController.userData.value;
    if (user != null) {
      firstNameController.text = user.firstName;
      lastNameController.text = user.lastName;
      emailController.text = user.email;
    }
  }

  Future pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }


  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      print('🔍 Checking SharedPreferences for token...');
      print('🔐 Token found: ${token != null ? "Yes" : "No"}');

      if (token != null) {
        print('📝 Token (first 50 chars): ${token.substring(0, token.length > 50 ? 50 : token.length)}...');
      }

      return token;
    } catch (e) {
      print('❌ Error getting token: $e');
      return null;
    }
  }

  Future<void> uploadProfileImage() async {
    if (selectedImage.value == null) {
      return;
    }

    try {
      isImageUploading.value = true;

      // Get token
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        isImageUploading.value = false;
        Get.snackbar(
            'Error',
            'Authentication token not found. Please login again.',
            backgroundColor: Colors.red,
            colorText: Colors.white
        );
        return;
      }

      Dio dio = Dio();

      // Get the file path
      String filePath = selectedImage.value!.path;

      // Create FormData
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          filePath,
          filename: filePath.split('/').last,
        ),
      });

      print('🔐 Token being sent: ${token.substring(0, 50)}...');
      print('📤 Uploading to: ${AppUrls.profilePic}');
      print('📁 File path: $filePath');

      Response response = await dio.post(
        AppUrls.profilePic,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      isImageUploading.value = false;

      print('📥 Upload response status: ${response.statusCode}');
      print('📥 Upload response data: ${response.data}');

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Image uploaded successfully',
            backgroundColor: Colors.green, colorText: Colors.white);


        await menuController.getMenu();
      } else {
        Get.snackbar('Error', 'Image upload failed',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } on DioException catch (e) {
      isImageUploading.value = false;
      print('❌ DioException: ${e.type}');
      print('❌ Status code: ${e.response?.statusCode}');
      print('❌ Response data: ${e.response?.data}');
      print('❌ Error message: ${e.message}');

      Get.snackbar(
          'Error',
          'Upload failed: ${e.response?.data?['message'] ?? e.message}',
          backgroundColor: Colors.red,
          colorText: Colors.white
      );
    } catch (e) {
      isImageUploading.value = false;
      print('❌ Upload error: $e');
      Get.snackbar('Error', 'Image upload failed: ${e.toString()}',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> updateProfile() async {
    isLoading.value = true;

    final response = await networkCaller.patchRequest(
        url: AppUrls.updateProfile,
        body: {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text
        });

    isLoading.value = false;

    if (response.isSuccess) {
      Get.snackbar('Success', 'Profile updated successfully',
          backgroundColor: Colors.green, colorText: Colors.white);

      // Refresh menu to show updated data
      await menuController.getMenu();

      Get.offNamed(Routes.BottomNavBar);
    } else {
      Get.snackbar('Error', 'Profile update failed',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  String getFullImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) return '';
    if (imagePath.startsWith('http')) return imagePath;
    return 'http://206.162.244.175:6005$imagePath';
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}