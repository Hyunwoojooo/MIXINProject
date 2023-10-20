import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/custom_textformfield.dart';
import '../../components/profile_gauge.dart';
import '../../const/colors.dart';
import '../../const/data.dart';
import '../../layout/appbar_layout.dart';
import '../screens/complete_profile_card_screen/complete_profile_card_screen.dart';

class Please extends StatefulWidget {
  const Please({Key? key}) : super(key: key);

  @override
  State<Please> createState() => _PleaseState();
}

class _PleaseState extends State<Please> {
  XFile? _pickedFile;
  final String apiUserProfileImageUrl = 'http://$ip/api/user/profile/image';
  final String apiUserProfileNoImageUrl = 'http://$ip/api/user/profile/noimage';
  final String apiUserCategoryUrl = 'http://$ip/api/user/category';

  final _userNickNameTextEditController = TextEditingController();
  final _userIntroduceTextEditController = TextEditingController();

  late MultipartFile multipartFile;

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
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 45.0.h),
                Center(
                  child: Text(
                    '자신을 표현할 수 있는\n별명, 한마디를 적어주세요',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.0.h),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 203.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0.r),
                      color: MIXIN_BLACK_5,
                    ),
                    child: Text(
                      '나중에 작성해주셔도 괜찮아요!',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0.sp,
                        color: MIXIN_POINT_COLOR,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 47.h),
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
                            color: MIXIN_BLACK_5,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 1.0)
                            ],
                          ),
                          child: Center(
                            child: _buildPhotoArea(),
                          ),
                        ),
                        ProfileCardGauge(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                // 닉네임
                Center(
                  child: CustomTextFormField(
                    width: 222.w,
                    controller: _userNickNameTextEditController,
                    onChanged: (String value) async {
                      await storage.write(
                          key: 'userNickName', value: _userNickNameTextEditController.text);
                      print(_userNickNameTextEditController.text);
                    },
                    hintText: '닉네임',
                  ),
                ),
                // 0/8
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 200.0.w, top: 4.h),
                    child: Text(
                      '$userNickNameLength/8',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: MIXIN_BLACK_4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 33.h),
                // 자기소개
                Center(
                  child: CustomTextFormField(
                    height: 160.w,
                    controller: _userIntroduceTextEditController,
                    onChanged: (String value) async {
                      await storage.write(
                          key: 'userIntroduceText', value: _userIntroduceTextEditController.text);
                      print(_userIntroduceTextEditController.text);
                    },
                    hintText: '자기 소개를 작성해주세요.',
                    maxLines: 6,
                  ),
                ),
                // 0/80
                Padding(
                  padding: EdgeInsets.only(left: 300.0.w, top: 10.h),
                  child: Text(
                    '$userIntroduceTextLength/80',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: MIXIN_BLACK_4,
                    ),
                  ),
                ),
                SizedBox(height: 38.h),
                // 버튼
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MIXIN_POINT_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.r)),
                        elevation: 0.0),
                    onPressed: () async {
                      print('userNickName : ${_userNickNameTextEditController.text}');
                      print('userIntroduceText: ${_userIntroduceTextEditController.text}');
                      fetchData();
                      if (!mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                          const CompleteProfileCardScreen(),
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
      print(image.path);
    });
  }

  void fetchData() async {
    final dio = Dio();
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    String? userPosition = await storage.read(key: 'userPosition');
    String? userPersonality = await storage.read(key: 'userPersonality');
    String? userValues = await storage.read(key: 'userValues');
    String? categorys = await storage.read(key: 'categorys');

    // 왜 지우지?
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

    // Add other data fields
    formData.fields.add(
      MapEntry(
        'data',
        jsonEncode({
          "userPosition": userPosition,
          "userPersonalitys": userPersonalityList,
          "userValues": userValues,
          "userIntroduceText": _userIntroduceTextEditController.text,
          "userNickName": _userNickNameTextEditController.text,
        }),
      ),
    );

    print('FormData fields:');
    for (var entry in formData.fields) {
      print('${entry.key}: ${entry.value}');
    }

    // If you want to see the file details as well
    print('FormData files:');
    for (var entry in formData.files) {
      print('${entry.key}: ${entry.value}');
    }

    final Response respCategory = await dio.post(
      apiUserCategoryUrl,
      options:
      Options(headers: {"Authorization": jsonDecode(refreshToken!)[0]}),
      data: {
        "categorys": categoryList,
      },
    );
    print(respCategory);

    try {
      final Response resp = await dio.post(
        apiUserProfileImageUrl,
        options: Options(
          headers: {
            "Authorization": jsonDecode(refreshToken)[0],
            "Content-Type":
            "multipart/form-data; boundary=${formData.boundary}",
          },
        ),
        data: {
          formData,
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
        color: MIXIN_BLACK_5,
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
