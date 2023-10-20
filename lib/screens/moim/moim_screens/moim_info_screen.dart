import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/profile_image.dart';
import '../../../const/colors.dart';

class MoimInfoScreen extends StatefulWidget {
  const MoimInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoimInfoScreen> createState() => _MoimInfoScreenState();
}

class _MoimInfoScreenState extends State<MoimInfoScreen> {
  bool _isTextOverflow = false;
  bool _isMore = false;
  String textInfo = '필름감아는 필름 카메라 초보는 물론이고, 필름 카메라를 사용하시는 분들까지 모두 참여가능한 소모임입니다';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isTextOverflow = textInfo.length > 500;
    _isMore = !_isTextOverflow;
  }

  final List<dynamic> dummyData = [
    '필름감아는 필름 카메라 초보는 필름감아는 필름 카메라 초보는 필름감아는 필름 카메라 초보는 필름감아는 필름 카메라 초보는 필름감아는 필름 카메라 초보는 ',
    '주 1회',
    '매주 화요일 회의',
    '서로 존중하기',
    '약속 시간 늦지 않기',
  ];
  final List<List> dummyFriend = [
    ['먼지이이잉', '모임리더'],
    ['헬로우', ''],
    ['하하호호히히', ''],
    ['닉네임', ''],
    ['로자공', ''],
  ];
  final List dummyTag = [
    '필카',
    '동네사진',
    '사진찍기',
    '추억',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              // 모임 정보
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dummyData[0],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: MIXIN_BLACK_3,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Text(
                          '모임주기',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color(0xFFB1B1B7),
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Text(
                          dummyData[1],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: MIXIN_47,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '모임규칙',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: const Color(0xFFB1B1B7)),
                        ),
                        SizedBox(width: 40.w),
                        Text(
                          '1. ${dummyData[2]}\n'
                          '2. ${dummyData[3]}\n'
                          '3. ${dummyData[4]}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: MIXIN_47,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6.h,
                color: MIXIN_BLACK_5,
              ),
              // 관련 태그
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.w, 33.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '관련 태그',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: MIXIN_BLACK_2,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(
                      height: 32.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyTag.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MIXIN_,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              margin: EdgeInsets.only(right: 8.w),
                              child: Text(
                                '#${dummyTag[index]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6.h,
                color: MIXIN_BLACK_5,
              ),
              // 모임원
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '모임원',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        const Icon(
                          Icons.person,
                          color: MIXIN_BLACK_4,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          dummyFriend.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: MIXIN_BLACK_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    // 모임원
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ProfileImage60(),
                                    SizedBox(width: 23.w),
                                    Text(
                                      dummyFriend[index][0].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: MIXIN_47,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  dummyFriend[index][1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: MIXIN_BLACK_3,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      },
                      itemCount: dummyFriend.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
