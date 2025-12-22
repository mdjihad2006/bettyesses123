import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/const/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    // textTheme: GoogleFonts.outfitTextTheme().apply(
    //   bodyColor: Colors.black87,
    //   displayColor: Colors.black87,
    // ),

    // ---------------- Elevated Button ----------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.outfit(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        elevation: 3,
      ),
    ),

    // ---------------- Outlined Button ----------------
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blueAccent, width: 1.5),
        foregroundColor: Colors.blueAccent,
        textStyle: GoogleFonts.outfit(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      ),
    ),

    // ---------------- InputDecoration Theme (TextField) ----------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(width: 1.5, color: Colors.red),
      ),
      hintStyle: GoogleFonts.outfit(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade500,
      ),
      labelStyle: GoogleFonts.outfit(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
    ),

    scaffoldBackgroundColor: AppColor.primaryColor,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.outfit(
        fontSize: 18.sp,
        color: AppColor.textonPrimaryColor,
      ),
      headlineMedium: GoogleFonts.outfit(
        fontSize: 16.sp,
        color: AppColor.textonPrimaryColor,
      ),
      headlineSmall: GoogleFonts.outfit(
        fontSize: 14.sp,
        color: AppColor.textonPrimaryColor,
      ),

      titleLarge: GoogleFonts.outfit(
        fontSize: 24.sp,
        color: AppColor.textSecoundaryColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 14.sp,
        color: AppColor.textSecoundaryColor,
      ),
      titleSmall: GoogleFonts.outfit(
        fontSize: 12.sp,
        color: AppColor.textSecoundaryColor,
      ),

      bodyLarge: GoogleFonts.outfit(
        fontSize: 16.sp,
        color: AppColor.textSecoundaryColor,
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 14.sp,
        color: AppColor.textSecoundaryColor,
      ),
      bodySmall: GoogleFonts.outfit(
        fontSize: 12.sp,
        color: AppColor.textSecoundaryColor,
      ),

      labelLarge: GoogleFonts.outfit(
        fontSize: 12.sp,
        color: AppColor.greeColor,
      ),
      labelMedium: GoogleFonts.outfit(
        fontSize: 10.sp,
        color: AppColor.greeColor,
      ),
      labelSmall: GoogleFonts.outfit(fontSize: 8.sp, color: AppColor.greeColor),
    ),
  );
}
