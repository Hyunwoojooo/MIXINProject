import 'dart:convert';

import 'package:dio/dio.dart';
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
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../../../models/moim_activity_model.dart';
import '../../../models/profile_model/myhome_my_activity_model.dart';

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

  Dio dio = Dio();
  String url = 'http://$ip/api/home/profile';

  String userName = '';
  String userUniversity = '';
  String userDepartment = '';
  String userStudentId = '';
  String userGender = '';
  String userNickName = '';

  List<MyHomeMyActivityModel> moimActivitys = [];

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

      if (resp.data['code'] == -1) {
        return;
      }
      // List<MoimActivityModel> newMoimActivitys = [];

      for (var moimData in data['data']['activities']) {
        moimActivitys.add(MyHomeMyActivityModel.fromJson(moimData));
      }

      print('moimActivitys = $moimActivitys');

      userName = data['data']['userProfile']['userName'];
      userUniversity = data['data']['userProfile']['userUniversity'];
      userDepartment = data['data']['userProfile']['userDepartment'];
      userStudentId = data['data']['userProfile']['userStudentId'];
      userGender = data['data']['userProfile']['userGender'];
      userNickName = data['data']['userProfile']['userNickName'];
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 13.h),
                    Row(
                      children: [
                        SizedBox(width: 19.w),
                        Text(
                          '50',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: P_1,
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
                                  userNickName.isEmpty
                                      ? userName
                                      : userNickName,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: B_1),
                                ),
                                Text(
                                  '$userName / $userUniversity\n$userDepartment / $userStudentId',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: P_1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 124.w),
                        backgroundColor: P_3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        '프로필 수정하기',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: P_1,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
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
                                  color: B_2,
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
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: B_1,
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
                                    color: B_2,
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
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: B_1,
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
                                    color: B_2,
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
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/icons/new_right_arrow_black_icon.png',
                                color: B_1,
                                height: 18.h,
                                // height: 18.h,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      '최근 모임 내역',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: MIXIN_47,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 130.h,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: moimActivitys.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final activityData = moimActivitys[index];
                          return MoimHistory(
                            activityId: activityData.activityId,
                            moimName: activityData.moimName,
                            activityDate: activityData.activityDate,
                            activityName: activityData.activityName,
                            activitySpot: activityData.activitySpot,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
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
