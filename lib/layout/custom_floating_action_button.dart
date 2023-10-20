import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Color? fillColor;
  final VoidCallback? onPressed;
  final String? text;

  const CustomFloatingActionButton(
      {required this.onPressed, this.fillColor, this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 0.0,
              blurRadius: 0.0,
            ),
          ]),
      width: 342.w,
      height: 56.h,
      child: RawMaterialButton(
        fillColor: fillColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MoimDetailFloatingActionButton extends StatelessWidget {
  const MoimDetailFloatingActionButton(
      {required this.onTap, required this.iconOnPressed, required this.isBookMark, super.key});

  final void Function() onTap;
  final void Function() iconOnPressed;
  final bool isBookMark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 55.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isBookMark ? MIXIN_ : MIXIN_BLACK_5,
          ),
          child: IconButton(
            icon: Image.asset(
              'assets/images/icons/subscribe_icon.png',
              color: isBookMark ? null : MIXIN_BLACK_4,
              width: 26.w,
              height: 26.h,
            ),
            onPressed: iconOnPressed,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 279.w,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: MIXIN_POINT_COLOR,
            ),
            alignment: Alignment.center,
            child: Text(
              '가입요청하기',
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'SUIT',
                fontWeight: FontWeight.w600,
                color: WHITE,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
