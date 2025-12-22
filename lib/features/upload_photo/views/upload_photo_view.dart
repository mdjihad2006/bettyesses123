import 'package:bettyesses123/app/common/images/app_images.dart';
import 'package:bettyesses123/app/common/widgets/app_appbar.dart';
import 'package:bettyesses123/app/common/widgets/custom_gradient_button.dart';
import 'package:bettyesses123/app/common/widgets/image_picker.dart';
import 'package:bettyesses123/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';


import 'package:get/get.dart';

import '../controllers/upload_photo_controller.dart';

class UploadPhotoView extends GetView<UploadPhotoController> {
  const UploadPhotoView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppAppbar(title: 'Upload Your Child’s Photo',),
              SizedBox(height: 20.h,),
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(12),
                  strokeWidth: 1,
                  dashPattern: [5,5],
                  color: Colors.blue
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Obx((){
                    return controller.selectedImage.value == null
                        ? _uploadImage(controller)
                        : _selectedImageView(controller);
                  })
                ),
              ),
              SizedBox(height: 40.h,),
              GradientElevatedButton(text: 'Personalize & Preview', onPressed: (){
                Get.toNamed(Routes.BOOK_PREVIEW);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadImage(ImagePickerController controller) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.notUpload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.cancel,color: Colors.red,)
                              )
                            )
                          ],
                        ),
                        SizedBox(width: 15.w,),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.notUpload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.cancel,color: Colors.red,)
                                )
                            )
                          ],
                        ),
                        SizedBox(width: 15.w,),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.notUpload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.cancel,color: Colors.red,)
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.upload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.check_circle,color: Colors.green,)
                                )
                            )
                          ],
                        ),
                        SizedBox(width: 15.w,),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.upload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.check_circle,color: Colors.green,)
                                )
                            )
                          ],
                        ),
                        SizedBox(width: 15.w,),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              child: Image.asset(
                                AppImages.upload,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.check_circle,color: Colors.green,)
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Text('Upload a photo of your child',style: TextStyle(fontSize: 17.sp,color: Colors.black87),),
                    SizedBox(height: 20.h,),
                    InkWell(
                      onTap: () {
                        controller.pickFromGallery();
                      },
                      child: Container(
                        height: 50.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20.w,),
                            Icon(Icons.upload,color: Colors.blue,size: 25.sp,),
                            Spacer(),
                            Text('Upload Photo',style: TextStyle(fontSize: 17.sp,color: Colors.blue),),
                            SizedBox(width: 20.w,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text('PNG, JPG up to 10MB'),
                    SizedBox(height: 20.h,),
                  ]
                );
  }
  Widget _selectedImageView(ImagePickerController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(110),
                  child: Image.file(
                    controller.selectedImage.value!,
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: controller.removeImage,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Text('The image looks perfect',style: TextStyle(color: Color(0xffCE6FFF,),fontSize: 16.sp),),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

}
