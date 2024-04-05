import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/custom_floating_action_button.dart';

import '../../../components/profile_gauge.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../../../models/moim_activity_detail_model.dart';
import '../../../models/moim_activity_model.dart';

class MoimActiveDetailScreen extends StatefulWidget {
  final int activityId;

  const MoimActiveDetailScreen({required this.activityId, super.key});

  @override
  State<MoimActiveDetailScreen> createState() => _MoimActiveDetailScreenState();
}

class _MoimActiveDetailScreenState extends State<MoimActiveDetailScreen> {

  int? activityId;

  Dio dio = Dio();
  String? url;

  MoimActivityDetailModel? moimActivityDetail;


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

      MoimActivityDetailModel newMoimActivityDetail = MoimActivityDetailModel.fromJson(data['data']);  // 단일 객체

      setState(() {
        moimActivityDetail = newMoimActivityDetail;
      });

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
  }

  @override
  void initState() {
    super.initState();
    activityId = widget.activityId;
    url = 'http://$ip/api/moim/activityInfo?activityId=$activityId';
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
        text: '참여하기',
        fillColor: P_1,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 43.h),
                Text(
                  moimActivityDetail != null ? moimActivityDetail!.activityName : 'Loading...', // 'Loading...' 대신에 원하는 기본값으로 변경
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: B_1,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/calendar_icon.png',
                      height: 16.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      moimActivityDetail != null ? moimActivityDetail!.activityDate : 'Loading...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: B_2,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Image.asset(
                      'assets/images/icons/map_point.png',
                      height: 13.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      moimActivityDetail != null ? moimActivityDetail!.activitySpot : 'Loading...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: B_2,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 27.h),
                Text(
                  moimActivityDetail != null ? moimActivityDetail!.activityInformation : 'Loading...',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: B_2,
                  ),
                ),
                SizedBox(height: 30.h),
                Divider(
                  color: B_5,
                  thickness: 1.w,
                ),
                SizedBox(height: 9.h),
                Text(
                  '참여자',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: B_2,
                  ),
                ),
                SizedBox(height: 12.h),
                // SizedBox(
                //   height: 107.h,
                //   child: ListView.builder(
                //     itemCount: moimMemberList?.length,
                //     itemExtent: 84.w,
                //     itemBuilder: (context, index) {
                //       return memberList(
                //           moimMemberList?[index]['userNickName'],
                //           moimMemberList?[index]['profilePictureUrl']);
                //     },
                //     scrollDirection: Axis.horizontal,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget memberList(String name, String profileImage) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: B_5,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  '$imageUrl$profileImage',
                  height: 68.h,
                  width: 68.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Ver72ProfileGauge(),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: B_1,
          ),
        ),
      ],
    );
  }
}
