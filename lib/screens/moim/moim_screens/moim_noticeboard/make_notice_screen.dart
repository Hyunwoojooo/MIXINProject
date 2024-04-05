import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mixin_mac_2/components/custom_textformfield.dart';

import '../../../../const/colors.dart';
import '../../../../const/data.dart';
import '../../../../layout/appbar_layout.dart';

class MakeNoticeScreen extends StatefulWidget {
  final int id;

  const MakeNoticeScreen(this.id, {super.key});

  @override
  State<MakeNoticeScreen> createState() => _MakeNoticeScreenState();
}

class _MakeNoticeScreenState extends State<MakeNoticeScreen> {
  List<File> selectedImages = []; // List of selected image
  final picker = ImagePicker();
  TextEditingController controller = TextEditingController();
  Dio dio = Dio();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  XFile? images; // 가져온 사진들을 보여주기 위한 변수

  final url = 'http://$ip/api/moim/notice';

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  void realUse() async {
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    // var formData = FormData();
    //
    // formData.files.add(
    //   MapEntry(
    //     'file',
    //     await MultipartFile.fromFile(image!.path),
    //   ),
    // );
    // print(image!.path);
    //
    // try {
    //   final Response respOnlyImage = await dio.post(
    //     apiMoimImage,
    //     options: Options(
    //       headers: {
    //         "Authorization": jsonDecode(refreshToken!)[0],
    //         "Content-Type":
    //         "multipart/form-data; boundary=${formData.boundary}",
    //       },
    //     ),
    //     data: formData,
    //   );
    //   print(respOnlyImage);
    //   moimThumbnailFileUrl = respOnlyImage.data;
    // } catch (e) {
    //   if (e is DioError) {
    //     if (e.response != null) {
    //       print('DioError response: ${e.response}');
    //     } else {
    //       print('DioError error: $e');
    //     }
    //   } else {
    //     print('Unexpected error: $e');
    //   }
    // }

    // dio 사용
    try {
      Options options = Options(
        headers: {
          "Authorization": jsonDecode(refreshToken!)[0],
        },
        method: 'POST',
      );

      print(widget.id);
      final Response resp = await dio.post(
        url,
        options: options,
        data: {
          "moimId": widget.id,
          "title": "[공지] 새로운 업데이트 출시 안내 🎮",
          "content": '[공지] 새로운 업데이트 출시 안내 🎮'
              '안녕하세요, 게임 커뮤니티 여러분!'
              '저희 팀은 열심히 노력하여 새로운 업데이트를 개발했습니다. 여러분들에게 더욱 흥미진진하고 즐거운 게임 경험을 선사하기 위한 업데이트 내용을 안내해드립니다.'
              '주요 업데이트 내용:'
              '새로운 캐릭터 추가: 세계를 구할 용사가 등장했습니다! 새로운 캐릭터의 강력한 능력과 독특한 스토리를 만나보세요.'
              '이벤트 던전 오픈: 특별한 보상이 기다리는 이벤트 던전이 오픈되었습니다. 도전해보고 풍성한 보상을 획득하세요!'
              '그래픽 업그레이드: 게임의 그래픽을 더욱 세련되게 업그레이드했습니다. 화려한 효과와 고품질 그래픽으로 더 몰입감 있는 게임을 즐겨보세요.'
              '오류 및 버그 수정: 여러분의 의견에 귀 기울이고, 게임 플레이 중 발생한 오류와 버그를 수정했습니다. 더욱 안정적인 게임 환경을 제공합니다.'
              '이 외에도 다양한 콘텐츠와 개선 사항이 포함되어 있습니다.'
              '이번 업데이트로 더욱 향상된 게임 경험을 누려보시기 바랍니다. 피드백이나 문의사항이 있으면 언제든지 공식 커뮤니티 또는 고객센터를 통해 연락해주세요. 여러분의 소중한 의견을 기다리겠습니다.'
              '감사합니다. 즐거운 게임 되세요! 🚀🎮',
          "imageUrls": 'null',
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 18.h),
                      child: Text(
                        '공지 작성하기',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: B_1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Divider(
                thickness: 1.w,
                color: B_5,
              ),
              CustomTextFormField(
                hintText: '공지 내용을 작성해주세요.',
                controller: controller,
                maxLines: 27,
                width: 382.w,
                height: 580.h,
                borderColor: WHITE,
              ),
              SizedBox(
                width: 100.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: WHITE,
                  ),
                  onPressed: () {
                    getImages();
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/camera.png',
                        width: 26.w,
                        height: 26.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '사진',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: B_2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: SizedBox(
                  width: 342.w,
                  height: 56.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P_1,
                      elevation: 0,
                    ),
                    onPressed: () {
                      realUse();
                      Navigator.pop(context);
                    },
                    child: Text(
                      '올리기',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: WHITE,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
