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
        width: 358.w,
        height: 56.h,
        child: RawMaterialButton(
          elevation: 0.0,
          fillColor: P_1,
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
                AppbarCloseLayout(onPressed: () {
                  Navigator.pop(context);
                }),
                SizedBox(height: 45.h),
                Text(
                  '광고성 정보 수신 동의 (선택)',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26.sp,
                    color: B_1,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  first,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: B_2,
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
