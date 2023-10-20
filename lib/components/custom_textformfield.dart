import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscrueText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final dynamic inputFormatters;
  final double? width;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final int? maxLines;
  final double? height;
  final Widget? suffixIcon;
  final Color? fillColor;

  const CustomTextFormField({
    this.controller,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.autoFocus = false,
    this.obscrueText = false,
    this.errorText,
    this.inputFormatters,
    this.suffixIcon,
    this.width,
    this.borderColor,
    this.maxLines,
    this.height,
    this.fillColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
    return Container(
      width: width ?? 342.w,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: borderColor ?? MIXIN_BLACK_5,
          width: 1.5.w,
        ),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        style: TextStyle(
          fontFamily: 'SUIT',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: MIXIN_BLACK_1,
          decorationThickness: 0,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: MIXIN_BLACK_4,
        inputFormatters: inputFormatters,
        obscureText: obscrueText,
        autofocus: autoFocus,
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(
            color: MIXIN_BLACK_4,
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? WHITE,
          filled: true,
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
// Clear
