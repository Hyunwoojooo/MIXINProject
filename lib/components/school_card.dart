import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class SchoolCard extends StatelessWidget {
  //학교
  final String schoolName;
  final String address;

  final void Function() onPressed;

  const SchoolCard(
      {required this.schoolName,
      required this.address,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: SizedBox(
        height: 68.h,
        width: 287.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schoolName,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: MIXIN_BLACK_1,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  address,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0.sp,
                    color: MIXIN_BLACK_3,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: MIXIN_POINT_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  padding: EdgeInsets.zero,
                  fixedSize: Size(70.w, 32.h),
                  elevation: 0.0),
              child: Text(
                '선택하기',
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
