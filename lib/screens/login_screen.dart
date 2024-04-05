import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/custom_textformfield.dart';
import '../components/default_layout.dart';
import '../const/colors.dart';
import '../const/data.dart';
import 'find_screens/find_id_screen.dart';
import 'find_screens/find_password_screens/find_password_screen_1.dart';
import 'main_screens/main_bottom_navigation_bar.dart';
import 'make_profile_card_screens/make_category_screen.dart';
import 'signup/signup_screens/signup_screen_tos.dart';

/*
  버튼 눌렀을 때 파란색 활성화 애니메이션 제거
  토큰 있을 때 없을 때
  아이디 찾기 페이지 구현
  비밀번호 찾기 페이지 구현
 */

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String serverUrl = 'http://$ip/login';
  bool isError = true;

  final _idTextEditController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _idTextEditController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 169.11.h),
                  Image.asset(
                    'assets/images/mixin_logo.png',
                    width: 124.w,
                    height: 34.h,
                  ),
                  SizedBox(height: 11.09.h),
                  Text(
                    'Everyone\'s playground',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0.sp,
                      color: P_1,
                    ),
                  ),
                  SizedBox(height: 76.h),
                  //username TextField
                  CustomTextFormField(
                    hintText: '학교 이메일',
                    controller: _idTextEditController,
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 12.h),
                  //password TextField
                  CustomTextFormField(
                    hintText: '비밀번호',
                    controller: _passwordTextController,
                    onChanged: (String value) {
                      setState(() {});
                    },
                    obscrueText: true,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 19.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '로그인 정보를 다시 확인해주세요',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: isError ? ErrorColor : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 86.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      elevation: 0.0,
                      backgroundColor: P_1,
                    ),
                    onPressed: () async {
                      print('1');
                      final idPassword =
                          '${_idTextEditController.text}:${_passwordTextController.text}';

                      // 일반 String을 base64로 변환
                      Codec<String, String> stringToBase64 = utf8.fuse(base64);

                      String token = stringToBase64.encode(idPassword);
                      dio.options.validateStatus = (status) {
                        // 400 이상의 상태 코드도 성공으로 처리
                        return status! >= 200 && status < 500;
                      };

                      try {
                        final resp = await dio.post(serverUrl, data: {
                          "userEmail": _idTextEditController.text,
                          "userPassword": _passwordTextController.text,
                        });

                        print('resp : $resp');

                        if (_idTextEditController.text.isEmpty ||
                            _passwordTextController.text.isEmpty ||
                            resp.data['code'] != 1) {
                          setState(() {
                            isError = true;
                            print(isError);
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isError = false;
                            });
                          });
                          return ;
                        } else {
                          print('7');

                          final refreshToken = resp.headers['Authorization'];
                          print('refreshToken : $refreshToken');
                          print(
                              'refreshTokenEncode : ${jsonEncode(refreshToken)}');

                          // final accessToken = resp.data['accessToken'];
                          await storage.write(
                              key: REFRESH_TOKEN_KEY,
                              value: jsonEncode(refreshToken));
                          // await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
                          if(resp.data['data']['firstLogin'] == true){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MakeCategoryScreen()),
                            );
                          } else if(resp.data['data']['firstLogin'] == false){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MainBottomNavigationBar()),
                            );
                          }

                        }
                      } catch (e) {
                        print(e);
                        isError = true;
                      }
                    },
                    child: SizedBox(
                      width: 260.w,
                      height: 56.h,
                      child: Center(
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            color: WHITE,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
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
                              color: B_4,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 8.h),
                          child: Container(
                            width: 1.w,
                            height: 12.h,
                            color: B_4,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const FindIdScreen()),
                            );
                          },
                          child: Text(
                            '아이디 찾기',
                            style: TextStyle(
                              color: B_4,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 8.h),
                          child: Container(
                            width: 1.w,
                            height: 12.h,
                            color: B_4,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpTosScreen()),
                            );
                          },
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              color: P_1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
