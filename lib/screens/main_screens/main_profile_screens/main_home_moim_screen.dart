import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mixin_mac_2/const/data.dart';
import 'package:mixin_mac_2/models/moim_activity_model.dart';
import 'package:mixin_mac_2/models/profile_model/myhome_my_moim_model.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';
import '../../../models/moim_data.dart';

class MainHomeMoimScreen extends StatefulWidget {
  const MainHomeMoimScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeMoimScreen> createState() => _MainHomeMoimScreenState();
}

class _MainHomeMoimScreenState extends State<MainHomeMoimScreen> {
  final List<bool> _isBellSelect = List.filled(5, false);
  final String url = 'http://$ip/api/home/moim';
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
      '서울시 구로구 | 깍둑',
      '완료',
    ],
    [
      '07.30(목)',
      '10:00 pm',
      '필름안감아 3주차 모임',
      '서울시 구로구 | 깍둑',
      '예정',
    ],
  ];

  List<Moims> moimDataList = [];
  List<Activities> moimActivityDataList = [];

  Dio dio = Dio();

  void fetchData() async {
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    // dio 사용
    try {
      Options options = Options(
        headers: {
          "Authorization": jsonDecode(refreshToken!)[0],
        },
        method: 'GET',
      );

      final Response resp = await dio.get(
        url,
        options: options,
      );
      print(resp);

      Map<String, dynamic> data = await resp.data;
      print('data = $data');

      for (var activityData in data['data']['activities']) {
        moimActivityDataList.add(Activities.fromJson(activityData));
      }
      for (var moimData in data['data']['moims']) {
        moimDataList.add(Moims.fromJson(moimData));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print('DioError response: ${e.response}');
        } else {
          print('DioError error: $e');
        }
      } else {
        print('Unexpected error: $e');
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '나의 모임 스케줄',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
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
                          color: B_3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
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
                              ? (index > 2 ? (index == 3 ? 37.w : 42.w) : 38.w)
                              : 42.w,
                        ),
                        child: Text(
                          index == 3
                              ? '오늘'
                              : DateFormat.E('ko_KR').format(DateTime.now()
                                  .add(Duration(days: index - 3))),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color:
                                index == 3 ? P_1 : B_3,
                          ),
                        ),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
              ),
              Divider(thickness: 1.w, color: B_5),
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
                      backgroundColor: index == 3 ? P_3 : Colors.transparent,
                      child: Text(
                        DateFormat.d().format(
                            DateTime.now().add(Duration(days: index - 3))),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: index == 3 ? P_1 : B_4,
                        ),
                      ),
                    );
                  },
                  itemCount: 7,
                ),
              ),
              Divider(thickness: 1.w, color: B_5),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 버튼
                    // Row(
                    //   children: [
                    //     _TextButton(onPressed: () {}, text: '전체'),
                    //     SizedBox(width: 8.w),
                    //     _TextButton(onPressed: () {}, text: '개설한 모임'),
                    //     SizedBox(width: 8.w),
                    //     _TextButton(onPressed: () {}, text: '참여중인 모임'),
                    //   ],
                    // ),
                    // SizedBox(height: 19.h),
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
                                backgroundColor: B_4,
                              ),
                              Container(
                                height: 30.h,
                                width: 0.5.w,
                                color: B_4,
                              ),
                              CircleAvatar(
                                radius: 4.r,
                                backgroundColor: P_2,
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
                                                color: B_1,
                                              ),
                                              TextWidget(
                                                text: dummyData[index][1],
                                                color: B_1,
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
                                                  color: B_1),
                                              TextWidget(
                                                  text: dummyData[index][3],
                                                  color: B_3),
                                            ],
                                          ),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: P_1,
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
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  '나의 모임',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: B_1,
                  ),
                ),
              ),
              SizedBox(height: 13.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 24.w),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         '나의 모임',
              //         style: TextStyle(
              //           fontSize: 22.sp,
              //           fontWeight: FontWeight.w600,
              //           color: MIXIN_BLACK_1,
              //         ),
              //       ),
              //       SizedBox(height: 10.h),
              //       Row(
              //         children: [
              //           _TextButton(onPressed: () {}, text: '전체'),
              //           SizedBox(width: 8.w),
              //           _TextButton(onPressed: () {}, text: '개설한 모임'),
              //           SizedBox(width: 8.w),
              //           _TextButton(onPressed: () {}, text: '참여중인 모임'),
              //         ],
              //       ),
              //       SizedBox(height: 13.h),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 1500.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: moimDataList.length,
                  itemBuilder: (context, index) {
                    final moimData = moimDataList[index];
                    return Column(
                      children: [
                        ProfileMyMoim(
                          moimId: moimData.moimId,
                          moimName: moimData.moimName,
                          moimTags: moimData.moimTags,
                          moimThumbnailUrl: moimData.moimThumbnailUrl,
                          currentMember: moimData.currentMember,
                          totalMember: moimData.totalMember,
                          userRole: moimData.userRole,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => MoimMainScreen(moimData.moimId)),
                            );
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],
                    );
                  },
                ),
              ),
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

class _TextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const _TextButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: P_3,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: P_1,
          ),
        ),
      ),
    );
  }
}
