import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/data.dart';
import 'package:mixin_mac_2/screens/moim/make_regular_meeting.dart';
import '../../../const/colors.dart';
import 'main_home_home_screen.dart';
import '../main_profile_screens/main_home_moim_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen>
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
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 77.h,
              floating: true,
              backgroundColor: WHITE,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                ],
                expandedTitleScale: 1,
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 8.h),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 120.w),
                    SizedBox(
                      width: 150.w,
                      height: 36.h,
                      child: TabBar(
                        labelColor: WHITE,
                        unselectedLabelColor: B_1,
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Colors.black,
                        ),
                        controller: _tabController,
                        tabs: const [
                          Tab(text: 'home'),
                          Tab(text: 'moim'),
                        ],
                      ),
                    ),
                    SizedBox(width: 66.w),
                    Stack(
                      children: [
                        Positioned(
                            top: 9.h,
                            left: 30.w,
                            child: Image.asset(
                                'assets/images/point_color_dot.png')),
                        IconButton(
                          onPressed: () {

                          },
                          icon: Image.asset(
                            'assets/images/black_bell_3x.png',
                            width: 26.w,
                            height: 26.h,
                          ),
                        ),
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
              MainHomeHomeScreen(),
              MainHomeMoimScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
