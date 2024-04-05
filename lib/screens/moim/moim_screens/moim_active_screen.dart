import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/screens/moim/make_regular_meeting.dart';

import '../../../components/moim_active.dart';
import '../../../components/moim_active_button.dart';
import '../../../const/data.dart';
import '../../../models/moim_activity_model.dart';

class MoimActiveScreen extends StatefulWidget {
  final int id;

  const MoimActiveScreen(this.id, {super.key});

  @override
  State<MoimActiveScreen> createState() => _MoimActiveScreenState();
}

class _MoimActiveScreenState extends State<MoimActiveScreen> {
  bool isCheckedAll = true;
  bool isCheckedBefore = false;
  bool isCheckedAfter = false;
  int? id;

  Dio dio = Dio();
  String? url;

  List<MoimActivityModel> moimActivitys = [];

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

      if (resp.data['code'] == -1) {
        return;
      }
      List<MoimActivityModel> newMoimActivitys = [];

      for (var moimData in data['data']) {
        newMoimActivitys.add(MoimActivityModel.fromJson(moimData));
      }
      print(newMoimActivitys);
      setState(() {
        moimActivitys = newMoimActivitys;
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
    id = widget.id;
    url = 'http://$ip/api/moim/activitys?moimId=$id&status=0';
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.add),
        backgroundColor: P_1,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MakeRegularMeeting(widget.id)),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Row(
                children: [
                  MoimActiveButton(
                    text: '전체보기',
                    backgroundColor: isCheckedAll ? P_3 : Colors.transparent,
                    borderColor: isCheckedAll ? P_3 : B_5,
                    textColor: isCheckedAll ? P_1 : B_4,
                    onPressed: () {
                      setState(() {
                        url =
                            'http://$ip/api/moim/activitys?moimId=$id&status=0';
                        fetchData();
                        isCheckedAll = true;
                        isCheckedBefore = false;
                        isCheckedAfter = false;
                      });
                    },
                  ),
                  SizedBox(width: 8.w),
                  MoimActiveButton(
                    text: '활동전',
                    backgroundColor:
                        isCheckedBefore ? P_3 : Colors.transparent,
                    borderColor: isCheckedBefore ? P_3 : B_5,
                    textColor:
                        isCheckedBefore ? P_1 : B_4,
                    onPressed: () {
                      setState(() {
                        url =
                            'http://$ip/api/moim/activitys?moimId=$id&status=3';
                        fetchData();
                        isCheckedAll = false;
                        isCheckedBefore = true;
                        isCheckedAfter = false;
                      });
                    },
                  ),
                  SizedBox(width: 8.w),
                  MoimActiveButton(
                    text: '활동후',
                    backgroundColor:
                        isCheckedAfter ? P_3 : Colors.transparent,
                    borderColor: isCheckedAfter ? P_3 : B_5,
                    textColor:
                        isCheckedAfter ? P_1 : B_4,
                    onPressed: () {
                      setState(() {
                        url =
                            'http://$ip/api/moim/activitys?moimId=$id&status=2';
                        fetchData();
                        isCheckedAll = false;
                        isCheckedBefore = false;
                        isCheckedAfter = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 19.h),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true, // 이 부분 추가
                  itemCount: moimActivitys.length,
                  itemBuilder: (context, index) {
                    final moimData = moimActivitys[index];
                    return MoimActive(
                      activityName: moimData.activityName,
                      activitySpot: moimData.activitySpot,
                      dday: moimData.dday,
                      activityDate: moimData.activityDate,
                      activityJoinedMember: moimData.activityJoinedMember,
                      userJoined: moimData.userJoined,
                      activityId: moimData.activityId,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
