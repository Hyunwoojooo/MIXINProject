import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_active_screen.dart';
import 'package:mixin_mac_2/screens/moim/moim_setting_screens/moim_setting_main_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../models/my_moim_model/member_model.dart';
import 'moim_info_screen.dart';
import 'moim_noticeboard/moim_noticeboard_screen.dart';

/*
  초록색 지우고 선택된 페이지만 검정색
 */
class MoimMainScreen extends StatefulWidget {
  final int id;

  const MoimMainScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<MoimMainScreen> createState() => _MoimMainScreenState();
}

class _MoimMainScreenState extends State<MoimMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Dio dio = Dio();

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

  String userNickName = '';
  String profilePictureUrl = '';

  String url = '';

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
        url,
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
      moimTags = data['data']['moimTags'];
      moimThumbnailUrl = data['data']['moimThumbnailUrl'];
      userNickName = data['data']['moimLeader']['userNickName'];
      profilePictureUrl = data['data']['moimLeader']['profilePictureUrl'];

      for (var memberData in data['data']['moimMemberList']['moimMember']) {
        memberDataList.add(Member.fromJson(memberData));
      }

      print(moimType);
      print(moimName);
      print(categoryImage);

      // print('categoryName = $categoryName');
      print('moimName = $moimName');
      // print('id = $id');
      // print('moimType = $moimType');
      // print('moimTags = $moimTags');
      // print('moimThumbnailUrl = $moimThumbnailUrl');
      // print('categoryImage = $categoryImage');
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
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    print('widget ID = ${widget.id}');
    id = widget.id;
    url = 'http://$ip/api/moimInfo?moimId=$id';
    fetchData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(215.h),
        child: AppBar(
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  '$imageUrl$moimThumbnailUrl',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 57.w, top: 145.h, bottom: 50.h),
                child: Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 36.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        color: P_3,
                      ),
                      child: Text(
                        moimType,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: P_1,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      width: 92.w,
                      height: 36.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            '$imageUrl$categoryImage',
                            width: 26.w,
                            height: 26.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          toolbarHeight: 150.h,
          titleSpacing: 0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/icons/back_icon.png',
              color: Colors.white,
              width: 26.w,
              height: 26.h,
            ),
          ),
          title: Text(
            moimName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const MoimSettingMainScreen()),
                  );
                },
                icon: Image.asset(
                  'assets/images/icons/setting.png',
                  width: 26.w,
                  height: 26.h,
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: P_1,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Text(
                      '정보',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '게시판',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '활동',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MoimInfoScreen(widget.id),
          MoimNoticeboardScreen(widget.id),
          MoimActiveScreen(widget.id),
        ],
      ),
    );
  }
}
