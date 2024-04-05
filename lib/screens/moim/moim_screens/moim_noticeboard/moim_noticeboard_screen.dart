import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_main_screen.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_notice_detail.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';
import '../../../../const/data.dart';
import '../../../../models/my_moim_model/member_model.dart';
import '../../../../models/my_moim_noticeboard_model/moim_notice_model.dart';
import '../../../../models/my_moim_noticeboard_model/moim_post_model.dart';
import 'moim_noticeboard_notice_main_screen.dart';
import 'moim_noticeboard_post_detail.dart';

class MoimNoticeboardScreen extends StatefulWidget {
  final int moimId;

  const MoimNoticeboardScreen(this.moimId, {Key? key}) : super(key: key);

  @override
  State<MoimNoticeboardScreen> createState() => _MoimNoticeboardScreenState();
}

class _MoimNoticeboardScreenState extends State<MoimNoticeboardScreen> {
  final ScrollController _scrollController = ScrollController();

  String url = '';
  int moimId = 0;

  Dio dio = Dio();
  List<MoimPostModel> postDataList = [];
  List<Member> memberDataList = [];

  int noticeId = 0;
  String noticeTitle = '';
  String noticeCreateAt = '';
  int viewCount = 0;
  int commentCount = 0;
  bool checked = false;

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

      for (var boardData in data['data']['boards']) {
        postDataList.add(MoimPostModel.fromJson(boardData));
      }

      for (var board in data['data']['boards']) {
        var makedUser = board['makedUser'];
        memberDataList.add(Member.fromJson(makedUser));
      }

      noticeId = data['data']['notice']['noticeId'];
      noticeTitle = data['data']['notice']['title'];
      noticeCreateAt = data['data']['notice']['createAt'];
      viewCount = data['data']['notice']['viewCount'];
      checked = data['data']['notice']['checked'];
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
    _scrollController.addListener(() {
      scrollListener();
    });
    moimId = widget.moimId;
    url = 'http://$ip/api/moim/boards?moimId=$moimId';
    // url = 'http://$ip/api/moim/boards?moimId=30';
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() async {
    // print('offset = ${_scrollController.offset}');

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('스크롤이 맨 바닥에 위치해 있습니다');
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => MoimNoticeboardMainScreen(widget.moimId)),
      );
    } else if (_scrollController.offset ==
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('스크롤이 맨 위에 위치해 있습니다');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/bell.png',
                            width: 26.w,
                            height: 26.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '공지사항',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: B_2,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20.w),
                            Text(
                              'All',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: B_4,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 14.w,
                              color: B_4,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MoimNoticeboardNoticeMainScreen(
                                widget.moimId,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 18.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MoimNoticeboardNoticeDetail(
                            noticeId: noticeId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 134.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: B_5),
                      ),
                      padding: EdgeInsets.only(left: 20.w, top: 21.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              width: 45.w,
                              height: 20.h,
                              padding: EdgeInsets.only(left: 2.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF3D77DB).withOpacity(0.3),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.h,
                                    padding: EdgeInsets.all(3.h),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF3D77DB),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/icons/check_icon.png',
                                      fit: BoxFit.contain,
                                      height: 8.h,
                                      width: 11.w,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    viewCount.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: const Color(0xFF3D77DB)),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 21.h),
                          Text(
                            noticeTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: B_2,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                noticeCreateAt
                                    .substring(0, 16)
                                    .replaceAll('-', ' ')
                                    .replaceRange(4, 4, '년')
                                    .replaceRange(8, 8, '월')
                                    .replaceRange(12, 12, '일')
                                    .replaceAll('T', ' '),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: B_4,
                                ),
                              ),
                              SizedBox(width: 13.w),
                              Text(
                                checked ? '확인' : '미확인',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: P_1,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6.w,
              color: B_5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/notice_board.png',
                        height: 26.h,
                        width: 26.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '게시판',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: B_2,
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: postDataList.length,
                      itemBuilder: (context, index) {
                        final memberData = memberDataList[index];
                        final postData = postDataList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MoimNoticeboardPostDetail(
                                  boardId: postData.boardId,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ProfileImage30(
                                      profilePicture:
                                          memberData.profilePictureUrl,
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          memberData.userNickName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: B_1,
                                          ),
                                        ),
                                        Text(
                                          postData.createAt
                                              .substring(0, 16)
                                              .replaceAll('-', ' ')
                                              .replaceRange(4, 4, '년')
                                              .replaceRange(8, 8, '월')
                                              .replaceRange(12, 12, '일')
                                              .replaceAll('T', ' '),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            color: B_4,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                // 텍스트
                                Padding(
                                  padding: EdgeInsets.only(left: 48.w),
                                  child: Text(
                                    postData.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: B_2,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Divider(
                                  thickness: 1.w,
                                  color: B_5,
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
