import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';

class ChoiceResisterButton extends StatefulWidget {
  const ChoiceResisterButton({Key? key}) : super(key: key);

  @override
  State<ChoiceResisterButton> createState() => _ChoiceResisterButtonState();
}

class _ChoiceResisterButtonState extends State<ChoiceResisterButton> {
  bool _ischecked1 = false;
  bool _ischecked2 = false;

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  TextEditingController moimAdmissionCriteriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 170.h,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 48.h,
                width: 165.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: _ischecked1 ? P_3 : Colors.white,
                    foregroundColor: _ischecked1 ? P_1 : B_4,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: _ischecked1 ? P_2 : B_5,
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    _saveData('moimRules', '자유롭게 가입');
                    setState(() {
                      _ischecked1 = true;
                      _ischecked2 = false;
                    });
                  },
                  child: Text(
                    '자유롭게 가입',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              SizedBox(
                height: 48.h,
                width: 165.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: _ischecked2 ? P_3 : Colors.white,
                    foregroundColor: _ischecked2 ? P_1 : B_4,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: _ischecked2 ? P_2 : B_5,
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    _saveData('moimRules', '승인 후 가입');
                    setState(() {
                      _ischecked1 = false;
                      _ischecked2 = true;
                    });
                  },
                  child: Text(
                    '승인 후 가입',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_ischecked2)
            Column(
              children: [
                SizedBox(height: 16.h),
                SizedBox(
                  height: 100.h,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      color: B_1,
                    ),
                    controller: moimAdmissionCriteriaController,
                    onChanged: (value){
                      _saveData('moimAdmissionCriteria', moimAdmissionCriteriaController.text);
                    },
                    decoration: InputDecoration(
                      hintText: '가입 조건을 작성해주세요',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        color: B_4,
                      ),
                      counterStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SUIT',
                        color: B_4,
                      ),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: BorderSide(
                          color: B_5,
                          width: 1.5.w,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: B_5,
                          width: 1.5.w,
                        )
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                      counterText: '',
                    ),
                    maxLength: 60,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
