import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_main_screen.dart';

import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';

class MainHomeMoimScreen extends StatefulWidget {
  const MainHomeMoimScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeMoimScreen> createState() => _MainHomeMoimScreenState();
}

class _MainHomeMoimScreenState extends State<MainHomeMoimScreen> {
  final List<bool> _isBellSelect = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 19.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // 내 모임
                        MyMoimCard(
                          bellColor: Colors.red,
                          iconOnPressed: () {},
                          moimType: '스터디',
                          backgroundImage: 'assets/images/maskgroup.png',
                          categoryImage:
                              'assets/images/category_images/music.png',
                          categoryName: '음악',
                          memberGender: 0,
                          currentMember: 6,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MoimMainScreen()),
                            );
                          },
                          moimName: '가나다라마바사아자차카',
                          tag: const ['필카', '촬영', '출사'],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 342.w,
                          height: 314.h,
                          child: Column(
                            children: [
                              // 썸네일
                              Stack(
                                children: [
                                  Container(
                                    height: 192.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.r),
                                        topLeft: Radius.circular(8.r),
                                      ),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.h,
                                    right: 16.3.w,
                                    child: Container(
                                      width: 62.w,
                                      height: 32.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: MIXIN_BLACK_5,
                                      ),
                                      child: Text(
                                        '동아리',
                                        style: TextStyle(
                                          fontFamily: 'SUIT',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: MIXIN_POINT_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.w,
                                    bottom: 8.h,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isBellSelect[1] = !_isBellSelect[1];
                                        });
                                      },
                                      icon: Image.asset(
                                        'assets/images/icons/bell.png',
                                        color: _isBellSelect[1]
                                            ? null
                                            : MIXIN_BLACK_4,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 122.h,
                                padding: EdgeInsets.only(
                                    top: 8.h, left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 0.2,
                                        blurRadius: 3,
                                        offset: const Offset(1, 1),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 모임 카테고리
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/category_images/culture.png',
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          '문화활동',
                                          style: TextStyle(
                                            fontFamily: 'SUIT',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: MIXIN_BLACK_2,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    // 모임 이름
                                    Text(
                                      '필름감아',
                                      style: TextStyle(
                                        fontFamily: 'SUIT',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.0.sp,
                                        color: MIXIN_BLACK_2,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 모임 주기
                                        Row(
                                          children: [
                                            Container(
                                              width: 61.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '여기저기',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Container(
                                              width: 84.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '매주 화요일',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // 모임 인원
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color(0xFFCED0D5),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              '6',
                                              style: TextStyle(
                                                fontFamily: 'SUIT',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFCED0D5),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),

                        SizedBox(
                          width: 342.w,
                          height: 314.h,
                          child: Column(
                            children: [
                              // 썸네일
                              Stack(
                                children: [
                                  Container(
                                    height: 192.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.r),
                                        topLeft: Radius.circular(8.r),
                                      ),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.h,
                                    right: 16.3.w,
                                    child: Container(
                                      width: 62.w,
                                      height: 32.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: MIXIN_BLACK_5,
                                      ),
                                      child: Text(
                                        '동아리',
                                        style: TextStyle(
                                          fontFamily: 'SUIT',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: MIXIN_POINT_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.w,
                                    bottom: 8.h,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isBellSelect[2] = !_isBellSelect[2];
                                        });
                                      },
                                      icon: Image.asset(
                                        'assets/images/icons/bell.png',
                                        color: _isBellSelect[2]
                                            ? null
                                            : MIXIN_BLACK_4,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 122.h,
                                padding: EdgeInsets.only(
                                    top: 8.h, left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 0.2,
                                        blurRadius: 3,
                                        offset: const Offset(1, 1),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 모임 카테고리
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/category_images/culture.png',
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          '문화활동',
                                          style: TextStyle(
                                            fontFamily: 'SUIT',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: MIXIN_BLACK_2,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    // 모임 이름
                                    Text(
                                      '필름감아',
                                      style: TextStyle(
                                        fontFamily: 'SUIT',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.0.sp,
                                        color: MIXIN_BLACK_2,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 모임 주기
                                        Row(
                                          children: [
                                            Container(
                                              width: 61.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '여기저기',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Container(
                                              width: 84.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '매주 화요일',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // 모임 인원
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color(0xFFCED0D5),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              '6',
                                              style: TextStyle(
                                                fontFamily: 'SUIT',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFCED0D5),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),

                        SizedBox(
                          width: 342.w,
                          height: 314.h,
                          child: Column(
                            children: [
                              // 썸네일
                              Stack(
                                children: [
                                  Container(
                                    height: 192.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.r),
                                        topLeft: Radius.circular(8.r),
                                      ),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.h,
                                    right: 16.3.w,
                                    child: Container(
                                      width: 62.w,
                                      height: 32.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: MIXIN_BLACK_5,
                                      ),
                                      child: Text(
                                        '동아리',
                                        style: TextStyle(
                                          fontFamily: 'SUIT',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: MIXIN_POINT_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.w,
                                    bottom: 8.h,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isBellSelect[2] = !_isBellSelect[2];
                                        });
                                      },
                                      icon: Image.asset(
                                        'assets/images/icons/bell.png',
                                        color: _isBellSelect[2]
                                            ? null
                                            : MIXIN_BLACK_4,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 122.h,
                                padding: EdgeInsets.only(
                                    top: 8.h, left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 0.2,
                                        blurRadius: 3,
                                        offset: const Offset(1, 1),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 모임 카테고리
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/category_images/culture.png',
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          '문화활동',
                                          style: TextStyle(
                                            fontFamily: 'SUIT',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: MIXIN_BLACK_2,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    // 모임 이름
                                    Text(
                                      '필름감아',
                                      style: TextStyle(
                                        fontFamily: 'SUIT',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.0.sp,
                                        color: MIXIN_BLACK_2,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 모임 주기
                                        Row(
                                          children: [
                                            Container(
                                              width: 61.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '여기저기',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Container(
                                              width: 84.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '매주 화요일',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // 모임 인원
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color(0xFFCED0D5),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              '6',
                                              style: TextStyle(
                                                fontFamily: 'SUIT',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFCED0D5),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),

                        SizedBox(
                          width: 342.w,
                          height: 314.h,
                          child: Column(
                            children: [
                              // 썸네일
                              Stack(
                                children: [
                                  Container(
                                    height: 192.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.r),
                                        topLeft: Radius.circular(8.r),
                                      ),
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.h,
                                    right: 16.3.w,
                                    child: Container(
                                      width: 62.w,
                                      height: 32.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: MIXIN_BLACK_5,
                                      ),
                                      child: Text(
                                        '동아리',
                                        style: TextStyle(
                                          fontFamily: 'SUIT',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: MIXIN_POINT_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.w,
                                    bottom: 8.h,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isBellSelect[2] = !_isBellSelect[2];
                                        });
                                      },
                                      icon: Image.asset(
                                        'assets/images/icons/bell.png',
                                        color: _isBellSelect[2]
                                            ? null
                                            : MIXIN_BLACK_4,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 122.h,
                                padding: EdgeInsets.only(
                                    top: 8.h, left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.r),
                                      bottomRight: Radius.circular(8.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 0.2,
                                        blurRadius: 3,
                                        offset: const Offset(1, 1),
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 모임 카테고리
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/category_images/culture.png',
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          '문화활동',
                                          style: TextStyle(
                                            fontFamily: 'SUIT',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: MIXIN_BLACK_2,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    // 모임 이름
                                    Text(
                                      '필름감아',
                                      style: TextStyle(
                                        fontFamily: 'SUIT',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.0.sp,
                                        color: MIXIN_BLACK_2,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 모임 주기
                                        Row(
                                          children: [
                                            Container(
                                              width: 61.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '여기저기',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Container(
                                              width: 84.w,
                                              height: 32.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: MIXIN_BLACK_5),
                                              child: Text(
                                                '매주 화요일',
                                                style: TextStyle(
                                                  fontFamily: 'SUIT',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color:
                                                      const Color(0xFFB1B1B7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        // 모임 인원
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: Color(0xFFCED0D5),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              '6',
                                              style: TextStyle(
                                                fontFamily: 'SUIT',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFCED0D5),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
