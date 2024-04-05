import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/moim/moim_detail_screens/moim_detail_thunder_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../models/moim_data.dart';
import '../../moim/moim_detail_screens/moim_detail_screen.dart';

class MainMoimScreen extends StatefulWidget {
  const MainMoimScreen({Key? key}) : super(key: key);

  @override
  State<MainMoimScreen> createState() => _MainMoimScreenState();
}

class _MainMoimScreenState extends State<MainMoimScreen>
    with SingleTickerProviderStateMixin {
  String url = 'http://$ip/api/moim?page=0&size=30';

  List<bool> _isHeartSelect = List.filled(5, false);

  List<String> selectedCategory = ['전체보기', 'IT/개발', '디자인', '문화활동', '기타'];
  int selectedButtonIndex = 0;
  Dio dio = Dio();

  bool _isThunderSelect = false;
  int countThunder = 0;
  List<MoimData> moimDataList = [];

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

      for (var moimData in data['data']['moimList']) {
        moimDataList.add(MoimData.fromJson(moimData));
      }



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

  void onTap(int index) {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(76.h),
        child: AppBar(
          backgroundColor: WHITE,
          automaticallyImplyLeading: false,
          toolbarHeight: 110.h,
          elevation: 0.0,
          titleSpacing: 24.w,
          title: Column(
            children: [
              SizedBox(height: 25.h),
              Text(
                '모임',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: B_1,
                ),
              ),
            ],
          ),
          flexibleSpace: SizedBox(
            height: 76.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(top: 6.h),
                        icon: Image.asset(
                          'assets/images/icon_search.png',
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/icons/bell.png',
                          color: Colors.black,
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
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            children: [
              // 카테고리
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedCategory.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = index;
                                });
                              },
                              child: Text(
                                selectedCategory[index],
                                style: TextStyle(
                                  fontWeight: index == selectedButtonIndex
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: index == selectedButtonIndex
                                      ? MIXIN_47
                                      : const Color(0xFFB1B1B7),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(width: 24.w),
                          ],
                        );
                      }),
                ),
              ),
              SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _isThunderSelect ? '총${countThunder}건' :'총 ${moimDataList.length}건',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFFB1B1B7),
                          ),
                        ),
                        Row(
                          children: [
                            // 번개만
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isThunderSelect = !_isThunderSelect;
                                  countThunder = moimDataList.where((moimData) => moimData.moimType == '번개').length;
                                });
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/thunder_moim_icon.png',
                                    width: 15.w,
                                    color:
                                        _isThunderSelect ? null : B_4,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '번개만',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: _isThunderSelect
                                          ? P_1
                                          : B_4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.w),
                            // 정렬
                            // TextButton(
                            //   style: TextButton.styleFrom(
                            //     minimumSize: Size.zero,
                            //     padding: EdgeInsets.zero,
                            //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            //   ),
                            //   onPressed: () {},
                            //   child: Row(
                            //     children: [
                            //       Text(
                            //         '날짜순',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.w500,
                            //           fontSize: 14.sp,
                            //           color: MIXIN_BLACK_3,
                            //         ),
                            //       ),
                            //       SizedBox(width: 5.w),
                            //       Image.asset(
                            //         'assets/images/icons/sort_icon.png',
                            //         width: 15.w,
                            //         color: MIXIN_BLACK_3,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // 정규 모임 카드
                    SizedBox(
                      // height: 3150.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: moimDataList.length,
                          itemBuilder: (context, index) {
                            final moimData = moimDataList[index];


                            if (_isThunderSelect) {
                              return MoimThunder(
                                categoryImage: moimData.categoryUrl,
                                imageAsset: moimData.categoryUrl,
                                categoryName: moimData.categoryName,
                                memberGender: 0,
                                totalMember: moimData.totalMember,
                                currentMember: moimData.currentMember,
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MoimDetailThunderScreen(
                                        id: moimData.moimId,
                                      ),
                                    ),
                                  );
                                },
                                moimName: moimData.moimName,
                                moimDate: moimData.date
                                    .substring(5)
                                    .replaceAll('.', '/'),
                                moimPlace: moimData.moimPlace,
                              );
                            } else if (_isThunderSelect == false) {
                              if (moimData.moimType == '번개') {
                                return MoimThunder(
                                  categoryImage: moimData.categoryUrl,
                                  imageAsset: moimData.categoryUrl,
                                  categoryName: moimData.categoryName,
                                  memberGender: 0,
                                  totalMember: moimData.totalMember,
                                  currentMember: moimData.currentMember,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MoimDetailThunderScreen(
                                          id: moimData.moimId,
                                        ),
                                      ),
                                    );
                                  },
                                  moimName: moimData.moimName,
                                  moimDate: moimData.date
                                      .substring(5)
                                      .replaceAll('.', '/'),
                                  moimPlace: moimData.moimPlace,
                                );
                              } else {
                                return RecruitmentMoimCardBig(
                                  dDay: moimData.dday,
                                  totalMember: moimData.totalMember,
                                  // heartColor: Colors.red,
                                  moimType: moimData.moimType,
                                  backgroundImage: moimData.moimThumbnailUrl,
                                  categoryImage: moimData.categoryUrl,
                                  categoryName: moimData.categoryName,
                                  memberGender: 0,
                                  currentMember: moimData.currentMember,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => MoimDetailScreen(
                                            moimId: moimData.moimId),
                                      ),
                                    );
                                  },
                                  iconOnPressed: () {},
                                  moimName: moimData.moimName,
                                  tag: moimData.moimTags,
                                );
                              }
                            }
                            return null;
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
