import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class MoimNoticeFormat extends StatelessWidget {
  final int noticeId;
  final String title;
  final String createAt;
  final int viewCount;
  final int commentCount;
  final bool checked;
  void Function() onPressed;


  MoimNoticeFormat({
    required this.noticeId,
    required this.title,
    required this.createAt,
    required this.viewCount,
    required this.commentCount,
    required this.checked,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 134.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: B_5),
        ),
        padding: EdgeInsets.only(left: 20.w, top: 21.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                width: 45.w,
                height: 20.h,
                padding: EdgeInsets.only(left: 2.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF3D77DB).withOpacity(0.3),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Row(
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.h,
                      padding: EdgeInsets.all(3.h),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3D77DB),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/icons/check_icon.png',
                        fit: BoxFit.contain,
                        height: 8.h,
                        width: 11.w,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      viewCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: const Color(0xFF3D77DB)),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: 21.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: B_2,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  createAt.substring(0, 16).replaceAll('-', ' ').replaceRange(4, 4, '년').replaceRange(8, 8, '월').replaceRange(12, 12, '일').replaceAll('T', ' '),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: B_4,
                  ),
                ),
                SizedBox(width: 13.w),
                Text(
                  checked ? '확인' : '미확인',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: P_1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
