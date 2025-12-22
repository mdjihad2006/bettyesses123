import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleNSub extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleNSub({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 30,color: Colors.black87,fontWeight: FontWeight.w600),),
        SizedBox(height: 5.h,),
        Text(subtitle,style: TextStyle(fontSize: 19,color: Colors.black54,fontWeight: FontWeight.w500)),
        SizedBox(height: 20.h,),
      ],
    );
  }
}