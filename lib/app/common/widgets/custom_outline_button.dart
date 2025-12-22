import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomOutlineButton({
    super.key,
    required this.onPressed, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),

          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _GradientBorderPainter(
                  radius: 12.r,
                  strokeWidth: 1,
                  gradient: LinearGradient(colors: [Color(0xff6C8CFF),Color(0xff6C8CFF)]),
                ),
              ),
            ),
            // Button content
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                child: child
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _GradientBorderPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawRRect(rrect.deflate(strokeWidth / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
