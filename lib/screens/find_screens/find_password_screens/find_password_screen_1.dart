import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/custom_textformfield.dart';
import '../../../const/colors.dart';
import '../../../layout/text_layout.dart';
import 'find_password_screen_2.dart';

/*
  통신사 선택된 것만 색 다른 색으로 하게 O
  인증번호 6개가 입력됐을 경우에만 다음버튼 활성화 O
 */

class FindPasswordScreen1 extends StatefulWidget {
  const FindPasswordScreen1({Key? key}) : super(key: key);

  @override
  State<FindPasswordScreen1> createState() => _FindPasswordScreen1State();
}

class _FindPasswordScreen1State extends State<FindPasswordScreen1> {
  final storage = const FlutterSecureStorage();
  final String serverUrl = 'http://122.37.227.143:8080/api/sms/send';
  final _userNameTextEditController = TextEditingController();
  final _userPhoneNumberTextController = TextEditingController();
  final _userCertificationNumberController = TextEditingController();

  int hello() {
    return 0;
  }

  bool nextButton = false;

  bool onClickSendButton = false;
  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';

  String userName = '';
  String userPhoneNumber = '';
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

  int? newsAgency;
  String selectAgency = '통신사';
  String kt = 'KT';
  String skt = 'SKT';
  String lg = 'LG';
  String akt = 'KT 알뜰폰';
  String askt = 'SKT 알뜰폰';
  String alg = 'LG 알뜰폰';

  void changeAgency() {
    if (newsAgency == 0) {
      selectAgency = kt;
    }
    if (newsAgency == 1) {
      selectAgency = skt;
    }
    if (newsAgency == 2) {
      selectAgency = lg;
    }
    if (newsAgency == 3) {
      selectAgency = akt;
    }
    if (newsAgency == 4) {
      selectAgency = askt;
    }
    if (newsAgency == 5) {
      selectAgency = alg;
    }
  }

  List<Widget> items = [
    Text(
      'KT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    const Text(
      'SKT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'LG',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'KT 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'SKT 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
    const Text(
      'LG 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0),
    ),
  ];

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
                        fontFamily: 'SUIT',
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
                      '비밀번호를 찾기 위해 정보를 입력해주세요',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 74.h),
                const InfoText(text: '이름'),
                SizedBox(height: 12.0.h),
                CustomTextFormField(
                  controller: _userNameTextEditController,
                  hintText: '이메일 또는 휴대전화번호를 입력해주세요',
                  onChanged: (String value) async {
                    userName = value;
                  },
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
                    // onPressed: () async {
                    //   if (nextButton == true) {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //           builder: (context) => const SignUpScreenSchool()),
                    //     );
                    //     await storage.write(key: 'userName', value: userName);
                    //     await storage.write(
                    //         key: 'userAgent', value: selectAgency);
                    //     await storage.write(
                    //         key: 'userPhoneNumber', value: userPhoneNumber);
                    //     print('이름 : $userName');
                    //     print('통신사 : $selectAgency');
                    //     print('전화번호 : $userPhoneNumber');
                    //   } else {
                    //     null;
                    //   }
                    // );
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const FindPasswordScreen2()),
                      );
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
