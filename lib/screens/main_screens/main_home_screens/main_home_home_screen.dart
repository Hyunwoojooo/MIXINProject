import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/nopadding_textbutton.dart';
import 'package:mixin_mac_2/models/moim_data.dart';
import 'package:mixin_mac_2/screens/main_screens/main_moim_screens/main_moim_screen.dart';
import 'package:mixin_mac_2/screens/moim/moim_detail_screens/moim_detail_thunder_screen.dart';
import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../moim/moim_detail_screens/moim_detail_screen.dart';

class MainHomeHomeScreen extends StatefulWidget {
  const MainHomeHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeHomeScreen> createState() => _MainHomeHomeScreenState();
}

class _MainHomeHomeScreenState extends State<MainHomeHomeScreen> {
  final List<bool> _selectScript = List.filled(3, false);

  final String url = 'http://$ip/api/moim?page=0&size=12';
  List<String> selectedOptions = [];

  Dio dio = Dio();

  List<MoimData> moimDataList = [];
  List<MoimData> thunderDataList = [];

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
      print('6--------------------------------------------------');

      final Response resp = await dio.get(
        url,
        options: options,
      );
      print(resp);

      print('4--------------------------------------------------');

      Map<String, dynamic> data = await resp.data;

      print('data = $data');
      print('3--------------------------------------------------');

      print('2--------------------------------------------------');

      for (var moimData in data['data']['moimList']) {
        print(moimData);
        if (moimData['moimType'] != '번개') {
          print(moimData['moimType'] != '번개');
          moimDataList.add(MoimData.fromJson(moimData));
        } else {
          thunderDataList.add(MoimData.fromJson(moimData));
        }
      }
      print('1--------------------------------------------------');

      setState(() {});
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
    print('111111111111111');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              top: 20.h,
              right: 24.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/mixin_logo_color.png',width: 89.w, height: 24.h,),

                Row(
                  children: [
                    Image.asset('assets/images/icons/search_icon.png', width: 20.68, height: 20.68,),
                    SizedBox(width: 24.w),
                    Image.asset('assets/images/black_bell_3x.png', width: 21.8, height: 21.8,),
                  ],
                )
              ],
            )
          ),
          SizedBox(height: 24.h),
          //배너
          Container(
            height: 104.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF495FE7),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 24.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '우리들의 놀이터 믹스인',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '더 재밌게 하는 방법은?',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '최근 올라온 밋!',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: B_1,
                      ),
                    ),
                    NoPaddingTextButton(
                        child: Text(
                          '더보기>',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: P_1,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MainMoimScreen()),
                          );
                        }),
                  ],
                ),
                SizedBox(height: 16.h),
                // SizedBox(
                //   // color: Colors.red,
                //   height: 291.h,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       // physics: const NeverScrollableScrollPhysics(),
                //       itemCount: moimDataList.length,
                //       itemBuilder: (context, index) {
                //         final moimData = moimDataList[index];
                //         return Row(
                //           children: [
                //             MoimCardSmall(
                //               dDay: moimData.dday,
                //               totalMember: moimData.totalMember,
                //               moimType: moimData.moimType,
                //               backgroundImage: moimData.moimThumbnailUrl,
                //               categoryImage: moimData.categoryUrl,
                //               categoryName: moimData.categoryName,
                //               memberGender: 0,
                //               currentMember: moimData.currentMember,
                //               onPressed: () {
                //                 print(moimData.moimId);
                //                 Navigator.of(context).push(
                //                   MaterialPageRoute(
                //                     builder: (context) => MoimDetailScreen(
                //                       moimId: moimData.moimId,
                //                     ),
                //                   ),
                //                 );
                //               },
                //               iconOnPressed: () {},
                //               moimName: moimData.moimName,
                //               tag: moimData.moimTags,
                //             ),
                //             SizedBox(width: 12.w),
                //           ],
                //         );
                //       }),
                // ),
              ],
            ),
          ),
          Container(
            height: 239.h,
            padding: EdgeInsets.only(left: 16.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index){
                return NewMoimCardFormat();
              },
            ),
          ),
          Center(child: NewMoimCardFormat()),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '오늘 진행되는 번개',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: B_1),
                    ),
                    // NoPaddingTextButton(
                    //     child: Text(
                    //       '더보기>',
                    //       style: TextStyle(
                    //         fontSize: 12.sp,
                    //         fontWeight: FontWeight.w600,
                    //         color: MIXIN_POINT_COLOR,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //             builder: (context) => MainMoimScreen()),
                    //       );
                    //     }),
                  ],
                ),
                SizedBox(height: 16.h),
                // SizedBox(
                //   height: 161.h,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       // physics: const NeverScrollableScrollPhysics(),
                //       itemCount: thunderDataList.length,
                //       itemBuilder: (context, index) {
                //         final moimData = thunderDataList[index];
                //         final moimDate =
                //             moimData.date.substring(5).replaceAll('.', '/');
                //         return Row(
                //           children: [
                //             MoimThunder(
                //               imageAsset: moimData.categoryUrl,
                //               moimDate: moimDate,
                //               moimPlace: moimData.moimPlace,
                //               totalMember: moimData.totalMember,
                //               categoryImage: moimData.categoryUrl,
                //               categoryName: moimData.categoryName,
                //               memberGender: 0,
                //               currentMember: moimData.currentMember,
                //               onPressed: () {
                //                 print(moimData.moimId);
                //                 Navigator.of(context).push(
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         MoimDetailThunderScreen(
                //                       id: moimData.moimId,
                //                     ),
                //                   ),
                //                 );
                //               },
                //               moimName: moimData.moimName,
                //             ),
                //             SizedBox(width: 12.w),
                //           ],
                //         );
                //       }),
                // ),
              ],
            ),
          ),
          // 활동 추천
          Padding(
            padding:
                EdgeInsets.only(left: 24.w, top: 24.h, right: 0, bottom: 32.h),
            child: Column(
              children: [
                // 타이틀
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이 활동(추천)은 어떠세요?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.0.w),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          '전체보기>',
                          style: TextStyle(
                            color: P_1,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                // 콘텐츠
                Column(
                  children: [
                    // 콘텐츠 1
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: B_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '안양시청',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: P_1),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '안양시 캐릭터 콘테스트',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: B_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: B_5,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: B_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[0] ? P_3 : B_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(
                                width: 2.w,
                                color:
                                    _selectScript[0] ? P_3 : B_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[0] = !_selectScript[0];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[0]
                                ? P_1
                                : B_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // 콘텐츠 2
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: B_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '미분당',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: P_1),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '미분당 로고 리뉴얼',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: B_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: B_5,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: B_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[1] ? Colors.white : B_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(width: 2.w, color: B_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[1] = !_selectScript[1];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[1]
                                ? P_1
                                : B_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // 콘텐츠 3
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: B_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '이마트24',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: P_1),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '신메뉴 네이밍 콘테스트',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: B_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: B_5,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: B_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[2] ? Colors.white : B_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(width: 2.w, color: B_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[2] = !_selectScript[2];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[2]
                                ? P_1
                                : B_4,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 8,
            color: B_5,
          ),
        ],
      ),
    );
  }
}
