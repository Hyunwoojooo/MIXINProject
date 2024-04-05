import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/main_screens/main_bottom_navigation_bar.dart';
import 'package:mixin_mac_2/screens/moim/moim_apply_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/profile_gauge.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/custom_floating_action_button.dart';

/*
  초록색 지우고 선택된 페이지만 검정색
 */
class MoimDetailScreen extends StatefulWidget {
  final int moimId;

  const MoimDetailScreen({required this.moimId, Key? key}) : super(key: key);

  @override
  State<MoimDetailScreen> createState() => _MoimDetailScreenState();
}

class _MoimDetailScreenState extends State<MoimDetailScreen>
    with SingleTickerProviderStateMixin {
  final commentTextController = TextEditingController();
  bool isTextFieldFocused = false;
  bool isis = false;
  bool isBookMark = false;
  Dio dio = Dio();
  String url = 'http://$ip/api/moimInfo?moimId=10';
  final applyUrl = 'http://$ip/api/moim/join';

  int moimId = 0;
  String? moimName = '';
  String? moimType = '';
  List? moimTags = [];
  String? moimThumbnailUrl = '';
  String? categoryName = '';
  String? categoryImage = '';
  List? list;
  String? currentMember = '';
  String? totalMember = '';
  String? moimDescription = '';
  String? moimAdmissionCriteria = '';
  int? moimLeaderUserId = 0;
  String? moimLeaderUserNickName = '';
  String? moimLeaderProfilePictureUrl = '';
  String? dday = '';
  String? genderRestriction = '';
  String? moimFrequency = '';
  String? moimRequirements = '';
  List? moimMemberList = [];

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

      // 이 부분에서 moimMemberList 변수에 데이터 추가
      List<dynamic> moimMemberData =
          data['data']['moimMemberList']['moimMember'];
      for (var moimData in moimMemberData) {
        moimMemberList?.add(moimData);
      }

      moimName = data['data']['moimName'];
      moimType = data['data']['moimType'];
      moimTags = data['data']['moimTags'];
      categoryName = data['data']['categoryName'];
      categoryImage = data['data']['categoryUrl'];
      currentMember = data['data']['currentMember'];
      totalMember = data['data']['totalMember'];
      moimDescription = data['data']['moimDescription'];
      moimTags = data['data']['moimTags'];
      moimThumbnailUrl = data['data']['moimThumbnailUrl'];
      moimLeaderUserId = data['data']['moimLeader']['userId'];
      moimLeaderUserNickName = data['data']['moimLeader']['userNickName'];
      moimLeaderProfilePictureUrl =
          data['data']['moimLeader']['profilePictureUrl'];
      dday = data['data']['dday'];
      genderRestriction = data['data']['genderRestriction'];
      moimAdmissionCriteria = data['data']['moimAdmissionCriteria'];
      moimFrequency = data['data']['moimFrequency'];
      moimRequirements = data['data']['moimRequirements'];
      moimId = data['data']['id'];

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
    moimId = widget.moimId;
    print(moimId);
    url = 'http://$ip/api/moimInfo?moimId=$moimId';
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 밑 여백 죽이기
      // appBar: AppBar(
      //   toolbarHeight: 75.w,
      //   leadingWidth: 71.w,
      //   backgroundColor: WHITE,
      //   elevation: 0.0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
      //     child: IconButton(
      //       padding: EdgeInsets.zero,
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Image.asset(
      //         'assets/images/icons/back_icon_black_3x.png',
      //         height: 26.h,
      //         width: 26.w,
      //       ),
      //     ),
      //   ),
      //   title: Padding(
      //     padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
      //     child: const Text('모임상세'),
      //   ),
      //   centerTitle: true,
      //   titleTextStyle: TextStyle(
      //     fontSize: 20.sp,
      //     fontWeight: FontWeight.w600,
      //     color: MIXIN_BLACK_1,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(top: 30.h, right: 13.w, bottom: 15.h),
      //       child: IconButton(
      //         padding: EdgeInsets.zero,
      //         onPressed: () {
      //           showModalBottomSheet(
      //             backgroundColor: Colors.transparent,
      //             context: context,
      //             builder: (BuildContext context) {
      //               return Container(
      //                 height: 254.h,
      //                 width: double.infinity,
      //                 padding: EdgeInsets.only(top: 36.h),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.only(
      //                     topLeft: Radius.circular(24.r),
      //                     topRight: Radius.circular(24.r),
      //                   ),
      //                   color: Colors.white,
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     TextButton(
      //                       onPressed: () {},
      //                       child: Text(
      //                         '1:1로 문의하기',
      //                         style: TextStyle(
      //                           fontSize: 20.sp,
      //                           fontWeight: FontWeight.w600,
      //                           color: MIXIN_BLACK_1,
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(height: 16.h),
      //                     TextButton(
      //                       onPressed: () {},
      //                       child: Text(
      //                         '신고하기',
      //                         style: TextStyle(
      //                           fontSize: 20.sp,
      //                           fontWeight: FontWeight.w600,
      //                           color: MIXIN_BLACK_1,
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(height: 16.h),
      //                     TextButton(
      //                       onPressed: () {},
      //                       child: Text(
      //                         'URL 공유하기',
      //                         style: TextStyle(
      //                             fontSize: 20.sp,
      //                             fontWeight: FontWeight.w600,
      //                             color: MIXIN_BLACK_1),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             },
      //           );
      //         },
      //         icon: Image.asset(
      //           'assets/images/more_vert.png',
      //           width: 26.w,
      //           height: 26.h,
      //           color: MIXIN_BLACK_1,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
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
              onTap: () async {
                if (moimRequirements.toString() == '승인 후 가입') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MoimApplyScreen(
                              moimId: moimId,
                            )),
                  );
                } else {
                  String? refreshToken =
                      await storage.read(key: REFRESH_TOKEN_KEY);

                  final Response resp = await dio.post(applyUrl,
                      options: Options(
                        headers: {
                          "Authorization": jsonDecode(refreshToken!)[0],
                        },
                      ),
                      data: {
                        'moimId': moimId,
                      });
                  print(resp);
                  _showDialog(context, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => MainBottomNavigationBar()),
                    );
                  });
                }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 390.h,
                    child: Image.network(
                      '$imageUrl$moimThumbnailUrl',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 59.h,
                    left: 16.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 6.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: P_3,
                      ),
                      child: Text(
                        moimType!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: P_1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 59.h,
                    right: 16.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.w, vertical: 6.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: B_5,
                      ),
                      child: Text(
                        'D-$dday',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: P_1,
                        ),
                      ),
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
                          Image.network(
                            '$imageUrl$categoryImage',
                            height: 26.h,
                            width: 26.w,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            categoryName!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: B_2,
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
                          moimName!,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: B_1,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: B_4,
                              size: 18.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '$currentMember/$totalMember',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0.sp,
                                color: B_4,
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
                                color: B_5,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                  )
                                ],
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  '$imageUrl$moimLeaderProfilePictureUrl',
                                  fit: BoxFit.fill,
                                  height: 31.h,
                                  width: 31.w,
                                ),
                              ),
                            ),
                            const MiniProfileGauge(),
                          ],
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          moimLeaderUserNickName!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: B_1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 28.h),
                    customRow('모임주기', moimFrequency!),
                    SizedBox(height: 20.h),
                    customRow('가입성별', genderRestriction!),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '승인여부',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB1B1B7),
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: P_3,
                          ),
                          child: Text(
                            moimRequirements!,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: P_1,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '가입조건',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB1B1B7),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          moimAdmissionCriteria!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: B_1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F1F5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Text(
                        moimDescription!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: B_1,
                        ),
                      ),
                    ),
                    SizedBox(height: 23.h),
                    Text(
                      '관련 태그',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(
                      height: 32.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: moimTags?.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: P_3,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 5.w),
                                  // margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                                  child: Text(
                                    '#${moimTags?[index]}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: P_1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                              ],
                            );
                          }),
                    ),
                    SizedBox(height: 48.h),
                    Text(
                      '구성원',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),

              // ------------------------------------------------------
              // 해야됨
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: SizedBox(
                  height: 107.h,
                  child: ListView.builder(
                    itemCount: moimMemberList?.length,
                    itemExtent: 84.w,
                    itemBuilder: (context, index) {
                      return memberList(
                          moimMemberList?[index]['userNickName'],
                          moimMemberList?[index]['profilePictureUrl']);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(height: 53.h),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget memberList(String name, String profileImage) {
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
                color: B_5,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  '$imageUrl$profileImage',
                  height: 68.h,
                  width: 68.w,
                  fit: BoxFit.fitWidth,
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
            fontWeight: FontWeight.w600,
            color: B_1,
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
            fontWeight: FontWeight.w500,
            color: const Color(0xFFB1B1B7),
          ),
        ),
        SizedBox(width: 40.w),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFf414346),
          ),
        )
      ],
    );
  }

  void _showDialog(BuildContext context, void Function() onPressed) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text('가입이 완료되었습니다.'),
            actions: [
              ElevatedButton(onPressed: onPressed, child: Text('예')),
            ],
          );
        });
  }
}
