import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../components/custom_textformfield.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';
import '../../login_screen.dart';

class SignUpScreenPassword extends StatefulWidget {
  const SignUpScreenPassword({Key? key}) : super(key: key);

  @override
  State<SignUpScreenPassword> createState() => _SignUpScreenPasswordState();
}

class _SignUpScreenPasswordState extends State<SignUpScreenPassword> {
  final storage = const FlutterSecureStorage();
  final String joinUrl = 'http://$ip/join';
  final dio = Dio();
  bool obscure1 = true;
  bool obscure2 = true;

  final _userPasswordController = TextEditingController();
  final _userPasswordCheckController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userPasswordCheckController.dispose();
    _userPasswordController.dispose();
  }

  void realUse() async {
    String? agradInfrm = await storage.read(key: 'isAdIfmChecked');
    print('광고성 : $agradInfrm');
    String? userName = await storage.read(key: 'userName');
    print('이름 : $userName');
    String? userGender = await storage.read(key: 'userGender');
    print('성별 : $userGender');
    String? userPhoneNumber = await storage.read(key: 'userPhoneNumber');
    print('휴대폰 번호 : $userPhoneNumber');
    String? userCarrier = await storage.read(key: 'userAgent');
    print('통신사 : $userCarrier');
    String? userStudentId = await storage.read(key: 'userStudentId');
    print('학번 : $userStudentId');
    String? userUniversity = await storage.read(key: 'userUniversity');
    print('대학교 : $userUniversity');
    String? userDepartment = await storage.read(key: 'userDepartment');
    print('학과 : $userDepartment');
    String? userEmail = await storage.read(key: 'userEmail');
    print('이메일 : $userEmail');
    await storage.write(
        key: 'userPassword', value: _userPasswordController.text);
    print('비밀번호 : ${_userPasswordController.text}');

    // dio 사용
    final Response resp = await dio.post(joinUrl, data: {
      "agradInfrm": agradInfrm,
      "userName": userName,
      "userGender": userGender,
      "userPhoneNumber": userPhoneNumber,
      "userCarrier": userCarrier,
      "userStudentId": userStudentId,
      "userUniversity": userUniversity,
      "userDepartment": userDepartment,
      "userEmail": userEmail,
      "userPassword": _userPasswordController.text,
    });
    print(resp);
  }

  void testUse() async {
    final Response resp = await dio.post(joinUrl, data: {
      "agradInfrm": '동의',
      "userName": '주현우',
      "userGender": '남자',
      "userPhoneNumber": '01033428798',
      "userCarrier": 'userCarrier',
      "userStudentId": '20184830',
      "userUniversity": '동양미래대학교',
      "userDepartment": '로봇공학과',
      "userEmail": 'hyunwoojoo.33@gmail.com',
      "userPassword": 'Aaa123456!',
    });
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                const HeadlineText(text: '이제 마지막이에요!\n비밀번호를 설정해주세요.'),
                SizedBox(height: 50.0.h),
                const InfoText(text: '비밀번호'),
                SizedBox(height: 12.0.h),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요',
                  obscrueText: obscure1,
                  controller: _userPasswordController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure1 = !obscure1;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(obscure1 ? 'assets/images/icons/eyes_open.png' :
                        'assets/images/icons/eyes_closed.png',
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 24.0.h),
                const InfoText(text: '비밀번호 확인'),
                SizedBox(height: 12.0.h),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요',
                  obscrueText: obscure2,
                  controller: _userPasswordCheckController,
                  onChanged: ((value) {
                    setState(() {});
                  }),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure2 = !obscure2;
                        });
                        },
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(obscure2 ? 'assets/images/icons/eyes_open.png' :
                        'assets/images/icons/eyes_closed.png'),
                      ),
                  ),
                ),
                SizedBox(height: 24.0.h),
                Row(
                  children: [
                    Icon(
                      Icons.check_rounded,
                      size: 18.0.w,
                      color: _userPasswordController.text.length >= 8 &&
                              _userPasswordController.text.length <= 16
                          ? P_1
                          : B_4,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '8~16자리 사이의 비밀번호를 구성',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0.sp,
                        color: _userPasswordController.text.length >= 8 &&
                                _userPasswordController.text.length <= 16
                            ? P_1
                            : B_4,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0.w),
                Row(
                  children: [
                    Icon(Icons.check_rounded,
                        size: 18.0.w,
                        color:
                            _hasUpperCaseAndNumber(_userPasswordController.text)
                                ? P_1
                                : B_4),
                    SizedBox(width: 10.w),
                    Text(
                      '영문 대문자/숫자 포함',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0.sp,
                        color:
                            _hasUpperCaseAndNumber(_userPasswordController.text)
                                ? P_1
                                : B_4,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0.h),
                Row(
                  children: [
                    Icon(
                      Icons.check_rounded,
                      size: 18.0,
                      color: _userPasswordController.text ==
                                  _userPasswordCheckController.text &&
                              _userPasswordController.text.isNotEmpty &&
                              _userPasswordCheckController.text.isNotEmpty
                          ? P_1
                          : B_4,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '비밀번호 일치',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: _userPasswordController.text ==
                                    _userPasswordCheckController.text &&
                                _userPasswordController.text.isNotEmpty &&
                                _userPasswordCheckController.text.isNotEmpty
                            ? P_1
                            : B_4,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 215.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: nextButtonColor(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r)),
                        elevation: 0.0),
                    onPressed: () async {
                      if ((_userPasswordController.text ==
                                  _userPasswordCheckController.text &&
                              _userPasswordController.text.isNotEmpty &&
                              _userPasswordCheckController.text.isNotEmpty) &&
                          _hasUpperCaseAndNumber(_userPasswordController.text) &&
                          _userPasswordController.text.length >= 8 &&
                          _userPasswordController.text.length <= 16) {
                        realUse();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
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
                          '완료',
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

  Color nextButtonColor() {
    if ((_userPasswordController.text == _userPasswordCheckController.text &&
            _userPasswordController.text.isNotEmpty &&
            _userPasswordCheckController.text.isNotEmpty) &&
        _hasUpperCaseAndNumber(_userPasswordController.text) &&
        _userPasswordController.text.length >= 8 &&
        _userPasswordController.text.length <= 16) return P_1;
    return B_4;
  }

  bool _hasUpperCaseAndNumber(String text) {
    bool hasUpperCase = false;
    bool hasNumber = false;

    for (int i = 0; i < text.length; i++) {
      if (text[i].toUpperCase() == text[i] &&
          text[i].toLowerCase() != text[i]) {
        hasUpperCase = true;
      }
      if (int.tryParse(text[i]) != null) {
        hasNumber = true;
      }
    }

    return hasUpperCase && hasNumber;
  }
}
