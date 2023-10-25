import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:intl/intl.dart';
import 'package:mixin_mac_2/layout/moim_history.dart';
import 'package:mixin_mac_2/layout/nopadding_textbutton.dart';
import 'package:mixin_mac_2/screens/main_screens/main_profile_screens/main_profile_myfriend.dart';
import 'package:mixin_mac_2/screens/main_screens/main_profile_screens/main_profile_setting.dart';

import '../../../components/profile_gauge.dart';
import '../../../const/colors.dart';
import '../../../layout/appbar_layout.dart';

class MainProfileScreen1 extends StatefulWidget {
  const MainProfileScreen1({Key? key}) : super(key: key);

  @override
  State<MainProfileScreen1> createState() => _MainProfileScreen1State();
}

class _MainProfileScreen1State extends State<MainProfileScreen1> {
  DateTime now = DateTime.now();
  String nowDay =
      DateFormat.d().format(DateTime.now().subtract(Duration(days: 1)));
  String dayOfTheWeek =
      DateFormat.E('ko_KR').format(DateTime.now().subtract(Duration(days: 3)));

  List dummyData = [
    [
      '07.30(목)',
      '08:00 am',
      '필름감아 3주차 모임',
      '서울시 광진구 | 깍둑',
      '완료',
    ],
    [
      '07.30(목)',
      '10:00 pm',
      '필름안감아 3주차 모임',
      '서울시 광진구 | 깍둑',
      '예정',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '프로필',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: MIXIN_BLACK_1,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MainProfileMyFriend()),
                                );
                              },
                              child: Image.asset(
                                'assets/images/icons/myfriend.png',
                                width: 26.w,
                                height: 26.h,
                              ),
                            ),
                            SizedBox(width: 24.w),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MainProfileSetting()),
                                );
                              },
                              child: Image.asset(
                                'assets/images/icons/profile_setting.png',
                                width: 26.w,
                                height: 26.h,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      children: [
                        SizedBox(width: 19.w),
                        Text(
                          '50',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MIXIN_POINT_COLOR,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ProfileCardGauge(),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '먼지이이잉',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: MIXIN_BLACK_1),
                                ),
                                Text(
                                  '주현우 / 동양미래대학교\n자동화공학과 / 23',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MIXIN_POINT_COLOR,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 11.w, vertical: 6.h),
                              backgroundColor: MIXIN_,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Text(
                              '프로필 관리',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: MIXIN_POINT_COLOR,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '나의 모임 스케줄',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: MIXIN_BLACK_1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print(nowDay);
                            print(dayOfTheWeek);
                          },
                          child: Text(
                            '전체보기>',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 11.h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        // itemExtent: 51.w,
                        padding: EdgeInsets.symmetric(horizontal: 13.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index >= 2
                                    ? (index > 2
                                        ? (index == 3 ? 37.w : 42.w)
                                        : 38.w)
                                    : 42.w),
                            child: Text(
                              index == 3
                                  ? '오늘'
                                  : DateFormat.E('ko_KR').format(DateTime.now()
                                      .add(Duration(days: index - 3))),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: index == 3
                                    ? MIXIN_POINT_COLOR
                                    : MIXIN_BLACK_3,
                              ),
                            ),
                          );
                        },
                        itemCount: 7,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1.w, color: MIXIN_BLACK_5),
              SizedBox(
                height: 47.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemExtent: 51.w,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      radius: 47.r,
                      backgroundColor: index == 3 ? MIXIN_ : Colors.transparent,
                      child: Text(
                        DateFormat.d().format(
                            DateTime.now().add(Duration(days: index - 3))),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: index == 3 ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
                        ),
                      ),
                    );
                  },
                  itemCount: 7,
                ),
              ),
              Divider(thickness: 1.w, color: MIXIN_BLACK_5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 버튼
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: MIXIN_,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.h),
                            child: Text(
                              '전체',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MIXIN_POINT_COLOR,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: MIXIN_,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 6.h),
                            child: Text(
                              '개설한 모임',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MIXIN_POINT_COLOR,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: MIXIN_,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 6.h),
                            child: Text(
                              '참여중인 모임',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: MIXIN_POINT_COLOR,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                    // 일정
                    SizedBox(
                      height: 80.h,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 9.h),
                              CircleAvatar(
                                radius: 4.r,
                                backgroundColor: MIXIN_BLACK_4,
                              ),
                              Container(
                                height: 30.h,
                                width: 0.5.w,
                                color: MIXIN_BLACK_4,
                              ),
                              CircleAvatar(
                                radius: 4.r,
                                backgroundColor: MIXIN_2,
                              ),
                            ],
                          ),
                          SizedBox(width: 7.w),
                          Container(
                            color: WHITE,
                            width: 228.w,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              TextWidget(
                                                text: dummyData[index][0],
                                                color: MIXIN_BLACK_1,
                                              ),
                                              TextWidget(
                                                text: dummyData[index][1],
                                                color: MIXIN_BLACK_1,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 16.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                  text: dummyData[index][2],
                                                  color: MIXIN_BLACK_1),
                                              TextWidget(
                                                  text: dummyData[index][3],
                                                  color: MIXIN_BLACK_3),
                                            ],
                                          ),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: MIXIN_POINT_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.w, vertical: 4.h),
                                        child: Text(
                                          dummyData[index][4],
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: WHITE,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      '나의 활동',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: MIXIN_47,
                      ),
                    ),
                    SizedBox(height: 17.h),
                    // 좋아요/북마크/댓글
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/icons/heart_black2.png',
                                  width: 20.w,
                                  color: MIXIN_BLACK_2,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '좋아요',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MIXIN_47,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: MIXIN_BLACK_1,
                                height: 18.h,
                                // height: 18.h,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/icons/bookmark_black2.png',
                                    width: 14.w,
                                    color: MIXIN_BLACK_2,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '북마크',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MIXIN_47,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: MIXIN_BLACK_1,
                                height: 18.h,
                                // height: 18.h,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Image.asset(
                                    'assets/images/icons/chatting_black2.png',
                                    width: 20.w,
                                    color: MIXIN_BLACK_2,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '내가 쓴 글/댓글',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MIXIN_47,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: MIXIN_BLACK_1,
                                height: 18.h,
                                // height: 18.h,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '모임 히스토리',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: MIXIN_47,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          icon: Image.asset(
                            'assets/images/more_vert.png',
                            color: MIXIN_BLACK_1,
                            height: 18.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const MoimHistory(),
                    SizedBox(height: 16.h),
                    const MoimHistory(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;

  const TextWidget({required this.text, super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
