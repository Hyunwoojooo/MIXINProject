import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/moim_notice_format.dart';
import 'package:mixin_mac_2/models/my_moim_noticeboard_model/moim_notice_model.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_notice_detail.dart';

import '../../../../const/colors.dart';
import '../../../../const/data.dart';
import '../../../../layout/appbar_layout.dart';

class MoimNoticeboardNoticeMainScreen extends StatefulWidget {
  final int moimId;

  const MoimNoticeboardNoticeMainScreen(this.moimId, {super.key});

  @override
  State<MoimNoticeboardNoticeMainScreen> createState() =>
      _MoimNoticeboardNoticeMainScreenState();
}

class _MoimNoticeboardNoticeMainScreenState
    extends State<MoimNoticeboardNoticeMainScreen> {
  Dio dio = Dio();

  String url = '';
  int moimId = 0;

  List<MoimNoticeModel> noticeDataList = [];

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

      for (var noticeData in data['data']) {
        noticeDataList.add(MoimNoticeModel.fromJson(noticeData));
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
    moimId = widget.moimId;
    url = 'http://$ip/api/moim/notices?moimId=$moimId';
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppbarLayout(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 16.w),
                            Padding(
                              padding: EdgeInsets.only(top: 18.h),
                              child: Row(
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18.h),
                          child: GestureDetector(
                            onTap: () {
                              print('나의 이웃 설정');
                            },
                            child: Image.asset(
                              'assets/images/icons/plus.png',
                              width: 26.w,
                              height: 26.h,
                              color: B_1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: noticeDataList.length,
                        itemBuilder: (context, index) {
                          final noticeData = noticeDataList[index];

                          return MoimNoticeFormat(
                            noticeId: noticeData.noticeId,
                            title: noticeData.title,
                            createAt: noticeData.createAt,
                            viewCount: noticeData.viewCount,
                            commentCount: noticeData.commentCount,
                            checked: noticeData.checked,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MoimNoticeboardNoticeDetail(
                                        noticeId: noticeData.noticeId,
                                  ),
                                ),
                              );
                            },
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
