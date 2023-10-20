import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/nopadding_textbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../components/buttons/category_button.dart';
import 'make_moim_2.dart';
import 'make_moim_tag.dart';

class MakeMoim1 extends StatefulWidget {
  const MakeMoim1({super.key});

  @override
  State<MakeMoim1> createState() => _MakeMoim1State();
}

class _MakeMoim1State extends State<MakeMoim1> {
  final int maxLength = 500;
  String textValue = "";
  TextEditingController moimNameTextController = TextEditingController();
  TextEditingController moimInfoTextController = TextEditingController();


  void _saveData(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 2.h,
                  width: 98.w,
                  color: MIXIN_2,
                ),
                Container(
                  height: 2.h,
                  width: 292.w,
                  color: MIXIN_BLACK_5,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Row(
                children: [
                  AppbarLayout(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 16.w),
                  Padding(
                    padding: EdgeInsets.only(top: 18.h),
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
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 440.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //카테고리 버튼
                      const CategoryButton(),
                      TextField(
                        controller: moimNameTextController,
                        onChanged: (value){
                          _saveData('moimInfo', moimInfoTextController.text);
                        },
                        decoration: InputDecoration(
                          hintText: '모임명을 작성해주세요',
                          hintStyle: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: MIXIN_BLACK_4,
                          ),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                        maxLength: 25,
                        maxLines: 1,
                      ),
                      Divider(thickness: 1.w, color: MIXIN_BLACK_5),
                      TextField(
                        controller: moimInfoTextController,
                        onChanged: (value){
                          _saveData('moimInfo', moimInfoTextController.text);
                        },
                        decoration: InputDecoration(
                          hintText: "모임에 대한 정보를 입력해주세요.",
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_4,
                          ),
                          counterStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_4,
                          ),
                          border: InputBorder.none,
                        ),
                        maxLength: maxLength,
                        maxLines: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 8.w, color: MIXIN_BLACK_5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '태그',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          color: MIXIN_BLACK_1,
                        ),
                      ),
                      NoPaddingTextButton(
                        child: Text(
                          '수정',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: MIXIN_BLACK_4,
                          ),
                        ),
                        onPressed: () {},
                      ),

                    ],
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(342.w, 48.h),
                      backgroundColor: MIXIN_BLACK_5,
                      elevation: 0.0,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TagPage(),
                        ),
                      );
                    },
                    child: Text(
                      '사람들이 모임을 더 찾기 쉽게 태그를 걸어주세요',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w500,
                        color: MIXIN_BLACK_4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 62.h),
            ElevatedButton(
              style: TextButton.styleFrom(
                fixedSize: Size(342.w, 56.h),
                elevation: 0,
                backgroundColor: MIXIN_POINT_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MeetingPage2(),
                  ),
                );
              },
              child: Text(
                '다음',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  fontFamily: 'SUIT',
                  color: WHITE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
