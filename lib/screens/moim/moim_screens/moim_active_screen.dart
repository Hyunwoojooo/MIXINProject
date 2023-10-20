import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';

import '../../../components/moim_active.dart';
import '../../../components/moim_active_button.dart';

class MoimActiveScreen extends StatefulWidget {
  const MoimActiveScreen({super.key});

  @override
  State<MoimActiveScreen> createState() => _MoimActiveScreenState();
}

class _MoimActiveScreenState extends State<MoimActiveScreen> {
  bool isCheckedAll = true;
  bool isCheckedBefore = false;
  bool isCheckedAfter = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Row(
            children: [
              MoimActiveButton(
                text: '전체보기',
                backgroundColor: isCheckedAll ? MIXIN_ : Colors.transparent,
                borderColor: isCheckedAll ? MIXIN_ : MIXIN_BLACK_5,
                textColor: isCheckedAll ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
                onPressed: () {
                  setState(() {
                    isCheckedAll = true;
                    isCheckedBefore = false;
                    isCheckedAfter = false;
                  });
                },
              ),
              SizedBox(width: 8.w),
              MoimActiveButton(
                text: '활동전',
                backgroundColor: isCheckedBefore ? MIXIN_ : Colors.transparent,
                borderColor: isCheckedBefore ? MIXIN_ : MIXIN_BLACK_5,
                textColor: isCheckedBefore ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
                onPressed: () {
                  setState(() {
                    isCheckedAll = false;
                    isCheckedBefore = true;
                    isCheckedAfter = false;
                  });
                },
              ),
              SizedBox(width: 8.w),
              MoimActiveButton(
                text: '활동후',
                backgroundColor: isCheckedAfter ? MIXIN_ : Colors.transparent,
                borderColor: isCheckedAfter ? MIXIN_ : MIXIN_BLACK_5,
                textColor: isCheckedAfter ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
                onPressed: () {
                  setState(() {
                    isCheckedAll = false;
                    isCheckedBefore = false;
                    isCheckedAfter = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 19.h),
          MoimActive(

          )
        ],
      ),
    );
  }
}
