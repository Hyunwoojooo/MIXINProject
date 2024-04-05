import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';

class MoimRules extends StatefulWidget {
  const MoimRules({Key? key}) : super(key: key);

  @override
  State<MoimRules> createState() => _MoimRulesState();
}

class _MoimRulesState extends State<MoimRules> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: TextFormField(
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: '가입 조건을 작성해주세요',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            color: B_4,
          ),
          counterStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SUIT',
            color: B_4,
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
            borderSide: const BorderSide(
              color: B_5,
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
        maxLength: 80,
        maxLines: null,
      ),
    );
  }
}
