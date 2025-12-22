import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepIndicator extends StatelessWidget {
  final int step;
  const StepIndicator({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(width: 35),
            Text('Step 1'),
            Spacer(),
            Text('Step 2'),
            Spacer(),
            Text('Step 3'),
            SizedBox(width: 35),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          children: List.generate(
            3,
                (index) => Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: EdgeInsets.only(right: index == 2 ? 0 : 5.w),
                height: 10.h,
                decoration: BoxDecoration(
                  color: step > index
                      ? const Color(0xFF7B61FF)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
