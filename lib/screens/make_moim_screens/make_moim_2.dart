import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import '../../components/buttons/choice_gender_button.dart';
import '../../components/buttons/choice_numb_button.dart';
import '../../components/buttons/choice_resistar_button.dart';
import 'make_moim_3.dart';

class MeetingPage2 extends StatefulWidget {
  const MeetingPage2({Key? key}) : super(key: key);

  @override
  State<MeetingPage2> createState() => _MeetingPage2State();
}

class _MeetingPage2State extends State<MeetingPage2> {

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 2.h,
                    width: 195.w,
                    color: P_2,
                  ),
                  Container(
                    height: 2.h,
                    width: 195.w,
                    color: B_5,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 16.w),
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: Text(
                        '모임 만들기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: B_1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 43.h),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '인원 수',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: B_3,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const ChoiceNumbButton(),
                  SizedBox(height: 36.h),
                  Text(
                    '성별',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: B_3,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const ChoiceGenderButton(),
                  SizedBox(height: 36.h),
                  Text(
                    '가입기준',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: B_3,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const ChoiceResisterButton(),
                  SizedBox(height: 186.h),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(342.w, 56.h),
                      elevation: 0,
                      backgroundColor: P_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MeetingPage3(),
                        ),
                      );
                    },
                    child: Text(
                      '다음',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: WHITE
                      ),
                    ),
                  ),
                ],
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
