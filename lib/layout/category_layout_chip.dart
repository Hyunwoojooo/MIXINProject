import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

class CategoryLayoutChip extends StatelessWidget {
  const CategoryLayoutChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: MIXIN_,
        borderRadius: BorderRadius.circular(14.5.r),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/category_images/design.png', width: 15.w, height: 15.h, fit: BoxFit.contain,),
          SizedBox(width: 6.w),
          Text(
            '디자인',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: MIXIN_POINT_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
