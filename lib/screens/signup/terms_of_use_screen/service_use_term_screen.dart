import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../const/term_of_service_text/service_term_text.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';

class ServiceUseTerm extends StatelessWidget {
  ServiceUseTerm({Key? key}) : super(key: key);

  final ServiceTermText serviceTermText = ServiceTermText();
  final String first = ServiceTermText().first;
  final String second = ServiceTermText().second;
  final String third = ServiceTermText().third;
  final String fourth = ServiceTermText().fourth;
  final String fifth = ServiceTermText().fifth;
  final String sixth = ServiceTermText().sixth;
  final String seventh = ServiceTermText().seventh;
  final String eighth = ServiceTermText().eighth;
  final String ninth = ServiceTermText().ninth;
  final String tenth = ServiceTermText().tenth;
  final String eleventh = ServiceTermText().eleventh;
  final String twelfth = ServiceTermText().twelfth;
  final String thirteenth = ServiceTermText().thirteenth;
  final String fourteenth = ServiceTermText().fourteenth;
  final String fifteenth = ServiceTermText().fifteenth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 30.0,
              blurRadius: 20.0,
            ),
          ],
        ),
        width: 342.w,
        height: 56.h,
        child: RawMaterialButton(
          fillColor: MIXIN_POINT_COLOR,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '확인',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarCloseLayout(onPressed: () {
                    Navigator.of(context);
                  }),
                  SizedBox(height: 45.h),
                  Text(
                    '서비스이용약관 (필수)',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 26.0.sp,
                      color: MIXIN_BLACK_1,
                    ),
                  ),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 1조(목적)'),
                  SizedBox(height: 16.sp),
                  BodyText(text: first),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 2조(정의)'),
                  SizedBox(height: 16.h),
                  BodyText(text: second),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 3조(약관 동의 명시와 설명 및 개정 )'),
                  SizedBox(height: 16.h),
                  BodyText(text: third),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 4조(서비스의 제공)'),
                  SizedBox(height: 16.h),
                  BodyText(text: fourth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 5조(서비스 이용계약의 성립)'),
                  SizedBox(height: 16.h),
                  BodyText(text: fifth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 6조(개인정보의 관리 및 보호)'),
                  SizedBox(height: 16.h),
                  BodyText(text: sixth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 7조(서비스 이용계약의 종료)'),
                  SizedBox(height: 16.h),
                  BodyText(text: seventh),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 8조(회원에 대한 통지)'),
                  SizedBox(height: 16.h),
                  BodyText(text: eighth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 9조(저작권의 귀속)'),
                  SizedBox(height: 16.h),
                  BodyText(text: ninth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 10조(게시물의 삭제 및 접근 차단)'),
                  SizedBox(height: 16.h),
                  BodyText(text: tenth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 11조(광고의 게재 및 발신)'),
                  SizedBox(height: 16.h),
                  BodyText(text: eleventh),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 12조(금지행위)'),
                  SizedBox(height: 16.h),
                  BodyText(text: twelfth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 13조(서비스 제공의 중단 및 서비스 이용계약의 해지)'),
                  SizedBox(height: 16.h),
                  BodyText(text: thirteenth),
                  SizedBox(height: 24.0.h),
                  HeadlineTosText(text: '제 14조(재판권 및 준거법)'),
                  SizedBox(height: 16.h),
                  BodyText(text: fourteenth),
                  SizedBox(height: 24.0.h),
                  const HeadlineText(text: '제 15조(기타)'),
                  SizedBox(height: 16.h),
                  BodyText(text: fifteenth),
                  SizedBox(height: 120.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
