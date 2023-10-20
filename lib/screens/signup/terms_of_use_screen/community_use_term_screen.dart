import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../const/term_of_service_text/community_term_text.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';

class CommunityUseTerm extends StatelessWidget {
  CommunityUseTerm({Key? key}) : super(key: key);

  final CommunityTermText communityUseTerm = CommunityTermText();
  final String first = CommunityTermText().first;
  final String second = CommunityTermText().second;
  final String third = CommunityTermText().third;
  final String fourth = CommunityTermText().fourth;
  final String fifth = CommunityTermText().fifth;
  final String sixth = CommunityTermText().sixth;
  final String seventh = CommunityTermText().seventh;
  final String eighth = CommunityTermText().eighth;
  final String ninth = CommunityTermText().ninth;
  final String tenth = CommunityTermText().tenth;
  final String eleventh = CommunityTermText().eleventh;
  final String twelfth = CommunityTermText().twelfth;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarCloseLayout(onPressed: () {
                  Navigator.pop(context);
                }),
                SizedBox(height: 45.h),
                Text(
                  '커뮤니티 이용규칙 확인 (필수)',
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0.sp,
                    color: MIXIN_BLACK_1,
                  ),
                ),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '커뮤니티 이용규칙 안내'),
                SizedBox(height: 16.h),
                BodyText(text: first),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '커뮤니티 운영 시스템'),
                SizedBox(height: 16.sp),
                BodyText(text: second),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '유출 방지 시스템'),
                SizedBox(height: 16.h),
                BodyText(text: third),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '금지 행위'),
                SizedBox(height: 16.h),
                BodyText(text: fourth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '일반 금지 행위'),
                SizedBox(height: 16.h),
                BodyText(text: fifth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '정치·사회 관련 금지 행위'),
                SizedBox(height: 16.h),
                BodyText(text: sixth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '홍보 및 판매 관련 금지 행위'),
                SizedBox(height: 16.h),
                BodyText(text: seventh),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '게시물 작성·수정·삭제 규칙'),
                SizedBox(height: 16.h),
                BodyText(text: eighth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '게시판 관리자 제도'),
                SizedBox(height: 16.h),
                BodyText(text: ninth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '허위사실 유포 및 명예훼손 게시물에 대한 게시 중단 요청'),
                SizedBox(height: 16.h),
                BodyText(text: tenth),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '전기통신사업법에 따른 불법촬영물 유통 금지'),
                SizedBox(height: 16.h),
                BodyText(text: eleventh),
                SizedBox(height: 24.0.h),
                HeadlineTosText(text: '기타'),
                SizedBox(height: 16.h),
                BodyText(text: twelfth),
                SizedBox(height: 120.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
