import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/data.dart';
import 'package:mixin_mac_2/screens/main_screens/main_profile_screens/main_home_moim_screen.dart';
import 'package:mixin_mac_2/screens/main_screens/main_profile_screens/main_profile_screen_1.dart';
import 'package:mixin_mac_2/screens/moim/make_regular_meeting.dart';
import '../../../const/colors.dart';
import 'main_profile_myfriend.dart';
import 'main_profile_setting.dart';

class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final url = 'http://$ip/api/moim?page=0&size=3';
  Dio dio = Dio();

  void onTap(int index) {
    setState(() {});
  }

  Color indicatorColor() {
    if (_tabController.index == 0) {
      return Colors.black;
    } else if (_tabController.index == 1) {
      return Colors.black;
    }
    return Colors.transparent;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '마이홈',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: B_1,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MainProfileMyFriend()),
                  );
                },
                child: Image.asset(
                  'assets/images/icons/myfriend.png',
                  width: 26.w,
                  height: 26.h,
                ),
              ),
              SizedBox(width: 24.w),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MainProfileSetting()),
                  );
                },
                child: Image.asset(
                  'assets/images/icons/profile_setting.png',
                  width: 26.w,
                  height: 26.h,
                ),
              ),
              SizedBox(width: 12.w),
            ],
          )

        ],
        elevation: 0,
        backgroundColor: WHITE,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: WHITE,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                ],
                expandedTitleScale: 1,
                // centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 8.h),
                title: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: B_5, width: 2.w),
                      )),
                    ),
                    TabBar(
                      labelColor: B_1,
                      unselectedLabelColor: B_3,
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.w, color: P_1),
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                      controller: _tabController,
                      tabs: const [
                        Tab(text: '나의모임'),
                        Tab(text: '프로필'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: const [
              MainHomeMoimScreen(),
              MainProfileScreen1(),
            ],
          ),
        ),
      ),
    );
  }
}
