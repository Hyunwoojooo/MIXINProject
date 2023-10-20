import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

import '../../../layout/appbar_layout.dart';

class MainProfileSetting extends StatefulWidget {
  MainProfileSetting({super.key});

  @override
  State<MainProfileSetting> createState() => _MainProfileSettingState();
}

class _MainProfileSettingState extends State<MainProfileSetting> {
  bool isToggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '설정',
                ),
                SizedBox(height: 41.h),
                Text(
                  '계정',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: MIXIN_47,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomTextButton(
                  onPressed: () {},
                  text: '계정관리',
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: '학교 인증',
                ),
                SizedBox(height: 15.h),
                Text(
                  '앱 설정',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: MIXIN_47,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomTextButton(
                  onPressed: () {},
                  text: '알람 및 소리',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      text: '방해금지 시간 설정',
                    ),
                    CupertinoSwitch(
                      activeColor: MIXIN_POINT_COLOR,
                      value: isToggleSwitch,
                      onChanged: (value) {
                        setState(() {
                        isToggleSwitch = value;
                        print(value);
                        });
                      },
                    ),
                  ],
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: '커피챗 설정',
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: '신고 관리',
                ),
                SizedBox(height: 15.h),
                Text(
                  '기타',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: MIXIN_47,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomTextButton(
                  onPressed: () {},
                  text: '공지사항',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      text: '언어 설정',
                    ),
                    Text(
                      '한국어',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    )
                  ],
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: '로그아웃',
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: '탈퇴',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  String text;
  void Function() onPressed;

  CustomTextButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(left: 0, top: 9.h, bottom: 9.h, right: 160.w),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: MIXIN_47,
        ),
      ),
    );
  }
}
