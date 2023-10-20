import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/appbar_layout.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';

class MoimNoticeboardPostDetail extends StatefulWidget {
  List postInfo;

  MoimNoticeboardPostDetail({required this.postInfo, super.key});

  @override
  State<MoimNoticeboardPostDetail> createState() =>
      _MoimNoticeboardPostDetailState();
}

class _MoimNoticeboardPostDetailState extends State<MoimNoticeboardPostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: GestureDetector(
                        onTap: () {
                          print('나의 이웃 설정');
                        },
                        child: Image.asset(
                          'assets/images/more_vert.png',
                          width: 26.w,
                          height: 26.h,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Row(
                  children: [
                    ProfileImage48(),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postInfo[0],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: MIXIN_BLACK_1,
                          ),
                        ),
                        Text(
                          widget.postInfo[1],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            color: MIXIN_BLACK_4,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24.w), child: Text(
                widget.postInfo[2],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: MIXIN_BLACK_2,
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
