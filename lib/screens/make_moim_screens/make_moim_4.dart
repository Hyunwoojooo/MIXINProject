import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';
import '../main_screens/main_bottom_navigation_bar.dart';

class MakeMoim4 extends StatelessWidget {
  const MakeMoim4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 197.h),
              Text(
                '모임이 완성되었습니다!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: B_1,
                ),
              ),
              SizedBox(height: 45.h),
              Image.asset(
                'assets/images/complete_make_moim.png',
                width: 233.w,
                height: 299.h,
              ),
              SizedBox(height: 183.h),
              SizedBox(
                width: 165.w,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      backgroundColor: P_1,
                      elevation: 0),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MainBottomNavigationBar(),
                      ),
                    );
                  },
                  child: Text(
                    '완료하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
