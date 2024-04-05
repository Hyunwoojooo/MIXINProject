import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/models/moim_activity_detail_model.dart';
import 'package:mixin_mac_2/screens/moim/moim_detail_screens/moim_detail_screen.dart';

import '../const/data.dart';
import '../models/moim_activity_model.dart';
import '../screens/moim/moim_screens/moim_active_detail_screen.dart';

class MoimActive extends StatefulWidget {
  final String activityName;
  final String activitySpot;
  final String activityDate;
  final String dday;
  final int activityJoinedMember;
  final bool userJoined;
  final int activityId;

  MoimActive(
      {required this.activityName,
      required this.activitySpot,
      required this.activityDate,
      required this.dday,
      required this.activityJoinedMember,
      required this.userJoined,
      required this.activityId,
      super.key});

  @override
  State<MoimActive> createState() => _MoimActiveState();
}

class _MoimActiveState extends State<MoimActive> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 24.h, left: 21.w, right: 18.w),
          height: 140.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: WHITE,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: B_4, offset: Offset(3, 3))
              ]),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        MoimActiveDetailScreen(activityId: widget.activityId)),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.activityName,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/calendar_icon.png',
                          height: 16.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          widget.activityDate,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: B_3,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Image.asset(
                          'assets/images/icons/map_point.png',
                          height: 13.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          widget.activitySpot,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: B_3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                widget.userJoined ? P_3 : B_5,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () async {
                            if (widget.userJoined == false) {
                              String? refreshToken =
                                  await storage.read(key: REFRESH_TOKEN_KEY);
                              String url = 'http://$ip/api/moim/activity/join';

                              // dio 사용
                              try {
                                Options options = Options(
                                  headers: {
                                    "Authorization":
                                        jsonDecode(refreshToken!)[0],
                                  },
                                  method: 'POST',
                                );

                                final Response resp = await dio
                                    .post(url, options: options, data: {
                                  'activityId': widget.activityId,
                                });
                                print(resp);
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
                            } else if (widget.userJoined) {
                              String? refreshToken =
                                  await storage.read(key: REFRESH_TOKEN_KEY);
                              String url =
                                  'http://$ip/api/moim/activity/cancel/${widget.activityId}';

                              // dio 사용
                              try {
                                Options options = Options(
                                  headers: {
                                    "Authorization":
                                        jsonDecode(refreshToken!)[0],
                                  },
                                  method: 'DELETE',
                                );

                                final Response resp = await dio.delete(
                                  url,
                                  options: options,
                                );
                                print(resp);
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
                            }
                            setState(() {
                            });
                          },
                          child: Text(
                            widget.userJoined ? '참여중' : '참여하기',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: widget.userJoined
                                  ? P_1
                                  : B_3,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '${widget.activityJoinedMember}명 참여중',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: P_1,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: P_3,
                  radius: 24.r,
                  child: Text(
                    (widget.dday.toString() == '완료') ? '완료' : 'D-${widget.dday}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: P_1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
