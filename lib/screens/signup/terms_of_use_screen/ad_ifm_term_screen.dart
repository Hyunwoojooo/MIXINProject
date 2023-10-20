import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import '../../../const/term_of_service_text/ad_term_text.dart';
import '../../../layout/appbar_layout.dart';

class AdIfmTerm extends StatelessWidget {
  AdIfmTerm({Key? key}) : super(key: key);

  final AdTermText serviceTermText = AdTermText();
  final String first = AdTermText().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
            ),
          ],
        ),
        width: 342.w,
        height: 56.h,
        child: RawMaterialButton(
          elevation: 0.0,
          fillColor: MIXIN_POINT_COLOR,
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
                fontWeight: FontWeight.w600),
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
                  '광고성 정보 수신 동의 (선택)',
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0.sp,
                    color: MIXIN_BLACK_1,
                  ),
                ),
                SizedBox(height: 24.0.h),
                Text(
                  first,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0.sp,
                    color: MIXIN_BLACK_2,
                    height: 1.3.h,
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
