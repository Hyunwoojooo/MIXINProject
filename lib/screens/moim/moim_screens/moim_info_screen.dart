import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/profile_image.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../models/my_moim_model/member_model.dart';

class MoimInfoScreen extends StatefulWidget {
  final int id;

  const MoimInfoScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<MoimInfoScreen> createState() => _MoimInfoScreenState();
}

class _MoimInfoScreenState extends State<MoimInfoScreen> {
  bool _isTextOverflow = false;
  bool _isMore = false;
  Dio dio = Dio();
  String? url;
  String textInfo = '필름감아는 필름 카메라 초보는 물론이고, 필름 카메라를 사용하시는 분들까지 모두 참여가능한 소모임입니다';

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

  int? id;
  String moimName = '';
  String moimType = '';
  List moimTags = [];
  String moimThumbnailUrl = '';
  String categoryName = '';
  String categoryImage = '';
  List? list;
  String currentMember = '';
  String moimDescription = '';
  String moimFrequency = '';
  List moimRules = [];

  // int moimLeaderUserId = 0;
  String moimLeaderUserNickName = '';
  String moimLeaderUserProfilePictureUrl = '';
  List memberDataList = [];


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
        url!,
        options: options,
      );
      print(resp);

      Map<String, dynamic> data = await resp.data;
      print('data = $data');

      moimName = data['data']['moimName'];
      moimType = data['data']['moimType'];
      moimTags = data['data']['moimTags'];
      categoryName = data['data']['categoryName'];
      categoryImage = data['data']['categoryUrl'];
      currentMember = data['data']['currentMember'];
      moimDescription = data['data']['moimDescription'];
      moimLeaderUserNickName = data['data']['moimLeader']['userNickName'];
      moimLeaderUserProfilePictureUrl =
          data['data']['moimLeader']['profilePictureUrl'];
      moimFrequency = data['data']['moimFrequency'];
      moimRules = data['data']['moimRules'];

      for (var memberData in data['data']['moimMemberList']['moimMember']) {
        memberDataList.add(Member.fromJson(memberData));
      }

      print(moimLeaderUserProfilePictureUrl);

      print(moimType);
      print(moimName);
      print('moimName = $moimName');
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
    _isTextOverflow = textInfo.length > 500;
    _isMore = !_isTextOverflow;
    print('widget ID = ${widget.id}');
    id = widget.id;
    url = 'http://$ip/api/myMoimInfo?moimId=$id';
  }

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
                      moimDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: B_3,
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
                          moimFrequency,
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
                          '${moimRules[0].toString()}\n'
                          '${moimRules[1].toString()}\n'
                          '${moimRules[2].toString()}',
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
                color: B_5,
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
                        color: B_2,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(
                      height: 32.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: moimTags.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: P_3,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              margin: EdgeInsets.only(right: 8.w),
                              child: Text(
                                '#${moimTags[index]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: P_1,
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
                color: B_5,
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
                          color: B_4,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          currentMember,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: B_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfileImage60(
                                  profilePicture:
                                      moimLeaderUserProfilePictureUrl,
                                ),
                                SizedBox(width: 23.w),
                                Text(
                                  moimLeaderUserNickName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: MIXIN_47,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '모임리더',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: B_3,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                    // 모임원
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Member member = memberDataList[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ProfileImage60(
                                      profilePicture: member.profilePictureUrl,
                                    ),
                                    SizedBox(width: 23.w),
                                    Text(
                                      member.userNickName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: MIXIN_47,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      },
                      itemCount: memberDataList.length,
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
