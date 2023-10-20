import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/calendar.dart';
import 'package:mixin_mac_2/components/custom_textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/buttons/choice_cycle/choice_cycle.dart';
import '../components/buttons/choice_cycle/numbs.dart';
import '../const/colors.dart';
import '../const/data.dart';
import '../layout/appbar_layout.dart';

class MakeRegularMeeting extends StatefulWidget {
  const MakeRegularMeeting({super.key});

  @override
  State<MakeRegularMeeting> createState() => _MakeRegularMeetingState();
}

class _MakeRegularMeetingState extends State<MakeRegularMeeting> {
  TextEditingController? moimName;
  TextEditingController? moimPlace;
  TextEditingController? moimInfo;
  String regularMoimDate = '정기모임 날짜를 선택해주세요';
  String hour = '333';
  String? minute = '00';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moimName = TextEditingController();
    moimPlace = TextEditingController();
    moimInfo = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '정기모임 만들기',
                ),
                SizedBox(height: 43.h),
                Text(
                  '모임 이름',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_3,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  hintText: '모임 이름을 설정해주세요',
                  controller: moimName,
                  onChanged: (value) {
                    setState(() {});
                  },
                  borderColor:
                      moimName!.text.isNotEmpty ? MIXIN_ : MIXIN_BLACK_5,
                  fillColor: moimName!.text.isNotEmpty ? MIXIN_ : WHITE,
                ),
                SizedBox(height: 12.h),
                Text(
                  '모임 장소',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_3,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  hintText: '장소를 입력해주세요',
                  controller: moimPlace,
                  onChanged: (value) {
                    setState(() {});
                  },
                  borderColor:
                      moimPlace!.text.isNotEmpty ? MIXIN_ : MIXIN_BLACK_5,
                  fillColor: moimPlace!.text.isNotEmpty ? MIXIN_ : WHITE,
                ),
                SizedBox(height: 12.h),
                Text(
                  '모임 날짜',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_3,
                  ),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        regularMoimDate.length == 10 ? MIXIN_ : WHITE,
                    side: BorderSide(
                        color: regularMoimDate.length == 10
                            ? MIXIN_
                            : MIXIN_BLACK_5,
                        width: 1.5.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                      vertical: 11.h,
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 504.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.r),
                              topRight: Radius.circular(24.r),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const Calendar(),
                              SizedBox(
                                height: 56.h,
                                width: 342.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MIXIN_POINT_COLOR,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    elevation: 0.0,
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    if (prefs
                                        .getString('regularMoimDate')!
                                        .isNotEmpty) {
                                      regularMoimDate =
                                          prefs.getString('regularMoimDate')!;
                                      regularMoimDate = regularMoimDate
                                          .substring(0, 10)
                                          .replaceAll('-', '.');
                                    }
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
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
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        regularMoimDate,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: regularMoimDate.length == 15
                              ? MIXIN_BLACK_4
                              : MIXIN_BLACK_1,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icons/calendar_icon.png',
                        width: 22.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '모임 시간',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_3,
                  ),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hour.length == 3 ? WHITE : MIXIN_,
                    side: BorderSide(
                      color: hour.length == 3 ? MIXIN_BLACK_5 : MIXIN_,
                      width: 1.5.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                      vertical: 11.h,
                    ),
                    elevation: 0,
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
                              SizedBox(height: 70.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    height: 160.h,
                                    child: ListWheelScrollView.useDelegate(
                                      // controller: _controller,
                                      itemExtent: 70,
                                      perspective: 0.005,
                                      diameterRatio: 1000,
                                      squeeze: 1,
                                      overAndUnderCenterOpacity: 0.2,
                                      useMagnifier: true,
                                      magnification: 1.3,
                                      physics: const FixedExtentScrollPhysics(),
                                      onSelectedItemChanged: (int index) {
                                        // 선택된 인덱스를 hour 변수에 저장
                                        hour = index.toString();
                                      },
                                      childDelegate:
                                          ListWheelChildLoopingListDelegate(
                                        children: List<Widget>.generate(
                                          24,
                                          (index) {
                                            return Numbs(
                                              numbs: index,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 70.w),
                                  SizedBox(
                                    width: 70.w,
                                    height: 160.h,
                                    child: ListWheelScrollView.useDelegate(
                                      // onSelectedItemChanged: (value) ==> print(value),
                                      // controller: _controller,
                                      itemExtent: 60,
                                      perspective: 0.005,
                                      diameterRatio: 1000,
                                      squeeze: 1,
                                      overAndUnderCenterOpacity: 0.2,
                                      useMagnifier: true,
                                      magnification: 1.3,
                                      physics: const FixedExtentScrollPhysics(),
                                      onSelectedItemChanged: (int index) {
                                        // 선택된 인덱스를 hour 변수에 저장
                                        minute = index.toString();
                                      },
                                      childDelegate:
                                          ListWheelChildLoopingListDelegate(
                                        children:
                                            List<Widget>.generate(60, (index) {
                                          return Numbs(
                                            numbs: index,
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 70.h),
                              SizedBox(
                                height: 56.h,
                                width: 342.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MIXIN_POINT_COLOR,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    elevation: 0.0,
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
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
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        hour.length == 3
                            ? '정기모임 시간을 선택해주세요'
                            : '$hour : $minute',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              hour.length == 3 ? MIXIN_BLACK_4 : MIXIN_BLACK_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '게시글',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_3,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  hintText: '게시글을 입력해주세요',
                  controller: moimInfo,
                  onChanged: (value) {
                    setState(() {});
                  },
                  height: 220.h,
                  borderColor:
                      moimInfo!.text.isNotEmpty ? MIXIN_ : MIXIN_BLACK_5,
                  fillColor: moimInfo!.text.isNotEmpty ? MIXIN_ : WHITE,
                  maxLines: 10,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MIXIN_POINT_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: 342.w,
                      height: 56.h,
                      child: Center(
                        child: Text(
                          '다음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
}
