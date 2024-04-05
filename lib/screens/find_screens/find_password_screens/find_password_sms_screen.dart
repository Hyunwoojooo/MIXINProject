import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../const/colors.dart';
import '../../signup/signup_screens/signup_screen_school.dart';
/*
  통신사 선택된 것만 색 다른 색으로 하게 O
  인증번호 6개가 입력됐을 경우에만 다음버튼 활성화 O
 */

class FindPasswordSnsScreen extends StatefulWidget {
  const FindPasswordSnsScreen({Key? key}) : super(key: key);

  @override
  State<FindPasswordSnsScreen> createState() => _FindPasswordSnsScreenState();
}

class _FindPasswordSnsScreenState extends State<FindPasswordSnsScreen> {
  final storage = const FlutterSecureStorage();
  final String serverUrl = 'http://122.37.227.143:8080/api/sms/send';
  final _userNameTextEditController = TextEditingController();
  final _userPhoneNumberTextController = TextEditingController();
  final _userCertificationNumberController = TextEditingController();

  bool nextButton = false;

  bool onClickSendButton = false;
  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';

  late String userCertificationNumber;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCertificationNumber = '';
  }

  @override
  void dispose() {
    _userNameTextEditController.dispose();
    _userPhoneNumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
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
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
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
                      color: B_5,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Text(
                      '비밀번호 재설정 코드를 받으실 방법을 선택해주세요',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 33.w,
                      right: 25.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    backgroundColor: P_3,
                    side: BorderSide(
                      width: 1.5.w,
                      color: P_2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '메시지로 코드 받기',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: B_1,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '010 3342 8798',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: B_3,
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
                SizedBox(height: 408.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: userCertificationNumber.length == 6
                            ? P_1
                            : B_4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        elevation: 0.0),
                    onPressed: () async {
                      if (nextButton == true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreenSchool()),
                        );
                      } else {
                        null;
                      }
                    },
                    child: SizedBox(
                      width: 342.w,
                      height: 56.h,
                      child: Center(
                        child: Text(
                          '확인',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
