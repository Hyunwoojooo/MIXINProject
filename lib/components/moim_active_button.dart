import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoimActiveButton extends StatelessWidget {
  Color? backgroundColor;
  Color borderColor;
  Color? textColor;
  String text;
  void Function() onPressed;
  MoimActiveButton(
      {super.key, required this.onPressed, required this.text, this.backgroundColor, required this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: 80.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            elevation: 0.0,
            side: BorderSide(
              color: borderColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'SUIT',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
