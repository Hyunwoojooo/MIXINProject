import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../calendar.dart';
import '../../const/colors.dart';

class MoimTermButton extends StatefulWidget {
  const MoimTermButton({Key? key}) : super(key: key);

  @override
  State<MoimTermButton> createState() => _MoimTermButtonState();
}

class _MoimTermButtonState extends State<MoimTermButton> {
  int? newsAgency;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 342.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: MIXIN_BLACK_5,
          width: 1.5.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              '모집 마감 날짜를 선택해주세요',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: 'SUIT',
                color: MIXIN_BLACK_4,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.0.w),
            child: IconButton(
              icon: Image.asset(
                'assets/images/calendar_3x.png',
                width: 26.w,
              ),
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    topLeft: Radius.circular(24.r),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 390.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0.w, 8.h, 8.w, 0),
                        child: Column(
                          children: [
                            const Calendar(),
                            SizedBox(height: 20.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 56.h,
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MIXIN_POINT_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0.r)),
                                    elevation: 0.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                    print(newsAgency);
                                  },
                                  child: SizedBox(
                                    height: 56.h,
                                    child: Center(
                                      child: Text(
                                        '확인',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontFamily: 'SUIT',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
