import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../const/term_of_service_text/personal_term_text.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/text_layout.dart';

class PersonalIfmterm extends StatelessWidget {
  PersonalIfmterm({Key? key}) : super(key: key);

  final PersonalTermText serviceTermText = PersonalTermText();
  final String first = PersonalTermText().first;
  final String second = PersonalTermText().second;
  final String third = PersonalTermText().third;
  final String fourth = PersonalTermText().fourth;

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
        width: 358.w,
        height: 56.h,
        child: RawMaterialButton(
          fillColor: P_1,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '동의',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: AppbarCloseLayout(onPressed: () {
                    Navigator.of(context);
                  }),
                ),
                SizedBox(height: 45.h),
                Text(
                  '개인정보 수집 및 이용 동의 (필수)',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26.sp,
                    color: B_1,
                  ),
                ),
                SizedBox(height: 24.h),
                HeadlineTosText(text: '수집하는 개인정보의 항목'),
                SizedBox(height: 16.h),
                BodyText(text: first),
                SizedBox(height: 24.h),
                HeadlineTosText(text: '수집한 개인정보의 처리 목적'),
                SizedBox(height: 16.h),
                BodyText(text: second),
                SizedBox(height: 24.h),
                HeadlineTosText(text: '수집한 개인정보의 보관 및 파기'),
                SizedBox(height: 16.h),
                BodyText(text: third),
                SizedBox(height: 24.h),
                HeadlineTosText(text: '기타'),
                SizedBox(height: 16.h),
                BodyText(text: fourth),
                SizedBox(height: 100.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
