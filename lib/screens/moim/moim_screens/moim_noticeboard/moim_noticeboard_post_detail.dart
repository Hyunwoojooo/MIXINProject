import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/appbar_layout.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';
import '../../../../const/data.dart';

class MoimNoticeboardPostDetail extends StatefulWidget {
  final int boardId;
  MoimNoticeboardPostDetail({required this.boardId, super.key});

  @override
  State<MoimNoticeboardPostDetail> createState() =>
      _MoimNoticeboardPostDetailState();
}

class _MoimNoticeboardPostDetailState extends State<MoimNoticeboardPostDetail> {
  Dio dio = Dio();
  int boardId = 0;
  String url = '';

  int userId = 0;
  String userNickName = '';
  String profilePictureUrl = '';
  String userRole = '';
  String title = '';
  String content = '';
  List imageUrls = [];
  String createAt = '';
  int viewCount = 0;
  int commentCount = 0;
  String dateFormat(String date) {
    createAt = date
        .substring(0, 16)
        .replaceAll('-', ' ')
        .replaceRange(4, 4, '년')
        .replaceRange(8, 8, '월')
        .replaceRange(12, 12, '일')
        .replaceAll('T', ' ');
    return createAt;
  }

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
      print('3333333');


      userId = data['data']['makedUser']['userId'];
      print('1');

      userNickName = data['data']['makedUser']['userNickName'];
      print('2');

      profilePictureUrl = data['data']['makedUser']['profilePictureUrl'];
      print('3');


      title = data['data']['title'];
      print('5');

      content = data['data']['content'];
      print('6');
      if (data['data']['imageUrls'] != null) {
        imageUrls = data['data']['imageUrls'];
        print('7');
      } else {
        // Handle the case where imageUrls is null (provide a default value or perform necessary actions)
        print('imageUrls is null');
      }
      createAt = data['data']['createAt'];
      print('8');

      viewCount = data['data']['viewCount'];
      print('9');

      commentCount = data['data']['commentCount'];
      dateFormat(createAt);
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
    boardId = widget.boardId;
    url = 'http://$ip/api/moim/board?boardId=$boardId';
    fetchData();
    // TODO: implement initState
    super.initState();
  }


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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: GestureDetector(
                        onTap: () {
                          print('나의 이웃 설정');
                        },
                        child: Image.asset(
                          'assets/images/more_vert.png',
                          width: 26.w,
                          height: 26.h,
                          color: B_1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Row(
                  children: [
                    ProfileImage48(profilePicture: profilePictureUrl,),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userNickName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: B_1,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              createAt,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: B_4,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              '$viewCount명 읽음',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: B_4,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    SizedBox(height: 27.h),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: B_2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: 165.w,
                  height: 165.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child:
                            Image.network('$imageUrl/${imageUrls[index]}'));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
