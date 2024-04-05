import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/appbar_layout.dart';
import 'package:mixin_mac_2/models/my_moim_noticeboard_model/moim_notice_detail_model.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';
import '../../../../const/data.dart';

class MoimNoticeboardNoticeDetail extends StatefulWidget {
  final int noticeId;

  MoimNoticeboardNoticeDetail({
    required this.noticeId,
    super.key,
  });

  @override
  State<MoimNoticeboardNoticeDetail> createState() =>
      _MoimNoticeboardNoticeDetailState();
}

class _MoimNoticeboardNoticeDetailState
    extends State<MoimNoticeboardNoticeDetail> {
  Dio dio = Dio();
  int noticeId = 0;
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

      userId = data['data']['makedUser']['userId'];
      userNickName = data['data']['makedUser']['userNickName'];
      profilePictureUrl = data['data']['makedUser']['profilePictureUrl'];
      userRole = data['data']['makedUser']['userRole'];
      title = data['data']['title'];
      content = data['data']['content'];
      imageUrls = data['data']['imageUrls'];
      createAt = data['data']['createAt'];
      viewCount = data['data']['viewCount'];
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
    noticeId = widget.noticeId;
    url = 'http://$ip/api/moim/notice?noticeId=$noticeId';
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
                child: Column(
                  children: [
                    Row(
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
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Divider(
                color: B_4,
                thickness: 1.w,
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
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10.w),
                    Container(
                      width: 45.w,
                      height: 20.h,
                      padding: EdgeInsets.only(left: 2.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF3D77DB).withOpacity(0.3),
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
