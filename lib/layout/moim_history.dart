import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

class MoimHistory extends StatelessWidget {
  final int activityId;
  final String moimName;
  final String activityDate;
  final String activityName;
  final String activitySpot;

  const MoimHistory({
    required this.activityId,
    required this.moimName,
    required this.activityDate,
    required this.activityName,
    required this.activitySpot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 84.h,
      width: 342.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: P_3,
      ),
      padding: EdgeInsets.only(left: 21.w, top: 16.h, bottom: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            moimName,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: B_1,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            activityName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: B_1,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '일정',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: B_2,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    activityDate,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: B_3,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 24.w),
              Container(
                width: 1.w,
                height: 37.h,
                color: B_4,
              ),
              SizedBox(width: 24.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activitySpot,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: B_2,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '깍뚝',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: B_3,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
