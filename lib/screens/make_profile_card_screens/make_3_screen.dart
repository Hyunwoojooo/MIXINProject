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
        fillColor: selectList.where((element) => element).isNotEmpty
            ? MIXIN_POINT_COLOR
            : MIXIN_BLACK_4,
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
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleAvatar('1', false),
                    SizedBox(width: 12.0.w),
                    _circleAvatar('2', false),
                    SizedBox(width: 12.0.w),
                    _circleAvatar('3', true),
                  ],
                ),
                SizedBox(height: 24.0.h),
                Center(
                  child: Text(
                    '모임 참여 시\nOO이 가장 중요해요!',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.0.h),
                Center(
                  child: Container(
                    width: 81.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0.r),
                      color: MIXIN_BLACK_5,
                    ),
                    child: Center(
                      child: Text(
                        '가치관',
                        style: TextStyle(
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0.sp,
                          color: MIXIN_POINT_COLOR,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                Center(
                  child: SizedBox(
                    width: 342.w,
                    height: 105.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            color:
                                selectList[0] == true ? MIXIN_2 : MIXIN_BLACK_5,
                            width: 1.5.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0.0,
                          backgroundColor:
                              selectList[0] == true ? MIXIN_ : Colors.white),
                      onPressed: () {
                        setState(() {
                          selectList[0] = !selectList[0];
                          if (selectList[0] == true) {
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
                        color: selectList[0] == true ? MIXIN_ : Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _title('소통'),
                            SizedBox(height: 7.0.h),
                            _subtitle('소통이 원활하게 이뤄지는 게 중요하지!'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0.h),
                SizedBox(
                  width: 342.w,
                  height: 105.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          color:
                              selectList[1] == true ? MIXIN_2 : MIXIN_BLACK_5,
                          width: 1.5.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 0.0,
                      backgroundColor:
                          selectList[1] == true ? MIXIN_ : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectList[1] = !selectList[1];
                        if (selectList[1] == true) {
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
                      color: selectList[1] == true ? MIXIN_ : Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title('열정'),
                          SizedBox(height: 7.0.h),
                          _subtitle('모든 일의 시작은 열정이 아니겠어?'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0.h),
                SizedBox(
                  width: 342.w,
                  height: 105.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            color:
                                selectList[2] == true ? MIXIN_2 : MIXIN_BLACK_5,
                            width: 1.5.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0.0,
                        backgroundColor:
                            selectList[2] == true ? MIXIN_ : Colors.white),
                    onPressed: () {
                      setState(() {
                        selectList[2] = !selectList[2];
                        if (selectList[2] == true) {
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
                      color: selectList[2] == true ? MIXIN_ : Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title('약속'),
                          SizedBox(height: 7.0.h),
                          _subtitle('약속은 기본 매너 아니겠어?'),
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

  Widget _title(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SUIT',
        fontWeight: FontWeight.w600,
        fontSize: 20.0.sp,
        color: MIXIN_BLACK_1,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _subtitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SUIT',
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w500,
        color: MIXIN_BLACK_3,
      ),
    );
  }

  Widget _circleAvatar(String num, bool on) {
    return CircleAvatar(
      backgroundColor: on ? MIXIN_POINT_COLOR : MIXIN_BLACK_5,
      radius: 12.0.r,
      child: Text(
        num,
        style: TextStyle(
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w500,
          fontSize: 14.0.sp,
          color: on ? WHITE : MIXIN_BLACK_4,
        ),
      ),
    );
  }
}
