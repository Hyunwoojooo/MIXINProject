import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../const/colors.dart';

class BackProfileCardScreen extends StatefulWidget {
  const BackProfileCardScreen({Key? key}) : super(key: key);

  @override
  State<BackProfileCardScreen> createState() => _BackProfileCardScreenState();
}

class _BackProfileCardScreenState extends State<BackProfileCardScreen> {
  final storage = const FlutterSecureStorage();
  final PageController pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;
  bool visible = false;
  String? userNickName = '';
  String? userName = '';


  late String? userPosition = '';
  late String? userPersonality = '';
  late String? userValues = '';
  String? userValueReal;
  String? userPositionReal;
  List<String> userPersonalityList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<bool> toBoolList(String string) {
    return json.decode(string).cast<bool>();
  }
  
  String matchingValueText(String userValue){
    if(userValue == '소통'){
      return '소통이 원활하게\n이루어지는 게 중요하지!';
    } else if(userValue == '열정'){
      return '모든 일의 시작은\n열정이 아니겠어?';
    }
    return '약속이 기본 매너 아니겠어?';
  }

  String matchingPositionText(String userValue){
    if(userValue == '리더형'){
      return '나 빼고 결정하는건\n못 참지';
    } else if(userValue == '분위기메이커형'){
      return '이 모임의 분위기는\n내가 책임진다!';
    } else if(userValue == '다좋아형'){
      return '좋아좋아\n뭐든지 다 좋아~';
    }
    return '당황하지 않아요\n침착하게..';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        width: 342.w,
        height: 425.h,
        padding: EdgeInsets.fromLTRB(32.w, 29.h, 32.w, 32.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0.r),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey,
                  ),
                ),
                SizedBox(width: 14.0.w),
                Text(
                  userNickName!.isEmpty ? userName! : userNickName!,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    print(pageController.page);
                    print(userPosition);
                    print(userPosition.runtimeType);
                  },
                  child: Text(
                    '참여유형',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 0 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print(userPersonalityList);
                    print(userPersonalityList[0]);
                    print(userPersonalityList.runtimeType);
                    print(userPersonality.runtimeType);
                    print(userPersonality);
                  },
                  child: Text(
                    '성격/특성',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 1 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print(userValues);
                  },
                  child: Text(
                    '가치관',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0.sp,
                      color: _currentPage == 2 ? MIXIN_47 : MIXIN_BLACK_4,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 300.h,
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                    print('value: $_currentPage');
                  });
                },
                children: [
                  Container(
                    width: 200.w,
                    height: 151.h,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 57.w),
                      width: 200.w,
                      height: 151.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDAF3F0),
                        boxShadow: const [
                          BoxShadow(
                            color: MIXIN_POINT_COLOR,
                            blurRadius: 2.0,
                            offset: Offset(2, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userPosition!.isEmpty ? '-' : userPositionReal!,
                            style: TextStyle(
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0.sp,
                              color: MIXIN_POINT_COLOR,
                            ),
                          ),
                          SizedBox(height: 18.0.h),
                          Text(
                            userPosition!.isEmpty ? '-' : matchingPositionText(userPositionReal!),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0.sp,
                              color: MIXIN_POINT_COLOR,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.w, 68.h, 0.w, 0),
                    height: 108.h,
                    width: 248.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '나는',
                              style: TextStyle(
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0.sp,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Container(
                              width: 154.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: MIXIN_2,
                                borderRadius: BorderRadius.circular(30.0.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                userPersonalityList.isEmpty ? '-' : userPersonalityList[0],
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            Container(
                              width: 110.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: MIXIN_2,
                                borderRadius: BorderRadius.circular(30.0.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                userPersonalityList.isEmpty ? '-' : userPersonalityList[1],
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 100.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: MIXIN_2,
                                borderRadius: BorderRadius.circular(30.0.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                userPersonalityList.isEmpty ? '-' : userPersonalityList[2],
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '사람',
                              style: TextStyle(
                                fontFamily: 'SUIT',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 200.w,
                    height: 151.h,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 57.h),
                      width: 200.w,
                      height: 151.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDAF3F0),
                        boxShadow: const [
                          BoxShadow(
                            color: MIXIN_POINT_COLOR,
                            blurRadius: 2.0,
                            offset: Offset(2, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userValues!.isEmpty ? '-' : userValueReal!,
                            style: TextStyle(
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0.sp,
                              color: MIXIN_POINT_COLOR,
                            ),
                          ),
                          SizedBox(height: 18.0.h),
                          Text(
                            userValues!.isEmpty ? "-" : matchingValueText(userValues![0]),
                            style: TextStyle(
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0.sp,
                              color: MIXIN_POINT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
        Visibility(
          visible: visible == true ? false : true,
          child: Container(
            width: 342.w,
            height: 425.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: TextButton(
              onPressed: () async {
                visible = true;
                userNickName = await storage.read(key: 'userNickName');
                userName = await storage.read(key: 'userName');
                userPosition = await storage.read(key: 'userPosition');
                userPersonality = await storage.read(key: 'userPersonality');
                userValues = await storage.read(key: 'userValues');

                setState(() {
                  userPersonalityList = userPersonality!
                      .substring(1, userPersonality!.length - 1) // 대괄호 제거
                  .replaceAll("\"", '')
                      .split(','); // 쉼표로 분리하여 List<String> 생성

                  userPersonalityList = userPersonalityList.map((element) => element.trim()).toList();
                  userPersonalityList.sort((a, b) => b.length.compareTo(a.length));
                  userPositionReal = userPosition?.substring(2, userPosition!.length -2);

                  userValueReal = userValues?.substring(2, userValues!.length -2);
                });
                print(userNickName);
                print(userPosition);
                print(userName);
                print(userPersonality);
                print(userValues);
              },
              child: Text(
                '슬라이드로\n확인해보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w600,
                  color: WHITE,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}
