import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mixin_mac_2/screens/find_screens/find_password_screens/find_password_screen_1.dart';
import 'package:mixin_mac_2/screens/login_screen.dart';

import '../../components/custom_textformfield.dart';
import '../../components/number_formatter.dart';
import '../../const/colors.dart';
import '../../const/data.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/text_layout.dart';
import '../signup/signup_screens/signup_screen_school.dart';

/*
  통신사 선택된 것만 색 다른 색으로 하게 O
  인증번호 6개가 입력됐을 경우에만 다음버튼 활성화 O
 */

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({Key? key}) : super(key: key);

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  Dio dio = Dio();

  // 아이디 - 휴대폰 인증
  final String findIdApiUrl = 'http://$ip/find/id';
  final String findIdCheckUserApiUrl = 'http://$ip/find/id/check';

  // 비밀번호 - 휴대폰 인증
  // final String serverUrl = 'http://$ip/find/password/sms';
  // 비밀번호 - 이메일 인증
  // final String serverUrl = 'http://$ip/find/password/email';
  // 비밀번호 - 휴대폰, 이메일 확인
  // final String serverUrl = 'http://$ip/find/password';

  final _userNameTextEditController = TextEditingController();
  final _userPhoneNumberTextController = TextEditingController();
  final _userCodeController = TextEditingController();
  String userEmail = '';

  // 0 : 초기값, 1: 성공, -1: 실패
  int isCheckCode = 0;
  int isCheckUser = 0;

  int hello() {
    return 0;
  }

  // 인증번호 보내기
  void checkUser() async {
    dio.options.validateStatus = (status) {
      // 400 이상의 상태 코드도 성공으로 처리
      return status! >= 200 && status <= 500;
    };
    print(_userPhoneNumberTextController.text);

    _userPhoneNumberTextController.text =
        _userPhoneNumberTextController.text.replaceAll(RegExp('\\s'), "");
    print(_userPhoneNumberTextController.text);
    final Response resp = await dio.post(findIdApiUrl, data: {
      "userName": _userNameTextEditController.text,
      "userPhoneNumber": _userPhoneNumberTextController.text,
      // "userPhoneNumber": userPhoneNumber,
    });
    print(resp);
    if (resp.data['code'] == 1) {
      setState(() {
        isCheckUser = 1;
        startTimer();
      });
    } else if (resp.data['code'] == -1) {
      setState(() {
        isCheckUser = -1;
      });
    }
  }

  // 인증번호 확인
  void checkCode() async {
    dio.options.validateStatus = (status) {
      // 400 이상의 상태 코드도 성공으로 처리
      return status! >= 200 && status <= 500;
    };

    _userPhoneNumberTextController.text =
        _userPhoneNumberTextController.text.replaceAll(RegExp('\\s'), "");
    final Response resp = await dio.post(findIdCheckUserApiUrl, data: {
      "userPhoneNumber": _userPhoneNumberTextController.text,
      "code": _userCodeController.text,
    });
    print(resp);
    print(resp.data['code']);

// "userEmail" 필드의 값을 변수에 저장

    if (resp.data['code'] == 1) {
      isCheckCode = 1;
      userEmail = resp.data['data']['userEmail'];
      print(userEmail);
      nextButton = true;
    } else if (resp.data['code'] == -1) {
      isCheckCode = -1;
    }
  }

  String statusText() {
    if (isCheckUser == -1) {
      return checkUserText;
    } else if (isCheckCode == -1) {
      return checkCodeErrorText;
    }
    return checkCodeText;
  }

  Color statusColor() {
    if (isCheckUser == -1) {
      return ErrorColor;
    } else if (isCheckCode == -1) {
      return ErrorColor;
    } else if (isCheckCode == 1) {
      return P_1;
    }
    return Colors.transparent;
  }

  List<bool> isSelected = [false, false];
  bool nextButton = false;

  bool onClickSendButton = false;
  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';

  String checkUserText = '이름과 전화번호를 확인해주세요.';

  String checkCodeText = '[인증성공] 인증되었습니다.';
  String checkCodeErrorText = '[인증실패] 인증번호를 확인해주세요.';

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
    _userCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 104.w),
                    Padding(
                      padding: EdgeInsets.only(top: 26.h),
                      child: Text(
                        '아이디 찾기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: B_1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 64.h),
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
                      '아이디를 찾기 위해 개인정보를 입력해주세요',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 84.h),
                Row(
                  children: [
                    SizedBox(width: 6.w),
                    const InfoText(text: '이름'),
                  ],
                ),
                SizedBox(height: 6.h),
                CustomTextFormField(
                  controller: _userNameTextEditController,
                  hintText: '이름을 입력해주세요',
                ),
                SizedBox(height: 36.0.h),
                Row(
                  children: [
                    SizedBox(width: 6.w),
                    const InfoText(text: '전화번호'),
                  ],
                ),
                SizedBox(height: 12.0.h),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 99.w,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: B_5,
                              side: BorderSide(
                                color: B_5,
                                width: 1.5.w,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r)),
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 370.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24.r),
                                        topRight: Radius.circular(24.r),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 280.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                              color: Colors.white),
                                          child: Center(
                                            child: ListWheelScrollView(
                                              squeeze: 1,
                                              overAndUnderCenterOpacity: 0.2,
                                              useMagnifier: true,
                                              magnification: 1.3,
                                              itemExtent: 75,
                                              diameterRatio: 2,
                                              physics:
                                                  const FixedExtentScrollPhysics(),
                                              onSelectedItemChanged: (index) =>
                                                  {newsAgency = index},
                                              children: items,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: P_1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                elevation: 0.0,
                                              ),
                                              onPressed: () async {
                                                changeAgency();
                                                print(selectAgency);
                                                setState(() {});
                                                Navigator.of(context).pop();
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  selectAgency,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: selectAgency == '통신사' ? B_3 : B_1),
                                ),
                                if (selectAgency == '통신사')
                                  Row(
                                    children: [
                                      SizedBox(width: 3.w),
                                      const Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: B_3,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        CustomTextFormField(
                          width: 150.w,
                          controller: _userPhoneNumberTextController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            NumberFormatter(),
                            LengthLimitingTextInputFormatter(13),
                          ],
                          onChanged: (String value) {
                            _userPhoneNumberTextController.text =
                                value.replaceAll('-', '');
                            if (_userPhoneNumberTextController.text.length ==
                                13) {
                              setState(() {});
                              // 키보드 자동으로 없애기
                              FocusScope.of(context).unfocus();
                              setState(() {});
                            } else {
                              setState(() {});
                            }
                          },
                          hintText: '010 0000 0000',
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: isCheckUser == 1 ? true : false,
                      child: Container(
                        width: 216.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
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
                            CustomTextFormField(
                              width: 140.w,
                              keyboardType: TextInputType.number,
                              controller: _userCodeController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              borderColor: Colors.transparent,
                              onChanged: (String value) async {
                                _userCodeController.text = value;
                                if (_userCodeController.text.length == 6) {
                                  setState(() {
                                    checkCode();
                                  });
                                  FocusScope.of(context).unfocus();
                                } else {
                                  setState(() {});
                                }
                              },
                              hintText: '인증번호 입력',
                            ),
                            Text(
                              '$minutes:$seconds',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: P_1,
                              ),
                            ),
                            SizedBox(width: 8.w),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 8.h),
                        backgroundColor:
                            _userPhoneNumberTextController.text.length == 13
                                ? P_1
                                : B_4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r)),
                        elevation: 0.0,
                      ),
                      onPressed: () async {
                        try {
                          if (_userPhoneNumberTextController.text.isNotEmpty) {
                            setState(() {
                              onClickSendButton = true;
                              checkUser();
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          isCheckUser == 0 ? sendText : sendAgainText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    statusText(),
                    style: TextStyle(
                      color: statusColor(),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 231.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _userCodeController.text.length == 6 ? P_1 : B_4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        elevation: 0.0),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                          elevation: 0.0,
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 160.h,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20.h),
                                Text(
                                  '${_userNameTextEditController.text}님!\n아이디 찾기가 완료 되었습니다',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: P_1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  userEmail,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: B_1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actionsPadding: EdgeInsets.only(bottom: 15.h),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Text(
                                '로그인',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: B_2),
                              ),
                            ),
                            SizedBox(width: 60.w),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FindPasswordScreen1()),
                                );
                              },
                              child: Text(
                                '비밀번호 찾기',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: B_2),
                              ),
                            ),
                          ],
                        ),
                      );
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
