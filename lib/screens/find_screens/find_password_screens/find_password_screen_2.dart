import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../const/colors.dart';
import 'find_password_email_screen.dart';
import 'find_password_sns_screen.dart';
/*
  통신사 선택된 것만 색 다른 색으로 하게 O
  인증번호 6개가 입력됐을 경우에만 다음버튼 활성화 O
 */

class FindPasswordScreen2 extends StatefulWidget {
  const FindPasswordScreen2({Key? key}) : super(key: key);

  @override
  State<FindPasswordScreen2> createState() => _FindPasswordScreen2State();
}

class _FindPasswordScreen2State extends State<FindPasswordScreen2> {
  final storage = const FlutterSecureStorage();
  final String serverUrl = 'http://122.37.227.143:8080/api/sms/send';

  bool isEmailButtonOn = false;
  bool isSnsButtonOn = false;

  bool nextButton = false;

  bool onClickSendButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: -35.w,
          title: GestureDetector(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/back_icon_black_4x.png',
                      width: 26.w,
                      height: 26.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 104.w),
                    Text(
                      '비밀번호 찾기',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: MIXIN_BLACK_1,
                      ),
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 29.h),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: MIXIN_BLACK_5,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Text(
                      '비밀번호를 찾기 위해 정보를 입력해주세요',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: MIXIN_POINT_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 96.h),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 33.w,
                      right: 25.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    backgroundColor:
                        isEmailButtonOn ? MIXIN_ : Colors.transparent,
                    side: BorderSide(
                      width: 1.5.w,
                      color: isEmailButtonOn ? MIXIN_2 : MIXIN_BLACK_5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isEmailButtonOn = !isEmailButtonOn;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const FindPasswordEmailScreen()));
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이메일로 코드 받기',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_1,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'wltnek98@*******',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500,
                              color: MIXIN_BLACK_3,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/icons/send_email_icon.png',
                        width: 48.w,
                        height: 48.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 33.w,
                      right: 25.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    backgroundColor:
                        isSnsButtonOn == true ? MIXIN_ : Colors.transparent,
                    side: BorderSide(
                      width: 1.5.w,
                      color: isSnsButtonOn == true ? MIXIN_2 : MIXIN_BLACK_5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isSnsButtonOn = !isSnsButtonOn;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FindPasswordSnsScreen()));
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SNS로 코드 받기',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_1,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '010 3342 8798',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500,
                              color: MIXIN_BLACK_3,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/icons/send_sns_icon.png',
                        width: 48.w,
                        height: 48.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
