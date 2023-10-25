import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../components/buttons/choice_gender_button.dart';
import '../../../components/buttons/choice_numb_button.dart';
import '../../../const/colors.dart';
import '../../../layout/appbar_layout.dart';

class ThunderMake1 extends StatefulWidget {
  const ThunderMake1({Key? key}) : super(key: key);

  @override
  State<ThunderMake1> createState() => _ThunderMake1State();
}

class _ThunderMake1State extends State<ThunderMake1> {
  DateTime? today;
  DateTime? previousDate;
  int? day;
  String? date;
  int isChecked = 0;

  @override
  void initState() {
    today = DateTime.now();
    previousDate = today?.subtract(const Duration(days: 2));
    print(previousDate);
    day = int.parse(DateFormat('d').format(today!));

    print(DateFormat('d').format(today!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 16.w),
                    Padding(
                      padding: EdgeInsets.only(top: 43.h),
                      child: Text(
                        '모임 만들기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 43.h),
                _text('인원 수'),
                SizedBox(height: 12.h),
                const ChoiceNumbButton(),
                SizedBox(height: 36.h),
                _text('성별'),
                SizedBox(height: 12.h),
                const ChoiceGenderButton(),
                SizedBox(height: 36.h),
                _text('모임 날짜'),
                SizedBox(height: 12.h),
                Container(
                  // color: Colors.red,
                  height: 80.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: MIXIN_,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10.h),
                                  side: BorderSide(
                                    color: MIXIN_2,
                                  )),
                              onPressed: () {
                                isChecked = index;
                                print(isChecked);
                              },
                              child: Text(
                                '${day! + index}',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              index == 0 ? '오늘' : DateFormat('E', 'ko_KR')
                                  .format(today!.add(Duration(days: index))),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: MIXIN_POINT_COLOR,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SUIT',
        color: MIXIN_BLACK_3,
      ),
    );
  }
}
