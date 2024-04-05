import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';
import 'numbs.dart';
import 'weeks_months.dart';

class ChoiceCycle extends StatefulWidget {
  const ChoiceCycle({super.key});

  @override
  State<ChoiceCycle> createState() => _ChoiceCycleState();
}

class _ChoiceCycleState extends State<ChoiceCycle> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //am_pm
            SizedBox(
              width: 70.w,
              height: 160.h,
              child: ListWheelScrollView.useDelegate(
                controller: _controller,
                itemExtent: 70,
                perspective: 0.005,
                diameterRatio: 1000,
                squeeze: 1,
                overAndUnderCenterOpacity: 0.2,
                useMagnifier: true,
                magnification: 1.3,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return WeeksMonths(
                          isItAm: true,
                        );
                      } else {
                        return WeeksMonths(
                          isItAm: false,
                        );
                      }
                    }),
              ),
            ),
            SizedBox(width: 70.w),
            // hours wheel
            SizedBox(
              width: 70.w,
              height: 160.h,
              child: ListWheelScrollView.useDelegate(
                // onSelectedItemChanged: (value) ==> print(value),
                controller: _controller,
                itemExtent: 60,
                perspective: 0.005,
                diameterRatio: 1000,
                squeeze: 1,
                overAndUnderCenterOpacity: 0.2,
                useMagnifier: true,
                magnification: 1.3,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List<Widget>.generate(24, (index) {
                    return Numbs(
                      numbs: index,
                    );
                  }),
                ),
              ),
            ),
            SizedBox(width: 30.w),
            Text(
              '회',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: B_2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
