import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

class TagLayout extends StatelessWidget {
  const TagLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: P_3,
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(right: 4.w),
      child: Text(
        '#하하하하',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: P_1,
        ),
      ),

    );
  }
}
