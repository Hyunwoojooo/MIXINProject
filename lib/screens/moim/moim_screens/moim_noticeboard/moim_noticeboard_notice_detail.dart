import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/appbar_layout.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';

class MoimNoticeboardNoticeDetail extends StatefulWidget {
  List postInfo;

  MoimNoticeboardNoticeDetail({required this.postInfo, super.key});

  @override
  State<MoimNoticeboardNoticeDetail> createState() =>
      _MoimNoticeboardNoticeDetailState();
}

class _MoimNoticeboardNoticeDetailState
    extends State<MoimNoticeboardNoticeDetail> {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postInfo[4],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: MIXIN_BLACK_1,
                          ),
                        ),
                        Text(
                          widget.postInfo[2],
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postInfo[1],
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: MIXIN_BLACK_1,
                      ),
                    ),
                    SizedBox(height: 27.h),
                    Text(
                      widget.postInfo[3],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10.w),
                    Container(
                      width: 45.w,
                      height: 20.h,
                      padding: EdgeInsets.only(left: 2.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF3D77DB).withOpacity(0.3),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Row(
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.h,
                            padding: EdgeInsets.all(3.h),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3D77DB),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/icons/check_icon.png',
                              fit: BoxFit.contain,
                              height: 8.h,
                              width: 11.w,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            widget.postInfo[0],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0xFF3D77DB)),
                          ),
                        ],
                      ),
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
