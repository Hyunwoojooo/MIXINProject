import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class CategoryLayoutRound extends StatelessWidget {
  final double? mainSizedBoxHeight;
  final double? mainSizedBoxWidth;
  final Color borderSideColor;
  final Color? backgroundColor;
  final Color? containerColor;
  final VoidCallback? onPressed;
  final String? imageAsset;
  final String? text;

  const CategoryLayoutRound(
      {this.mainSizedBoxWidth,
      this.text,
      required this.borderSideColor,
      required this.onPressed,
      this.imageAsset,
      this.containerColor,
      this.backgroundColor,
      this.mainSizedBoxHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderSideColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.r),
        ),
        padding:
            EdgeInsets.only(left: 12.w, right: 16.w, top: 9.h, bottom: 9.h),
        elevation: 0.0,
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '$imageAsset',
            width: 26.w,
            height: 26.h,
          ),
          SizedBox(width: 8.w),
          Text(
            '$text',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
              color: B_1,
            ),
          ),
        ],
      ),
    );
  }
}
