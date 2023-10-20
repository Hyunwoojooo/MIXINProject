import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/list_myfriend.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/layout/appbar_layout.dart';

class MainProfileMyFriend extends StatefulWidget {
  const MainProfileMyFriend({super.key});

  @override
  State<MainProfileMyFriend> createState() => _MainProfileMyFriendState();
}

class _MainProfileMyFriendState extends State<MainProfileMyFriend> {
  TextEditingController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List dummyData = [
      ['가지넌', '커뮤니케이션학과', '19'],
      ['주현우', '자동화공학과', '18'],
      ['정지수', '커뮤니케이션학과', '18'],
      ['윤다빈', '로봇공학과', '18'],
      ['가지넌', '커뮤니케이션학과', '19'],
      ['가지넌', '커뮤니케이션학과', '19'],
    ];

    return Scaffold(
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
                    AppbarIconTextLayout(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: '나의 이웃'),
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: GestureDetector(
                        onTap: () {
                          print('나의 이웃 설정');
                        },
                        child: Image.asset(
                          'assets/images/icons/profile_setting.png',
                          width: 26.w,
                          height: 26.h,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    color: MIXIN_BLACK_5,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/search_icon.png',
                        height: 26.h,
                        width: 26.w,
                        color: MIXIN_BLACK_3,
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 294.w,
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_1,
                            fontSize: 16.sp,
                          ),
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: '이름으로 이웃을 검색하세요.',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: MIXIN_BLACK_3,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      '즐겨찾기',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      dummyData.length.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dummyData.length,
                    itemExtent: 53.w,
                    itemBuilder: (context, index) {
                      return ListMyFriend(null,
                          name: dummyData[index][0],
                          schoolID: dummyData[index][1],
                          department: dummyData[index][2]);
                    }),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      '전체이웃',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      dummyData.length.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dummyData.length,
                    itemExtent: 53.w,
                    itemBuilder: (context, index) {
                      return ListMyFriend(null,
                          name: dummyData[index][0],
                          schoolID: dummyData[index][1],
                          department: dummyData[index][2]);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
