import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/layout/nopadding_textbutton.dart';
import 'package:mixin_mac_2/screens/moim/moim_setting_screens/moim_setting_modify_screen.dart';

import '../../../components/profile_image.dart';
import '../../../layout/appbar_layout.dart';

class MoimSettingMainScreen extends StatefulWidget {
  const MoimSettingMainScreen({super.key});

  @override
  State<MoimSettingMainScreen> createState() => _MoimSettingMainScreenState();
}

class _MoimSettingMainScreenState extends State<MoimSettingMainScreen> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수

  Future<void> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    setState(() {
      image = pickedFile;
      print(image!.path.toString());
    });
  }

  final List dummyTag = [
    '필카',
    '동네사진',
    '사진찍기',
    '추억',
  ];
  final List<List> dummyFriend = [
    ['먼지이이잉', '모임리더'],
    ['헬로우', ''],
    ['하하호호히히', ''],
    ['닉네임', ''],
    ['로자공', ''],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '모임 설정',
                  width: 99,
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '썸네일',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    NoPaddingTextButton(
                      child: Text(
                        '사진 변경>',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: P_1,
                        ),
                      ),
                      onPressed: () async {
                        getImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Container(
                  height: 188.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: B_5,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  // alignment: Alignment.center,
                  child: _buildPhotoArea(),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '모임 정보',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    NoPaddingTextButton(
                      child: Text(
                        '정보 수정>',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: P_1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const MoimSettingModifyScreen()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '필름감아',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    Text(
                      '개설예정',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFB1B1B7),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 27.h),
                Text(
                  '필름감아는 필름 카메라 초보는 물론이고, 필름 카메라를 사용하시는 분들까지 모두 참여가능한 소모임입니다',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: B_3,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      '모임주기',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFFB1B1B7),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    Text(
                      '주 1회',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: MIXIN_47,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '모임규칙',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0xFFB1B1B7)),
                    ),
                    SizedBox(width: 40.w),
                    Text(
                      '1. 헬로\n'
                      '2. 하이\n'
                      '3. 하우알유',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: MIXIN_47,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 32.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyTag.length,
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
                            '#${dummyTag[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: P_1,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 36.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '모임원 관리',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: B_1,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: B_4,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '1/6',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: B_4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfileImage60(profilePicture: 'adsf',),
                                SizedBox(width: 15.w),
                                Text(
                                  dummyFriend[index][0].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: MIXIN_47,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: B_4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    elevation: 0.0,
                                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                                  ),
                                  child: Text(
                                    '거절',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: WHITE,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: P_1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    elevation: 0.0,
                                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                                  ),
                                  child: Text(
                                    '수락',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: WHITE,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 19.h),
                      ],
                    );
                  },
                  itemCount: dummyFriend.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoArea() {
    return image != null
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 188.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
            ), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            height: 188.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: B_5,
              borderRadius: BorderRadius.circular(24.r),
            ),
            alignment: Alignment.center,
            child: Text(
              '이 부분 수정해야 됨',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
                color: B_4,
              ),
            ),
          );
  }
}
