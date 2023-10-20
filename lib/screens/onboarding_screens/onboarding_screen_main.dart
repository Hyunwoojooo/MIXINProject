import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

import '../../const/colors.dart';
import '../login_screen.dart';
import '../signup/signup_screens/signup_screen_tos.dart';

/*
  각 PageView 이미지 넣어야 됨
 */

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  Timer? _timer;
  int _currentPage = 0;
  final int _pageCount = 3;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _pageCount - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 517.h,
            child: SafeArea(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 180.h),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 105.r,
                        ),
                        SizedBox(
                          height: 63.h,
                        ),
                        Text(
                          '우리들의 놀이터,\n믹스인!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SUIT',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 180.h),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 105.r,
                        ),
                        SizedBox(height: 63.h),
                        Text(
                          '당신이 관심있는 분야들로만\n보여드릴게요',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SUIT',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 180.h),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 105.r,
                        ),
                        SizedBox(height: 63.h),
                        Text(
                          '인증된 나만의 프로필카드',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SUIT',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 56.h),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController, // PageController
              count: 3,
              effect: WormEffect(
                spacing: 18.w,
                dotColor: MIXIN_BLACK_5,
                activeDotColor: MIXIN_POINT_COLOR,
                dotHeight: 8.h,
                dotWidth: 8.w,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
          ),
          SizedBox(height: 90.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MIXIN_POINT_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0.r)),
                  elevation: 0.0),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const SignUpTosScreen()),
                );
              },
              child: SizedBox(
                width: 300.w,
                height: 56.h,
                child: Center(
                  child: Text(
                    '회원가입하고 시작하기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '이미 계정이 있나요?',
                style: TextStyle(
                  color: const Color(0xFFB1B1B7),
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 102.w,
                height: 20.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 0.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    '로그인하기',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      color: MIXIN_POINT_COLOR,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
