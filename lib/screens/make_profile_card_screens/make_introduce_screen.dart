import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http_parser/http_parser.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixin_mac_2/screens/main_screens/main_bottom_navigation_bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../components/custom_textformfield.dart';
import '../../components/profile_gauge.dart';
import '../../const/colors.dart';
import '../../const/data.dart';
import '../../layout/appbar_layout.dart';
import '../complete_profile_card_screen/complete_profile_card_screen.dart';

class MakeIntroduceScreen extends StatefulWidget {
  const MakeIntroduceScreen({Key? key}) : super(key: key);

  @override
  State<MakeIntroduceScreen> createState() => _MakeIntroduceScreenState();
}

class _MakeIntroduceScreenState extends State<MakeIntroduceScreen> {
  XFile? _pickedFile;
  final String apiUserProfileOnlyImageUrl =
      'http://$ip/api/user/profile/onlyimage';
  final String apiAdUserProfile = 'http://$ip/api/ad/user/profile';
  final String apiUserCategoryUrl = 'http://$ip/api/user/category';
  dynamic imageUrl = 'asset/images/default_profile.png';

  final _userNickNameTextEditController = TextEditingController();
  final _userIntroduceTextEditController = TextEditingController();

  late MultipartFile multipartFile;
  String userNickName = '';
  String userIntroduceText = '';
  String userNickNameLength = '0';
  String userIntroduceTextLength = '0';

  final picker = ImagePicker();
  var image; // 카메라로 촬영한 이미지를 저장할 변수
  XFile? images; // 가져온 사진들을 보여주기 위한 변수
  late FormData formData;

  @override
  void initState() {
    super.initState();
    formData = FormData(); // initState에서 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarIconTextLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: '프로필카드제작',
                  width: 99.w,
                ),
                SizedBox(height: 63.h),
                Center(
                  child: Text(
                    '자신을 표현할 수 있는\n별명, 한마디를 적어주세요',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp,
                      color: B_1
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 203.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: B_5,
                    ),
                    child: Text(
                      '나중에 작성해주셔도 괜찮아요!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: P_1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 44.h),
                Center(
                  child: GestureDetector(
                    onTap: (() {
                      getImage(ImageSource.gallery);
                    }),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 87.w,
                          height: 87.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: B_5,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 1.0)
                            ],
                          ),
                          child: Center(
                            child: _buildPhotoArea(),
                          ),
                        ),
                        const ProfileGauge(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                // 닉네임
                Center(
                  child: CustomTextFormField(
                    width: 230.w,
                    controller: _userNickNameTextEditController,
                    onChanged: (String value) async {
                      setState(() {});
                      userNickName = value;
                      await storage.write(
                          key: 'userNickName', value: userNickName);
                      print(userNickName);
                    },
                    hintText: '이름을 작성해주세요',
                  ),
                ),
                // 0/8
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 264.w, top: 4.h),
                    child: Row(
                      children: [
                        Text(
                          '${userNickName.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: P_1,
                          ),
                        ),
                        Text(
                          '/8',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: B_4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                // 자기소개
                Center(
                  child: CustomTextFormField(
                    height: 160.w,
                    controller: _userIntroduceTextEditController,
                    onChanged: (String value) async {
                      userIntroduceText = value;
                      setState(() {});
                      await storage.write(
                          key: 'userIntroduceText', value: userIntroduceText);
                      print(userIntroduceText);
                    },
                    hintText: '자기 소개를 작성해주세요.',
                    maxLines: 8,
                  ),
                ),
                // 0/80
                Padding(
                  padding: EdgeInsets.only(left: 325.w, top: 10.h),
                  child: Row(
                    children: [
                      Text(
                        '${userIntroduceText.length}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: P_1,
                        ),
                      ),
                      Text(
                        '/80',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: B_4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38.h),
                // 버튼
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: P_1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r)),
                        elevation: 0.0),
                    onPressed: () async {
                      print('userNickName : $userNickName');
                      print('userIntroduceText: $userIntroduceText');
                      fetchData();
                      if (!mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const MainBottomNavigationBar(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 342.w,
                      height: 56.h,
                      child: Center(
                        child: Text(
                          '다음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  Future<void> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    setState(() {
      image = pickedFile;
      print(image.toString());
    });
  }

  void fetchData() async {
    final dio = Dio();
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    String? userPosition = await storage.read(key: 'userPosition');
    String? userPersonality = await storage.read(key: 'userPersonality');
    String? userValues = await storage.read(key: 'userValues');
    String? categorys = await storage.read(key: 'categorys');

    List<String> userPersonalityList = removeList(userPersonality!);
    List<String> categoryList = removeList(categorys!);

    // Add the file to the FormData if image is not null

    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(image!.path),
      ),
    );
    print(image!.path);

    try {
      final Response respCategory = await dio.post(
        apiUserCategoryUrl,
        options: Options(headers: {
          "Authorization": jsonDecode(refreshToken!)[0],
        }),
        data: {
          "categorys": categoryList,
        },
      );
      print(respCategory);

      final Response respUserProfile = await dio.post(
        apiAdUserProfile,
        options: Options(
          headers: {
            "Authorization": jsonDecode(refreshToken)[0],
          },
        ),
        data: {
          "userPosition": userPosition,
          "userPersonalitys": userPersonalityList,
          "userValues": userValues,
          "userIntroduceText": userIntroduceText,
          "userNickName": _userNickNameTextEditController.text,
        },
      );
      print(respUserProfile);

      final Response respOnlyImage = await dio.put(
        apiUserProfileOnlyImageUrl,
        options: Options(
          headers: {
            "Authorization": jsonDecode(refreshToken)[0],
            "Content-Type":
                "multipart/form-data; boundary=${formData.boundary}",
          },
        ),
        data: formData,
      );
      print(respOnlyImage);
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

  Widget _buildPhotoArea() {
    return image != null
        ? SizedBox(
            width: 90.w,
            height: 90.h,
            child: ClipOval(
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
            ), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: 90.w,
            height: 90.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: B_5,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/default_profile_image.png',
                fit: BoxFit.fitWidth,
                height: 54.h,
                width: 54.w,
              ),
            ),
          );
  }

  Future<String> hintText() async {
    return storage.read(key: 'userName').toString();
  }

  String except(String text) {
    text = text.replaceAll('[', '').replaceAll(']', '');
    return text;
  }

  String removeText(String text) {
    text = text.substring(1, text.length - 1).replaceAll("\"", '');
    return text;
  }

  List<String> removeList(String text) {
    List<String> list;
    list = text.substring(1, text.length - 1).replaceAll("\"", '').split(',');
    return list;
  }
}
