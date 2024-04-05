import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../const/colors.dart';
import '../../const/data.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import 'make_2_screen.dart';
import 'make_introduce_screen.dart';

class MakeImportantScreen extends StatefulWidget {
  const MakeImportantScreen({Key? key}) : super(key: key);

  @override
  State<MakeImportantScreen> createState() => _MakeImportantScreenState();
}

class _MakeImportantScreenState extends State<MakeImportantScreen> {
  bool nextButtonColor = false;
  List<bool> selectList = List.filled(3, false);
  List<String> selectOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        text: '다음',
        fillColor:
            selectList.where((element) => element).isNotEmpty ? P_1 : B_4,
        onPressed: () async {
          if (selectList.where((element) => element).isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const MakeIntroduceScreen()),
            );
            await storage.write(
                key: 'userValues', value: jsonEncode(selectOptions));
            print('userValues : $selectOptions');
          } else {
            null;
          }
        },
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '프로필카드제작',
                  width: 99.w,
                ),
                SizedBox(height: 63.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleAvatar('1', false),
                    SizedBox(width: 12.w),
                    _circleAvatar('2', false),
                    SizedBox(width: 12.w),
                    _circleAvatar('3', true),
                  ],
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    '모임 참여 시\nOO이 가장 중요해요!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    width: 69.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: B_5,
                    ),
                    child: Center(
                      child: Text(
                        '가치관',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: P_1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 44.h),
                Center(
                  child: SizedBox(
                    width: 358.w,
                    height: 110.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: selectList[0] ? P_1 : B_5,
                          width: 1.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0.0,
                        backgroundColor: selectList[0] ? P_3 : B_5,
                      ),
                      onPressed: () {
                        setState(() {
                          selectList[0] = !selectList[0];
                          if (selectList[0]) {
                            selectList[1] = false;
                            selectList[2] = false;
                            selectOptions.clear();
                            selectOptions.add('소통');
                          }
                        });
                        print(selectOptions);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(24.w, 26.h, 0, 0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: selectList[0] ? P_3 : B_5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _title('소통', selectList[0] ? P_1 : B_2),
                            SizedBox(height: 8.h),
                            _subtitle('소통이 원활하게 이뤄지는 게 중요하지!', selectList[0] ? P_1 : B_3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 358.w,
                  height: 110.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: selectList[1] ? P_1 : B_5,
                        width: 1.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 0.0,
                      backgroundColor:
                          selectList[1]? P_3 : B_5,
                    ),
                    onPressed: () {
                      setState(() {
                        selectList[1] = !selectList[1];
                        if (selectList[1]) {
                          selectList[0] = false;
                          selectList[2] = false;
                          selectOptions.clear();
                          selectOptions.add('열정');
                        }
                      });
                      print(selectOptions);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24.w, 26.h, 0, 0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: selectList[1] ? P_3 : B_5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title('열정', selectList[1] ? P_1 : B_2),
                          SizedBox(height: 8.h),
                          _subtitle('모든 일의 시작은 열정이 아니겠어?', selectList[1] ? P_1 : B_3),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0.h),
                SizedBox(
                  width: 358.w,
                  height: 110.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            color: selectList[2] == true ? P_2 : B_5,
                            width: 1.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0.0,
                        backgroundColor:
                            selectList[2] ? P_3 : B_5),
                    onPressed: () {
                      setState(() {
                        selectList[2] = !selectList[2];
                        if (selectList[2]) {
                          selectList[0] = false;
                          selectList[1] = false;
                          selectOptions.clear();
                          selectOptions.add('약속');
                        }
                      });
                      print(selectOptions);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(24.w, 26.h, 0, 0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: selectList[2] ? P_3 : B_5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title('약속', selectList[2] ? P_1 : B_2),
                          SizedBox(height: 8.h),
                          _subtitle('약속은 기본 매너 아니겠어?', selectList[2] ? P_1 : B_3),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(String text, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SUIT',
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
        color: fontColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _subtitle(String text, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SUIT',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: fontColor,
      ),
    );
  }

  Widget _circleAvatar(String num, bool on) {
    return CircleAvatar(
      backgroundColor: on ? P_1 : B_5,
      radius: 12.0.r,
      child: Text(
        num,
        style: TextStyle(
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w500,
          fontSize: 14.0.sp,
          color: on ? WHITE : B_4,
        ),
      ),
    );
  }
}
