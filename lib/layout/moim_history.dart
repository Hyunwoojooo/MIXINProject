import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

class MoimHistory extends StatelessWidget {
  const MoimHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 84.h,
      width: 342.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: MIXIN_,
      ),
      padding: EdgeInsets.only(left: 21.w, top: 16.h, bottom: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2023년 첫번째 정기모임',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: MIXIN_BLACK_1,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Image.asset('assets/images/icons/calendar_icon.png', width: 18.w),
              SizedBox(width: 8.w),
              Text(
                '2023.03.23',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MIXIN_BLACK_3,
                ),
              ),
              SizedBox(width: 16.w),
              Image.asset(
                'assets/images/icons/map_point.png',
                width: 10,
              ),
              SizedBox(width: 9.w),
              Text(
                '깍둑',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MIXIN_BLACK_3,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
