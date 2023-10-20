import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../components/profile_gauge.dart';
import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/category_layout_chip.dart';
import '../../layout/custom_floating_action_button.dart';
import '../main_screens/main_bottom_navigation_bar.dart';
import 'back_profile_card_screen.dart';
import 'front_profile_card_screen.dart';

class CompleteProfileCardScreen extends StatefulWidget {
  const CompleteProfileCardScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileCardScreen> createState() =>
      _CompleteProfileCardScreenState();
}

class _CompleteProfileCardScreenState extends State<CompleteProfileCardScreen> {
  final storage = const FlutterSecureStorage();
  String? userNickName = '';
  String? userIntroduceText = '';
  String? userDepartment = '';
  String? userName = '';
  bool visible = false;
  int _currentPage = 0;
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        text: '어플 이용하러 가기',
        fillColor: MIXIN_POINT_COLOR,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const MainBottomNavigationBar()),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarTextLayout(text: '프로필'),
              SizedBox(height: 13.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        '50',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: MIXIN_POINT_COLOR,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 65.w,
                            height: 65.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MIXIN_BLACK_5,
                              boxShadow: [
                                BoxShadow(
                                  color: MIXIN_BLACK_4,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/default_profile_image.png',
                                fit: BoxFit.contain,
                                height: 40.h,
                                width: 40.w,
                              ),
                            ),
                          ),
                          ProfileCardGauge(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 23.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // userNickName!.isEmpty
                        //     ? userName!
                        //     : userNickName!,
                        '먼지이이잉',
                        style: TextStyle(
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0.sp,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                      SizedBox(height: 5.0.h),
                      Text(
                        // userDepartment!,
                        '선민혁 / 동양미래대학교',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: MIXIN_POINT_COLOR,
                        ),
                      ),
                      SizedBox(height: 5.0.h),
                      Text(
                        // userDepartment!,
                        '자동화공학과 / 23',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: MIXIN_POINT_COLOR,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 28.h),
              Text(
                '자기소개',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: MIXIN_BLACK_2,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                '안녕하세 제 이름은 선민혁입니다.안녕하세 제 이름은 선민혁입니다.안녕하세 제 이름은 선민혁입니다.안녕하세 제 이름은 선민혁입니다.안녕하세 제 이름은 선민혁입니다.안녕하세 제 이름은 선민혁입니다.',
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                maxLines: 4,
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  CategoryLayoutChip(),
                  SizedBox(width: 8.w),
                  CategoryLayoutChip(),
                  SizedBox(width: 8.w),
                  CategoryLayoutChip(),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '참여유형',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 0 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                  SizedBox(width: 54.w),
                  Text(
                    '성격/특성',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 1 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                  SizedBox(width: 54.w),
                  Text(
                    '가치관',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 2 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: 102.h,
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.zero,
              //   child: PageView(
              //     controller: pageController,
              //     onPageChanged: (value) {
              //       setState(() {
              //         _currentPage = value;
              //         print('value: $_currentPage');
              //       });
              //     },
              //     children: [
              //       Container(
              //         width: 200.w,
              //         height: 151.h,
              //         color: Colors.white,
              //         alignment: Alignment.center,
              //         child: Container(
              //           margin: EdgeInsets.only(bottom: 57.w),
              //           width: 200.w,
              //           height: 151.h,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: const Color(0xFFDAF3F0),
              //             boxShadow: const [
              //               BoxShadow(
              //                 color: MIXIN_POINT_COLOR,
              //                 blurRadius: 2.0,
              //                 offset: Offset(2, 4),
              //               )
              //             ],
              //             borderRadius: BorderRadius.circular(36.r),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 // userPosition!.isEmpty ? '-' : userPositionReal!,
              //                 'asdf',
              //                 style: TextStyle(
              //                   fontFamily: 'SUIT',
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 20.0.sp,
              //                   color: MIXIN_POINT_COLOR,
              //                 ),
              //               ),
              //               SizedBox(height: 18.0.h),
              //               Text(
              //                 // userPosition!.isEmpty ? '-' : matchingPositionText(userPositionReal!),
              //                 textAlign: TextAlign.center,
              //                 'asdf',
              //                 style: TextStyle(
              //                   fontFamily: 'SUIT',
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 14.0.sp,
              //                   color: MIXIN_POINT_COLOR,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.fromLTRB(10.w, 68.h, 0.w, 0),
              //         height: 108.h,
              //         width: 248.w,
              //         child: Column(
              //           children: [
              //             Row(
              //               children: [
              //                 Text(
              //                   '나는',
              //                   style: TextStyle(
              //                     fontFamily: 'SUIT',
              //                     fontWeight: FontWeight.w600,
              //                     fontSize: 16.0.sp,
              //                   ),
              //                 ),
              //                 SizedBox(width: 14.w),
              //                 Container(
              //                   width: 154.w,
              //                   height: 48.h,
              //                   decoration: BoxDecoration(
              //                     color: MIXIN_2,
              //                     borderRadius: BorderRadius.circular(30.0.r),
              //                   ),
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     // userPersonalityList.isEmpty ? '-' : userPersonalityList[0],
              //                     'asdf',
              //                     style: TextStyle(
              //                       fontFamily: 'SUIT',
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 16.0.sp,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(height: 12.h),
              //             Row(
              //               children: [
              //                 SizedBox(width: 10.w),
              //                 Container(
              //                   width: 110.w,
              //                   height: 48.h,
              //                   decoration: BoxDecoration(
              //                     color: MIXIN_2,
              //                     borderRadius: BorderRadius.circular(30.0.r),
              //                   ),
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     // userPersonalityList.isEmpty ? '-' : userPersonalityList[1],
              //                     'asdf',
              //                     style: TextStyle(
              //                       fontFamily: 'SUIT',
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 16.0.sp,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(width: 10.w),
              //                 Container(
              //                   width: 100.w,
              //                   height: 48.h,
              //                   decoration: BoxDecoration(
              //                     color: MIXIN_2,
              //                     borderRadius: BorderRadius.circular(30.0.r),
              //                   ),
              //                   alignment: Alignment.center,
              //                   child: Text(
              //                     // userPersonalityList.isEmpty ? '-' : userPersonalityList[2],
              //                     'asdf',
              //                     style: TextStyle(
              //                       fontFamily: 'SUIT',
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 16.0.sp,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(width: 10.w),
              //                 Text(
              //                   '사람',
              //                   style: TextStyle(
              //                     fontFamily: 'SUIT',
              //                     fontWeight: FontWeight.w600,
              //                     fontSize: 16.0.sp,
              //                   ),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: 200.w,
              //         height: 151.h,
              //         color: Colors.white,
              //         alignment: Alignment.center,
              //         child: Container(
              //           margin: EdgeInsets.only(bottom: 57.h),
              //           width: 200.w,
              //           height: 151.h,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: const Color(0xFFDAF3F0),
              //             boxShadow: const [
              //               BoxShadow(
              //                 color: MIXIN_POINT_COLOR,
              //                 blurRadius: 2.0,
              //                 offset: Offset(2, 4),
              //               )
              //             ],
              //             borderRadius: BorderRadius.circular(36.r),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 // userValues!.isEmpty ? '-' : userValueReal!,
              //                 'asdfa',
              //                 style: TextStyle(
              //                   fontFamily: 'SUIT',
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 20.0.sp,
              //                   color: MIXIN_POINT_COLOR,
              //                 ),
              //               ),
              //               SizedBox(height: 18.0.h),
              //               Text(
              //                 // userValues!.isEmpty
              //                 //     ? "-"
              //                 //     : matchingValueText(userValues![0]),
              //                 'asdf',
              //                 style: TextStyle(
              //                   fontFamily: 'SUIT',
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 14.0.sp,
              //                   color: MIXIN_POINT_COLOR,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 102.h),
              Text(
                '참여내역',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: MIXIN_BLACK_1,
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Text(
                  '다양한 모임에 참여해보세요',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: MIXIN_BLACK_4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
