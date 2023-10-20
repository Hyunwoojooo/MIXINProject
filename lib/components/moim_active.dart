import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

class MoimActive extends StatefulWidget {
  const MoimActive({super.key});

  @override
  State<MoimActive> createState() => _MoimActiveState();
}

class _MoimActiveState extends State<MoimActive> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop(

        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 24.h, left: 21.w, right: 18.w),
        height: 140.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: WHITE,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: MIXIN_BLACK_4, offset: Offset(3, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2023 첫번째 정기모임',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: MIXIN_BLACK_1,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Image.asset('assets/images/icons/calendar_icon.png',
                        height: 16.h),
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
                    Image.asset('assets/images/icons/map_point.png',
                        height: 13.h),
                    SizedBox(width: 8.w),
                    Text(
                      '깍둑',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MIXIN_BLACK_5,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '참여하기',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_3,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '12명 참여중',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_POINT_COLOR,
                      ),
                    )
                  ],
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: MIXIN_,
              radius: 24.r,
              child: Text(
                'D-12',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: MIXIN_POINT_COLOR,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
