import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixin_mac_2/const/data.dart';
import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import '../../components/buttons/moim_cycle_button.dart';
import '../../components/buttons/moim_rules.dart';
import '../../components/buttons/moim_term_button.dart';
import 'make_moim_4.dart';

class MeetingPage3 extends StatefulWidget {
  const MeetingPage3({Key? key}) : super(key: key);

  @override
  State<MeetingPage3> createState() => _MeetingPage3State();
}

class _MeetingPage3State extends State<MeetingPage3> {
  final picker = ImagePicker();
  Dio dio = Dio();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  XFile? images; // 가져온 사진들을 보여주기 위한 변수
  final String apiMoimCreate = 'http://$ip/api/moim/create';
  final String apiMoimImage = 'http://$ip/api/moim/image';
  String moimThumbnailFileUrl = '';
  List<String> tags = ['필카', '사진', '동아리', '여행'];

  Future<void> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    setState(() {
      image = pickedFile;
      print(image!.path.toString());
    });
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
              color: MIXIN_BLACK_5,
              borderRadius: BorderRadius.circular(24.r),
            ),
            alignment: Alignment.center,
            child: Text(
              '이미지 선택하기',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
                color: MIXIN_BLACK_4,
              ),
            ),
          );
  }

  void realUse() async {
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    var formData = FormData();

    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(image!.path),
      ),
    );
    print(image!.path);

    try {
      final Response respOnlyImage = await dio.post(
        apiMoimImage,
        options: Options(
          headers: {
            "Authorization": jsonDecode(refreshToken!)[0],
            "Content-Type":
                "multipart/form-data; boundary=${formData.boundary}",
          },
        ),
        data: formData,
      );
      print(respOnlyImage);
      moimThumbnailFileUrl = respOnlyImage.data;
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

    // dio 사용
    try {
      Options options = Options(
        headers: {
          "Authorization": jsonDecode(refreshToken!)[0],
        },
        method: 'POST',
      );

      final Response resp = await dio.post(
        apiMoimCreate,
        options: options,
        data: {
          "moimName": "MCA",
          "moimType": "동아리",
          "moimCategory": "IT/개발",
          "moimTags": tags,
          "moimDescription": "MCA는 전공동아리입니다.",
          "moimMemberLimit": "20",
          "genderRestriction": "남녀",
          "moimAdmissionCriteria": "프로그램,설계 파트",
          "moimRecruitmentPeriod": "2023.06.02-2023.07.02",
          "moimFrequency": "주2회",
          "moimThumbnailFileUrl": "$moimThumbnailFileUrl",
          "moimRules": "없습니다",
        },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Row(
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 16.w),
                    Padding(
                      padding: EdgeInsets.only(top: 43.h),
                      child: Text(
                        '모임 만들기',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 45.h),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '썸네일',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_3,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () async {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                          height: 188.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: MIXIN_BLACK_5,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          // alignment: Alignment.center,
                          child: _buildPhotoArea(),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        '모집기간',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_3,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const MoimTermButton(),
                      SizedBox(height: 36.h),
                      Text(
                        '모임 주기',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_3,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const MoimCycleButton(),
                      SizedBox(height: 36.h),
                      Text(
                        '모임 규칙',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_3,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const MoimRules(),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(342.w, 56.h),
                    elevation: 0,
                    backgroundColor: MIXIN_POINT_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    realUse();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MakeMoim4(),
                      ),
                    );
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: WHITE,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
