import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../components/custom_textformfield.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';
import 'signup_screen_password.dart';

class SignUpScreenEmail extends StatefulWidget {
  const SignUpScreenEmail({Key? key}) : super(key: key);

  @override
  State<SignUpScreenEmail> createState() => _SignUpScreenEmailState();
}

class _SignUpScreenEmailState extends State<SignUpScreenEmail> {
  final storage = const FlutterSecureStorage();
  final Dio dio = Dio();
  final String emailSendUrl = 'http://$ip/join/email/send';
  final String emailCheckUrl = 'http://$ip/join/email/check';

  List<int> studentNumber = List<int>.generate(24, (index) => index + 1);
  final _userEmailTextEditController = TextEditingController();
  final _userCodeController = TextEditingController();

  bool onClickSendButton = false;
  bool nextButton = false;

  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';
  List<String> checkCodeText = ['인증 완료', '인증 실패'];
  int isCheckCode = 0;

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
  }

  @override
  void dispose() {
    super.dispose();
    _userEmailTextEditController.dispose();
    _userCodeController.dispose();
  }

// 인증번호 확인
  void checkCode() async {
    final Response resp = await dio.post(emailCheckUrl, data: {
      "userEmail": _userEmailTextEditController.text,
      "code": _userCodeController.text,
    });
    print(resp);
    print(resp.data['code']);
    if (resp.data['code'] == 1) {
      isCheckCode = 1;
    } else if (resp.data['code'] == -1) {
      isCheckCode = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 45.h),
                const HeadlineText(text: '학교 이메일에서\n인증번호를 입력해주세요!'),
                SizedBox(height: 50.0.h),
                const InfoText(text: '학교 이메일'),
                SizedBox(height: 12.0.h),
                CustomTextFormField(
                  controller: _userEmailTextEditController,
                  hintText: '학교 이메일을 작성해주세요',
                  onChanged: ((value) {
                    setState(() {});
                  }),
                ),
                SizedBox(height: 14.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: onClickSendButton == true ? true : false,
                      child: Container(
                        width: 216.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.r),
                          border: Border.all(
                            color: B_5,
                            width: 1.5.w,
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 8.0.h),
                              width: 140.w,
                              height: 56.h,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                scrollPadding: EdgeInsets.zero,
                                controller: _userCodeController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                cursorColor: Colors.grey,
                                obscureText: false,
                                autofocus: false,
                                onChanged: (String value) {
                                  _userCodeController.text = value;
                                  if (_userCodeController.text.length == 6) {
                                    setState(() {
                                      nextButton = true;
                                      checkCode();
                                    });
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 20.h),
                                  hintText: '인증번호 입력',
                                  hintStyle: TextStyle(
                                    color: B_4,
                                    fontSize: 16.0.sp,
                                    fontFamily: 'SUIT',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  fillColor: Colors.grey,
                                  filled: false,
                                  // 모든 Input 상태의 기본 스타일 세팅
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  // focus 일 때 세팅
                                  focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))
                                      .copyWith(
                                          borderSide: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.5.w),
                                  ).borderSide
                                          // .copyWith(color: Colors.red)),
                                          ),
                                ),
                              ),
                            ),
                            Text(
                              '$minutes:$seconds',
                              style: TextStyle(
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0.sp,
                                color: P_1,
                              ),
                            ),
                            SizedBox(width: 8.w),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (isCheckCode == 1 || isCheckCode == -1)
                          Text(
                            isCheckCode == 1
                                ? checkCodeText[0]
                                : checkCodeText[1],
                            style: TextStyle(
                              fontFamily: 'SUIT',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isCheckCode == 1
                                  ? P_1
                                  : Colors.red,
                            ),
                          ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 8.h),
                              backgroundColor:
                                  _userEmailTextEditController.text.isNotEmpty
                                      ? P_1
                                      : B_4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r)),
                              elevation: 0.0),
                          onPressed: () async {
                            _userEmailTextEditController.text =
                                _userEmailTextEditController.text.trim();
                            if (_userEmailTextEditController.text.isNotEmpty) {
                              setState(() {
                                onClickSendButton = true;
                              });
                              startTimer();
                              print(_userEmailTextEditController.text);
                              final Response resp =
                                  await dio.post(emailSendUrl, data: {
                                "userEmail": _userEmailTextEditController.text,
                              });
                              print(resp);
                            } else {
                              null;
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              onClickSendButton == false
                                  ? sendText
                                  : sendAgainText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 340.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isCheckCode == 1
                            ? P_1
                            : B_4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r)),
                        elevation: 0.0),
                    onPressed: () async {
                      if (isCheckCode == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignUpScreenPassword()),
                        );
                        await storage.write(
                            key: 'userEmail',
                            value: _userEmailTextEditController.text);
                      } else {
                        null;
                      }
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignUpScreenPassword()),
                      // );
                    },
                    child: SizedBox(
                      width: 342.w,
                      height: 56.h,
                      child: Center(
                        child: Text(
                          '다음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'SUIT',
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
