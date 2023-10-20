import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/profile_gauge.dart';
import '../../../const/colors.dart';
import '../../../layout/custom_floating_action_button.dart';

/*
  초록색 지우고 선택된 페이지만 검정색
 */
class MoimDetailScreen extends StatefulWidget {
  const MoimDetailScreen({Key? key}) : super(key: key);

  @override
  State<MoimDetailScreen> createState() => _MoimDetailScreenState();
}

class _MoimDetailScreenState extends State<MoimDetailScreen>
    with SingleTickerProviderStateMixin {
  final commentTextController = TextEditingController();
  bool isTextFieldFocused = false;
  bool isis = false;
  bool isBookMark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 밑 여백 죽이기
      appBar: AppBar(
        toolbarHeight: 75.w,
        leadingWidth: 71.w,
        backgroundColor: WHITE,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/icons/back_icon_black_3x.png',
              height: 26.h,
              width: 26.w,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
          child: const Text('모임상세'),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontFamily: 'SUIT',
          fontWeight: FontWeight.w600,
          color: MIXIN_BLACK_1,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, right: 13.w, bottom: 15.h),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 254.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 36.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '1:1로 문의하기',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w600,
                                color: MIXIN_BLACK_1,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              '신고하기',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w600,
                                color: MIXIN_BLACK_1,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'URL 공유하기',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  color: MIXIN_BLACK_1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Image.asset(
                'assets/images/more_vert.png',
                width: 26.w,
                height: 26.h,
                color: MIXIN_BLACK_1,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isTextFieldFocused
          ? null
          : MoimDetailFloatingActionButton(
        isBookMark: isBookMark,
              iconOnPressed: () {
                setState(() {
                  isBookMark = !isBookMark;
                });
              },
              onTap: () {
                setState(() {});
              },
            ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          isTextFieldFocused = false;
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 220.h,
                      child: Image.asset(
                        'assets/images/maskgroup.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: -1.w,
                      child: Container(
                        padding: EdgeInsets.only(left: 24.w, top: 20.h),
                        height: 44.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: WHITE,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/category_images/animal.png',
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              '디자인',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w500,
                                color: MIXIN_BLACK_2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '필름감아',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_1,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: MIXIN_BLACK_4,
                                size: 18.w,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '1/6',
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0.sp,
                                  color: MIXIN_BLACK_4,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 34.w,
                                height: 34.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MIXIN_BLACK_5,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 1.0)
                                  ],
                                ),
                                child: Center(
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/default_profile_image.png',
                                      fit: BoxFit.fitWidth,
                                      height: 31.h,
                                      width: 31.w,
                                    ),
                                  ),
                                ),
                              ),
                              const MiniProfileGauge(),
                            ],
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '먼지이이잉',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_1,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 28.h),
                      customRow('모임주기', '주 1회'),
                      SizedBox(height: 20.h),
                      customRow('가입조건', '남녀모두'),
                      SizedBox(height: 20.h),
                      customRow('승인여부', '승인 후 참여'),
                      SizedBox(height: 20.h),
                      customRow('모임규칙', '월 회비 10000원\n연애금지!!\n블라블라블라'),
                      SizedBox(height: 24.h),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F1F5),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Text(
                          '🛎🛎🛎 합류하게 될 팀에 대해 알려드려요!\n'
                          '• Server Developer (Product)는 토스뱅크의 메이커'
                          '조직인 스쿼드(Squad)에 속해있어요. Produt Owner/'
                          'Product Designer/Data Analyst 등 제품을 기획/개발'
                          '하는데 몰두하는 서로 다른 직군의 멤버들이 직군이 하나의'
                          '스쿼드를 이루어 작은 스타트업처럼 자율성을 갖고 일하고'
                          '있어요.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_1,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '관심 24  조회 102',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_3,
                          ),
                        ),
                      ),
                      SizedBox(height: 23.h),
                      Text(
                        '관련 태그',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      SizedBox(
                        height: 32.h,
                        child: ListView(
                          shrinkWrap: false,
                          physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 7.h),
                              margin: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                color: MIXIN_,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                '#필카',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 7.h),
                              margin: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                color: MIXIN_,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                '#필카',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 7.h),
                              margin: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                color: MIXIN_,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                '#필카',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 48.h),
                      Text(
                        '구성원',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      // SizedBox(
                      //   height: 102.h,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: [
                      //       memberList('먼지이잉'),
                      //       SizedBox(width: 12.w),
                      //       memberList('지넌'),
                      //       SizedBox(width: 12.w),
                      //       memberList('가지넌'),
                      //       SizedBox(width: 12.w),
                      //       memberList('나지넌'),
                      //       SizedBox(width: 12.w),
                      //       memberList('다지넌'),
                      //       SizedBox(width: 12.w),
                      //       memberList('라지넌'),
                      //       SizedBox(width: 12.w),
                      //       memberList('마지넌'),
                      //       SizedBox(width: 100.w),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // ------------------------------------------------------
                // 해야됨
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isis == true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: isis ? 0 : 24.w),
                    child: SizedBox(
                      height: 102.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          memberList('먼지이잉'),
                          SizedBox(width: 12.w),
                          memberList('현우'),
                          SizedBox(width: 12.w),
                          memberList('가현우'),
                          SizedBox(width: 12.w),
                          memberList('나현우'),
                          SizedBox(width: 12.w),
                          memberList('다현우'),
                          SizedBox(width: 12.w),
                          memberList('라현우'),
                          SizedBox(width: 12.w),
                          memberList('마현우'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 53.h),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget memberList(String name) {
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
                color: MIXIN_BLACK_5,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  )
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/default_profile_image.png',
                  height: 65.h,
                  width: 65.w,
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
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            color: MIXIN_BLACK_1,
          ),
        ),
      ],
    );
  }

  Widget customRow(String text1, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            color: const Color(0xFFB1B1B7),
          ),
        ),
        SizedBox(width: 40.w),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            color: const Color(0xFf414346),
          ),
        )
      ],
    );
  }
}
