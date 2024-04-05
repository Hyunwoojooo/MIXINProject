import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/custom_textformfield.dart';
import '../../../components/number_formatter.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';
import 'signup_screen_school.dart';

/*
  통신사 선택된 것만 색 다른 색으로 하게 O
  인증번호 6개가 입력됐을 경우에만 다음버튼 활성화 O
 */

class SignUpScreenNamePhone extends StatefulWidget {
  const SignUpScreenNamePhone({Key? key}) : super(key: key);

  @override
  State<SignUpScreenNamePhone> createState() => _SignUpScreenNamePhoneState();
}

class _SignUpScreenNamePhoneState extends State<SignUpScreenNamePhone> {
  final storage = const FlutterSecureStorage();
  final String smsSendUrl = 'http://$ip/join/sms/send';
  final String smsCheckUrl = 'http://$ip/join/sms/check';
  Dio dio = Dio();

  final _userNameTextEditController = TextEditingController();
  final _userPhoneNumberTextController = TextEditingController();
  String userNameTextValue = '';
  final _userCodeController = TextEditingController();
  List<bool> isSelected = [false, false];
  List<String> genderList = ['남자', '여자'];
  String userGender = '';
  bool nextButton = false;
  List<String> checkCodeText = ['인증 완료', '인증 실패'];

  String _selectedGender = '';

  int isCheckCode = 0;

  bool onClickSendButton = false;
  String sendText = '인증번호 전송';
  String sendAgainText = '인증번호 재전송';

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void getGender() {
    if (isSelected[0] == true) {
      userGender == '여자';
    } else if (isSelected[1] == true) {
      userGender == '남자';
    }
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
    _userNameTextEditController.dispose();
    _userPhoneNumberTextController.dispose();
    _userCodeController.dispose();
    super.dispose();
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

// 인증번호 확인
  void checkCode() async {
    final Response resp = await dio.post(smsCheckUrl, data: {
      "userPhoneNumber": _userPhoneNumberTextController.text,
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

  List<Widget> items = [
    Text(
      'KT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    Text(
      'SKT',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    Text(
      'LG',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    Text(
      'KT 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    Text(
      'SKT 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
    Text(
      'LG 알뜰폰',
      style: TextStyle(
          fontFamily: 'SUIT', fontWeight: FontWeight.w600, fontSize: 24.0.sp),
    ),
  ];

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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '회원가입',
                  width: 122,
                ),
                SizedBox(height: 63.h),
                const HeadlineText(text: '이름과 전화번호로\n본인인증을 해주세요'),
                SizedBox(height: 48.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 6.w),
                        const InfoText(text: '이름'),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 4.r,
                          backgroundColor:
                              userNameTextValue.isNotEmpty ? B_4 : P_1,
                        ),
                        SizedBox(width: 6.w),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                CustomTextFormField(
                  controller: _userNameTextEditController,
                  onChanged: (value) {
                    value = userNameTextValue;
                    setState(() {});
                  },
                  hintText: '이름을 작성해주세요',
                ),
                SizedBox(height: 42.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 6.w),
                        const InfoText(text: '성별'),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 4.r,
                          backgroundColor:
                              userNameTextValue.isNotEmpty ? B_4 : P_1,
                        ),
                        SizedBox(width: 6.w),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildGenderButton('남자', _selectedGender == '남자'),
                    SizedBox(width: 6.w), // 선택 버튼 사이에 간격 추가
                    buildGenderButton('여자', _selectedGender == '여자'),
                  ],
                ),
                SizedBox(height: 24.0.h),
                const InfoText(text: '휴대전화번호'),
                SizedBox(height: 12.0.h),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 113.w,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: B_5,
                                width: 1.5.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
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
                                                    8.r,
                                                  ),
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
                                    color: selectAgency == '통신사' ? B_4 : B_1,
                                  ),
                                ),
                                if (selectAgency == '통신사')
                                  Row(
                                    children: [
                                      SizedBox(width: 15.w),
                                      const Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: B_4,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0.w),
                        CustomTextFormField(
                          width: 217.w,
                          keyboardType: TextInputType.phone,
                          controller: _userPhoneNumberTextController,
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
                      visible: onClickSendButton ? true : false,
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
                                    nextButton = true;
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
                                fontFamily: 'SUIT',
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
                              color: isCheckCode == 1 ? P_1 : Colors.red,
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
                            print(_userPhoneNumberTextController.text);
                            _userPhoneNumberTextController.text =
                                _userPhoneNumberTextController.text
                                    .replaceAll(RegExp(r'\s+'), '');
                            if (_userPhoneNumberTextController
                                .text.isNotEmpty) {
                              setState(() {
                                onClickSendButton = true;
                              });
                              startTimer();
                              final Response resp =
                                  await dio.post(smsSendUrl, data: {
                                "userPhoneNumber":
                                    _userPhoneNumberTextController.text,
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
                SizedBox(height: 137.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isCheckCode == 1 ? P_1 : B_4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        elevation: 0.0),
                    onPressed: () async {
                      // Real
                      if (isCheckCode == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreenSchool()),
                        );
                        await storage.write(
                            key: 'userName',
                            value: _userNameTextEditController.text);
                        await storage.write(
                            key: 'userGender', value: _selectedGender);
                        await storage.write(
                            key: 'userAgent', value: selectAgency);
                        await storage.write(
                            key: 'userPhoneNumber',
                            value: _userPhoneNumberTextController.text);
                        print('이름 : $_userNameTextEditController.text');
                        print('통신사 : $selectAgency');
                        print('성별 : $_selectedGender');
                        print('전화번호 : $_userPhoneNumberTextController.text');
                      } else {
                        null;
                      }

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignUpScreenSchool()),
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

  Widget buildGenderButton(String gender, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: isSelected ? P_3 : B_5,
        // 선택된 버튼에 파란색, 선택되지 않은 버튼에 회색 적용
        minimumSize: Size(176.w, 48.h),
        // 버튼 크기
        side: BorderSide(
          color: isSelected ? P_2 : B_5,
          width: 1.5.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r), // 버튼의 둥근 모서리 설정
        ),
      ),
      child: Text(
        gender,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? P_1 : B_3, // 선택된 버튼에 흰색 글씨, 선택되지 않은 버튼에 검은색 글씨 적용
        ),
      ),
    );
  }
}
