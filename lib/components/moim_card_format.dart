import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/profile_image.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/const/data.dart';
import 'package:mixin_mac_2/layout/tag_layout.dart';

class RecruitmentMoimCardBig extends StatelessWidget {
  String moimType;
  String dDay;
  String backgroundImage;
  String categoryImage;
  String categoryName;
  int memberGender;
  String totalMember;
  String currentMember;
  void Function() onPressed;
  void Function() iconOnPressed;

  // Color? heartColor;
  String moimName;
  List tag;

  RecruitmentMoimCardBig(
      {required this.dDay,
      required this.totalMember,
      // required this.heartColor,
      required this.moimType,
      required this.backgroundImage,
      required this.categoryImage,
      required this.categoryName,
      required this.memberGender,
      required this.currentMember,
      required this.onPressed,
      required this.iconOnPressed,
      required this.moimName,
      required this.tag,
      Key? key})
      : super(key: key);

  Color genderColor(int memberGender) {
    if (memberGender == 1) {
      return const Color(0xFF495FE7);
    } else if (memberGender == 2) {
      return const Color(0xFFE55E74);
    }
    return B_4;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: 342.w,
      height: 321.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 192.h,
                  width: 342.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: Image.network(
                      '$imageUrl$backgroundImage',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  left: 188.w,
                  child: Container(
                    width: 72.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: P_3,
                    ),
                    child: Text(
                      moimType,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  right: 12.w,
                  child: Container(
                    width: 62.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: B_5,
                    ),
                    child: Text(
                      'D-$dDay',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   right: 16.w,
                //   bottom: 12.h,
                //   child: IconButton(
                //     onPressed: () {
                //       iconOnPressed;
                //     },
                //     icon: Image.asset(
                //       'assets/images/icons/heart_pink_icon.png',
                //       width: 26.w,
                //       color: heartColor,
                //     ),
                //   ),
                // ),
              ],
            ),
            Container(
              height: 129.h,
              padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '$imageUrl$categoryImage',
                            width: 26.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: B_2,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: genderColor(memberGender),
                            size: 18.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '$currentMember/$totalMember',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: B_4,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 288.w,
                    child: Text(
                      moimName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: B_1,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tag.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: P_3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            margin: EdgeInsets.only(right: 8.w),
                            child: Text(
                              '#${tag[index]}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: P_1,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyMoimCard extends StatelessWidget {
  String moimType;
  String backgroundImage;
  String categoryImage;
  String categoryName;
  int memberGender;
  String currentMember;
  String totalMember;
  void Function() iconOnPressed;
  void Function() onPressed;
  Color? bellColor;
  String moimName;
  List tag;
  final String imageUrl = 'http://$ip/upload';

  MyMoimCard(
      {required this.bellColor,
      required this.moimType,
      required this.backgroundImage,
      required this.categoryImage,
      required this.categoryName,
      required this.memberGender,
      required this.currentMember,
      required this.totalMember,
      required this.iconOnPressed,
      required this.onPressed,
      required this.moimName,
      required this.tag,
      Key? key})
      : super(key: key);

  Color genderColor(int memberGender) {
    if (memberGender == 1) {
      return const Color(0xFF495FE7);
    } else if (memberGender == 2) {
      return const Color(0xFFE55E74);
    }
    return B_4;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342.w,
      height: 321.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 192.h,
                  width: 342.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: Image.network(
                      '$imageUrl$backgroundImage',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16.h,
                  left: 258.w,
                  child: Container(
                    width: 72.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: P_3,
                    ),
                    child: Text(
                      moimType,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8.w,
                  bottom: 8.h,
                  child: IconButton(
                    onPressed: () {
                      iconOnPressed;
                    },
                    icon: Image.asset(
                      'assets/images/icons/bell.png',
                      width: 26.w,
                      height: 26.h,
                      color: bellColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 129.h,
              padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '$imageUrl$categoryImage',
                            width: 26.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: B_2,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: genderColor(memberGender),
                            size: 18.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '$currentMember/$totalMember',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: B_4,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 288.w,
                    child: Text(
                      moimName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: B_1,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tag.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: P_3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            margin: EdgeInsets.only(right: 8.w),
                            child: Text(
                              '#${tag[index]}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: P_1,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MoimCardSmall extends StatelessWidget {
  String moimType;
  String dDay;
  String backgroundImage;
  String categoryImage;
  String categoryName;
  int memberGender;
  String totalMember;
  String currentMember;
  void Function() onPressed;
  void Function() iconOnPressed;

  // Color heartColor;
  String moimName;
  List tag;

  MoimCardSmall(
      {required this.moimType,
      required this.dDay,
      required this.backgroundImage,
      required this.categoryImage,
      required this.categoryName,
      required this.memberGender,
      required this.totalMember,
      required this.currentMember,
      required this.onPressed,
      required this.iconOnPressed,
      // required this.heartColor,
      required this.moimName,
      required this.tag,
      Key? key})
      : super(key: key);

  Color genderColor(int memberGender) {
    if (memberGender == 1) {
      return const Color(0xFF495FE7);
    } else if (memberGender == 2) {
      return const Color(0xFFE55E74);
    }
    return B_4;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: 283.w,
        height: 267.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 158.h,
                  width: 283.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: Image.network(
                      '$imageUrl$backgroundImage',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                // moimType
                Positioned(
                  top: 12.h,
                  left: 129.w,
                  child: Container(
                    width: 72.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: P_3,
                    ),
                    child: Text(
                      moimType,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                // D-Day
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    width: 62.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: B_5,
                    ),
                    child: Text(
                      'D-$dDay',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   right: 16.w,
                //   bottom: 8.h,
                //   child: IconButton(
                //     onPressed: () {
                //       iconOnPressed;
                //     },
                //     icon: Image.asset(
                //       'assets/images/icons/heart_pink_icon.png',
                //       width: 26.w,
                //       color: heartColor,
                //     ),
                //   ),
                // ),
              ],
            ),
            Container(
              height: 109.h,
              padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(1, 1),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            '$imageUrl$categoryImage',
                            width: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: B_2,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: genderColor(memberGender),
                            size: 18.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '$currentMember/$totalMember',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0.sp,
                              color: B_4,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    moimName,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: B_1,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tag.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: P_3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            margin: EdgeInsets.only(right: 8.w),
                            child: Text(
                              '#${tag[index]}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: P_1,
                              ),
                            ),
                          );
                        }),
                  ),
                  // SizedBox(height: 6.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMyMoim extends StatelessWidget {
  final int moimId;
  final String moimName;
  final List<String> moimTags;
  final String moimThumbnailUrl;
  final String currentMember;
  final String totalMember;
  final String userRole;
  void Function() onPressed;

  ProfileMyMoim({
    super.key,
    required this.moimId,
    required this.moimName,
    required this.moimTags,
    required this.moimThumbnailUrl,
    required this.currentMember,
    required this.totalMember,
    required this.userRole,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 372.w,
        height: 106.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: P_3,
        ),
        padding: EdgeInsets.only(right: 15.w, left: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90.w,
              height: 90.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  '$imageUrl$moimThumbnailUrl',
                  fit: BoxFit.fill,
                  height: 90.h,
                  width: 90.w,
                ),
              ),
            ),
            SizedBox(width: 24.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                SizedBox(
                  width: 228.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        moimName,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: B_1,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: B_2,
                            size: 19.w,
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            '$currentMember/$totalMember',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: B_2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 28.h,
                  child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // itemCount: moimTags.length,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: P_1,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          margin: EdgeInsets.only(right: 6.w),
                          child: Text(
                            '#${moimTags[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: WHITE,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MoimThunder extends StatelessWidget {
  String imageAsset;
  String categoryName;
  int memberGender;
  String totalMember;
  String currentMember;
  void Function() onPressed;
  String moimName;
  String moimDate;
  String moimPlace;
  String categoryImage;

  // Color? bellColor;
  final String imageUrl = 'http://$ip/upload';

  MoimThunder(
      {required this.imageAsset,
      required this.categoryName,
      required this.memberGender,
      required this.totalMember,
      required this.currentMember,
      required this.onPressed,
      required this.moimName,
      required this.moimDate,
      required this.moimPlace,
      required this.categoryImage,
      Key? key})
      : super(key: key);

  Color genderColor(int memberGender) {
    if (memberGender == 1) {
      return const Color(0xFF495FE7);
    } else if (memberGender == 2) {
      return const Color(0xFFE55E74);
    }
    return B_4;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 342.w,
        height: 145.h,
        padding:
            EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h, bottom: 16.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        '$imageUrl$categoryImage',
                        width: 26.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        categoryName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: B_2,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 72.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: P_3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/moim_thunder.png',
                          width: 11.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '번개',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: P_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(left: 4.0.w),
              child: SizedBox(
                width: 288.w,
                child: Text(
                  moimName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: B_1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 198.w,
              height: 32.h,
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: B_5,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    moimDate,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: B_2,
                    ),
                  ),
                  VerticalDivider(
                    width: 16.w,
                    thickness: 1,
                    indent: 8,
                    endIndent: 8,
                    color: B_4,
                  ),
                  Text(
                    moimPlace,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: B_2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewMoimCardFormat extends StatelessWidget {
  const NewMoimCardFormat({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 229.h,
        width: 358.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                // offset: Offset(1, 1),
            )
          ],
          color: WHITE,
        ),
        margin: EdgeInsets.only(right: 15.h),
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15.w),
                    Image.asset(
                      'assets/images/category_images/animal.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      '음악 | 스터디',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: B_1,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'D-8',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: P_1,
                      ),
                    ),
                    SizedBox(width: 26.w),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                SizedBox(
                  height: 70.h,
                  width: 207.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '필름감아 신입부원 모집!!',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: B_1,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '2024년을 맞이하여'
                        '필름감아에서 신입부원을 모집합니다!!',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: B_3,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 47.w),
                Container(
                  width: 72.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: B_5,
                      border: Border.all(color: B_4, width: 0.25)),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 16.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return TagLayout();
                    },
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/person.png',
                      width: 13.w,
                      height: 14.h,
                    ),
                    SizedBox(width: 8.5.w),
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: P_1,
                      ),
                    ),
                    Text(
                      '/36',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: B_4,
                      ),
                    ),
                    SizedBox(width: 21.w),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: 334.w,
              height: 1.h,
              color: B_5,
            ),
            SizedBox(height: 11.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    NewProfileImage30(),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Text(
                          '먼지이이잉',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: B_1,
                          ),
                        ),
                        Text(
                          '먼지이이잉',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: P_1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/icons/bookmark.png',
                          width: 20.w,
                          height: 23.h,
                          color: B_5,
                        ),
                        Text(
                          '32',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: B_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 19.w),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
