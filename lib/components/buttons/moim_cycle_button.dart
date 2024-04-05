import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';
import 'choice_cycle/choice_cycle.dart';

class MoimCycleButton extends StatefulWidget {
  const MoimCycleButton({Key? key}) : super(key: key);

  @override
  State<MoimCycleButton> createState() => _MoimCycleButtonState();
}

class _MoimCycleButtonState extends State<MoimCycleButton> {
  int? newsAgency;
  String moimFrequecy = '모임 주기를 선택해주세요';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 342.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: B_4,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: B_5,
              width: 1.0.w,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            )),
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 370.h,
                width: double.infinity,
                child: Column(
                  children: [
                    const ChoiceCycle(),
                    SizedBox(height: 60.h),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: P_1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            elevation: 0.0,
                          ),
                          onPressed: () async {
                            moimFrequecy = '매주 4회';
                            setState(() {});

                            Navigator.of(context).pop();
                            print(newsAgency);
                          },
                          child: SizedBox(
                            width: 342.w,
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
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            moimFrequecy,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: moimFrequecy.length > 6 ? B_4 : B_1,
            ),
          ),
        ),
      ),
    );
  }
}
