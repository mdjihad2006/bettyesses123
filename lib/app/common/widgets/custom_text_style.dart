import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  // Global default gradient
  static const Gradient defaultGradient = LinearGradient(
    colors: [Color(0xFFE8A6B1), Color(0xFF9B6ACD)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static TextStyle _baseStyle(
    double size,
    FontWeight weight,
    Color? color,
    bool gradient,
    Gradient? customGradient,
  ) {
    final style = GoogleFonts.outfit(
      fontSize: size.sp,
      fontWeight: weight,
      color: gradient ? null : (color ?? Colors.black87),
    );

    if (!gradient) return style; // Normal color

    return style.copyWith(
      foreground: Paint()
        ..shader = (customGradient ?? defaultGradient).createShader(
          const Rect.fromLTWH(0, 0, 200, 70),
        ),
    );
  }

  static TextStyle t10({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    10,
    weight ?? FontWeight.normal,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t12({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    12,
    weight ?? FontWeight.normal,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t14({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    14,
    weight ?? FontWeight.normal,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t16({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    16,
    weight ?? FontWeight.w500,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t18({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    18,
    weight ?? FontWeight.w500,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t20({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    20,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t22({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    22,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t24({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    24,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t26({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    26,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t28({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    28,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );

  static TextStyle t30({
    Color? color,
    FontWeight? weight,
    bool gradient = false,
    Gradient? customGradient,
  }) => _baseStyle(
    30,
    weight ?? FontWeight.bold,
    color,
    gradient,
    customGradient,
  );
}
