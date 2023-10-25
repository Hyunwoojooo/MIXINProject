import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/data.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_main_screen.dart';

import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';

class MainHomeMoimScreen extends StatefulWidget {
  const MainHomeMoimScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeMoimScreen> createState() => _MainHomeMoimScreenState();
}

class _MainHomeMoimScreenState extends State<MainHomeMoimScreen> {
  final List<bool> _isBellSelect = List.filled(5, false);
  final String url = 'http://$ip/api/moim';
  final String imageUrl = 'http://$ip/upload';
  Dio dio = Dio();
  List<int> id = [];
  List<String> moimName = [];
  List<String> moimType = [];
  List moimTags = [];
  List<String> moimThumbnailUrl = [];
  List<String> categoryName = [];
  List<String> categoryImage = [];
  List? list;

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
      for (var moimData in data['data']) {
        moimName.add(moimData['moimName']);
      }
      for (var moimData in data['data']) {
        id.add(moimData['id']);
      }
      for (var moimData in data['data']) {
        moimType.add(moimData['moimType']);
      }
      for (var moimData in data['data']) {
        moimTags.add(moimData['moimTags']);
      }
      for (var moimData in data['data']) {
        moimThumbnailUrl.add(moimData['moimThumbnailUrl']);
      }
      for (var moimData in data['data']) {
        categoryName.add(moimData['categoryName']);
      }

      print('categoryName = $categoryName');
      print('moimName = $moimName');
      print('id = $id');
      print('moimType = $moimType');
      print('moimTags = $moimTags');
      print('moimThumbnailUrl = $moimThumbnailUrl');
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
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: id.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  MyMoimCard(
                    bellColor: Colors.red,
                    moimType: moimType[index],
                    backgroundImage: moimThumbnailUrl[index],
                    categoryImage: 'assets/images/category_images/music.png',
                    categoryName: categoryName[index],
                    memberGender: 0,
                    currentMember: 4,
                    iconOnPressed: () {},
                    onPressed: () {},
                    moimName: moimName[index],
                    tag: moimTags[index],
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            }),
      ),
    );
  }
}
