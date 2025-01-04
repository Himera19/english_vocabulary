import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SynonymItem extends StatelessWidget {
  final String content;
  const SynonymItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.w, color: Colors.grey),
          borderRadius: BorderRadius.circular(30.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
        child: Text(
          content,
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
      ),
    );
  }
}
