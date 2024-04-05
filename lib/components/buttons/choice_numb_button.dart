import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/colors.dart';
import 'choice_numb/choice_numb.dart';

class ChoiceNumbButton extends StatefulWidget {
  const ChoiceNumbButton({Key? key}) : super(key: key);

  @override
  State<ChoiceNumbButton> createState() => _ChoiceNumbButtonState();
}

class _ChoiceNumbButtonState extends State<ChoiceNumbButton> {
  int? memberCount;
  String moimMemberLimit = '인원 수를 선택해 주세요.';

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    moimMemberLimit = prefs.getString('moimMemberLimit')!;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 342.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: B_5,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 370.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    topLeft: Radius.circular(24.r),
                  ),
                  color: WHITE,
                ),
                child: Column(
                  children: [
                    const ChoiceNumb(),
                    SizedBox(height: 30.h),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: P_1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          elevation: 0.0,
                        ),
                        onPressed: () async {
                          _getData();
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        child: Container(
                          width: 342.w,
                          height: 56.h,
                          alignment: Alignment.center,
                          child: Text(
                            '확인',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
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
            moimMemberLimit,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: moimMemberLimit == '인원 수를 선택해 주세요.' ? B_4 : B_1,
            ),
          ),
        ),
      ),
    );
  }
}
