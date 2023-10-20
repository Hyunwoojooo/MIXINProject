import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

// ignore: must_be_immutable
class AppbarLayout extends StatelessWidget {
  AppbarLayout({required this.onPressed, super.key});

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Image.asset(
          'assets/images/icons/new_back_black_icon.png',
          height: 26.h,
        ),
      ),
    );
  }
}

class AppbarIconTextLayout extends StatelessWidget {
  void Function() onPressed;
  String text;
  AppbarIconTextLayout({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Image.asset(
              'assets/images/icons/new_back_black_icon.png',
              height: 26.h,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: MIXIN_BLACK_1,
            ),
          ),
        ],
      ),
    );
  }
}


class AppbarCloseLayout extends StatelessWidget {
  AppbarCloseLayout({required this.onPressed, super.key});

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 33.h),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          constraints: BoxConstraints.tight(Size(26.w, 26.h)),
          icon: Image.asset(
            'assets/images/icons/close_icon_black_3x.png',
            height: 26.h,
            width: 26.w,
          ),
        ),
      ],
    );
  }
}

class AppbarTextLayout extends StatelessWidget {
  String text;

  AppbarTextLayout({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 33.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: MIXIN_BLACK_1,
          ),
        ),
      ],
    );
  }
}
