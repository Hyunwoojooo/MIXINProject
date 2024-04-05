import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';

class ChoiceGenderButton extends StatefulWidget {
  const ChoiceGenderButton({Key? key}) : super(key: key);

  @override
  State<ChoiceGenderButton> createState() => _ChoiceGenderButtonState();
}

class _ChoiceGenderButtonState extends State<ChoiceGenderButton> {
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 48.h,
          width: 106.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: _ischecked1 ? P_3 : Colors.white,
              foregroundColor: _ischecked1 ? P_2 : B_4,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _ischecked1 ? P_2 : B_5, //MIXIN_BLACK_4,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              _saveData('genderRestriction', '상관없음');
              setState(() {
                _ischecked1 = true;
                _ischecked2 = false;
                _ischecked3 = false;
              });
            },
            child: Text(
              '상관없음',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: _ischecked1 ? P_1 : B_4,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SizedBox(
          height: 48.h,
          width: 106.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: _ischecked2 ? P_3 : Colors.white,
              foregroundColor: _ischecked2 ? P_2 : B_4,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _ischecked2 ? P_2 : B_5,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              _saveData('genderRestriction', '남자만');
              setState(() {
                _ischecked1 = false;
                _ischecked2 = true;
                _ischecked3 = false;
              });
            },
            child: Text(
              '남자만',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: _ischecked2 ? P_1 : B_4,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SizedBox(
          height: 48.h,
          width: 106.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: _ischecked3 ? P_3 : Colors.white,
              foregroundColor: _ischecked3 ? P_2 : B_4,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _ischecked3 ? P_2 : B_5,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              _saveData('genderRestriction', '여자만');
              setState(() {
                _ischecked1 = false;
                _ischecked2 = false;
                _ischecked3 = true;
              });
            },
            child: Text(
              '여자만',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: _ischecked3 ? P_1 : B_4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
