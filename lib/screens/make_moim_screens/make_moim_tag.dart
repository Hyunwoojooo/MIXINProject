import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import 'make_moim_2.dart';

class TagPage extends StatefulWidget {

  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> displayTexts = [];


  void _removeItem(int index) {
    setState(() {
      displayTexts.removeAt(index);
    });
  }

  void _saveData(String key, List<String> value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppbarLayout(
                      onPressed: () {
                        _saveData('moimTags', displayTexts);
                        print(displayTexts);
                        Navigator.pop(context, displayTexts);
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
                          color: B_1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 45.h),
                Text(
                  '태그',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: B_1,
                  ),
                ),
                SizedBox(height: 16.h),
                TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: '사람들이 모임을 더 찾기 쉽게 태그를 걸어주세요',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.0.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0.r),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: B_5, width: 1.0.w),
                      borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: B_5, width: 1.0.w),
                      borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      color: B_4,
                    ),
                    filled: true,
                    fillColor: B_5,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      displayTexts.add(value);
                      _textEditingController.clear();
                    });
                  },
                ),
                SizedBox(height: 16.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.w,
                  children: displayTexts
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _removeItem(entry.key);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 7.5.h),
                            decoration: BoxDecoration(
                              color: P_3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '#${entry.value}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: P_1,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _removeItem(entry.key);
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/x.png',
                                    height: 18.h,
                                    width: 18.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 540.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
