import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import 'make_2_screen.dart';

class MakePositionScreen extends StatefulWidget {
  const MakePositionScreen({Key? key}) : super(key: key);

  @override
  State<MakePositionScreen> createState() => _MakePositionScreenState();
}

class _MakePositionScreenState extends State<MakePositionScreen> {
  final storage = const FlutterSecureStorage();

  List<bool> positionList = List.filled(4, false);
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        text: '다음',
        fillColor: (positionList.where((element) => element).length == 1)
            ? MIXIN_POINT_COLOR
            : MIXIN_BLACK_4,
        onPressed: () async {
          if (positionList.where((element) => element).length == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const MakeCharacterScreen()),
            );
            await storage.write(
                key: 'userPosition', value: jsonEncode(selectedOptions));
            print('userPosition : $selectedOptions');
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
                    _circleAvatar('1', true),
                    SizedBox(width: 12.0.w),
                    _circleAvatar('2', false),
                    SizedBox(width: 12.0.w),
                    _circleAvatar('3', false),
                  ],
                ),
                SizedBox(height: 24.0.h),
                Center(
                  child: Text(
                    '모임 내에서\n나의 포지션은?',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0.sp,
                      color: MIXIN_BLACK_1,
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
                        '참여유형',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButtonFormat(
                      borderSideColor:
                          positionList[0] == true ? MIXIN_2 : MIXIN_BLACK_5,
                      backgroundColor:
                          positionList[0] == true ? MIXIN_ : Colors.white,
                      containerColor:
                          positionList[0] == true ? MIXIN_ : Colors.white,
                      mainText: '리더형',
                      subText: '나 빼고 결정하는건\n못참지',
                      onPressed: () {
                        setState(() {
                          positionList[0] = !positionList[0];
                          if (positionList[0] == true) {
                            positionList[1] = false;
                            positionList[2] = false;
                            positionList[3] = false;
                            selectedOptions.clear();
                            selectedOptions.add('리더형');
                          }
                          print(selectedOptions);
                        });
                      },
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButtonFormat(
                      borderSideColor:
                          positionList[1] == true ? MIXIN_2 : MIXIN_BLACK_5,
                      backgroundColor:
                          positionList[1] == true ? MIXIN_ : Colors.white,
                      containerColor:
                          positionList[1] == true ? MIXIN_ : Colors.white,
                      mainText: '분위기메이커형',
                      subText: '이 모임 분위기는\n내가 책임진다!',
                      onPressed: () {
                        setState(() {
                          positionList[1] = !positionList[1];
                          if (positionList[1] == true) {
                            positionList[2] = false;
                            positionList[0] = false;
                            positionList[3] = false;
                            selectedOptions.clear();
                            selectedOptions.add('분위기메이커형');
                          }
                          print(selectedOptions);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    ElevatedButtonFormat(
                      borderSideColor:
                          positionList[2] == true ? MIXIN_2 : MIXIN_BLACK_5,
                      backgroundColor:
                          positionList[2] == true ? MIXIN_ : Colors.white,
                      containerColor:
                          positionList[2] == true ? MIXIN_ : Colors.white,
                      mainText: '다좋아형',
                      subText: '좋아좋아\n뭐든지 다 좋아~',
                      onPressed: () {
                        setState(() {
                          positionList[2] = !positionList[2];
                          if (positionList[2] == true) {
                            positionList[1] = false;
                            positionList[0] = false;
                            positionList[3] = false;
                            selectedOptions.clear();
                            selectedOptions.add('다좋아형');
                          }
                          print(selectedOptions);
                        });
                      },
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButtonFormat(
                      borderSideColor:
                          positionList[3] == true ? MIXIN_2 : MIXIN_BLACK_5,
                      backgroundColor:
                          positionList[3] == true ? MIXIN_ : Colors.white,
                      containerColor:
                          positionList[3] == true ? MIXIN_ : Colors.white,
                      mainText: '차분형',
                      subText: '당황하지 않아요\n침착하게..',
                      onPressed: () {
                        setState(() {
                          positionList[3] = !positionList[3];
                          if (positionList[3] == true) {
                            positionList[1] = false;
                            positionList[0] = false;
                            positionList[2] = false;
                            selectedOptions.clear();
                            selectedOptions.add('차분형');
                          }
                          print(selectedOptions);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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

// ignore: must_be_immutable
class ElevatedButtonFormat extends StatelessWidget {
  Color borderSideColor;
  Color backgroundColor;
  Color containerColor;
  String mainText;
  String subText;
  void Function() onPressed;

  ElevatedButtonFormat(
      {required this.borderSideColor,
      required this.backgroundColor,
      required this.containerColor,
      required this.mainText,
      required this.subText,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165.w,
      height: 105.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: borderSideColor,
            width: 1.5.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          padding: EdgeInsets.zero,
          elevation: 0.0,
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Container(
          color: containerColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subText,
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                  color: MIXIN_BLACK_3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0.h),
              Text(
                mainText,
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w600,
                  color: MIXIN_BLACK_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
