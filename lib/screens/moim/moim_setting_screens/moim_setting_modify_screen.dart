import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_textformfield.dart';
import '../../../const/colors.dart';
import '../../../layout/appbar_layout.dart';

class MoimSettingModifyScreen extends StatefulWidget {
  const MoimSettingModifyScreen({super.key});

  @override
  State<MoimSettingModifyScreen> createState() =>
      _MoimSettingModifyScreenState();
}

class _MoimSettingModifyScreenState extends State<MoimSettingModifyScreen> {
  TextEditingController? moimName;
  TextEditingController? moimPlace;
  TextEditingController? moimDescription;
  final TextEditingController _moimTags = TextEditingController();

  List<String> displayTexts = [];

  void _removeItem(int index) {
    setState(() {
      displayTexts.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moimName = TextEditingController();
    moimPlace = TextEditingController();
    moimDescription = TextEditingController();
  }

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
                text: '정보 수정',
                width: 99,
              ),
              SizedBox(height: 45.h),
              Text(
                '모임 이름',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: B_3,
                ),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                initialValue: 'asdfasdf',
                onChanged: (value) {
                  setState(() {});
                },
                borderColor: moimName!.text.isNotEmpty ? P_3 : B_5,
                fillColor: moimName!.text.isNotEmpty ? P_3 : WHITE,
              ),
              SizedBox(height: 12.h),
              // 모임 장소
              Text(
                '모임 소개',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: B_3,
                ),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                initialValue: 'adsfadfadf',
                onChanged: (value) {
                  setState(() {});
                },
                borderColor:
                    moimPlace!.text.isNotEmpty ? P_3 : B_5,
                fillColor: moimPlace!.text.isNotEmpty ? P_3 : WHITE,
              ),
              SizedBox(height: 12.h),
              Text(
                '모임 규칙',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: B_3,
                ),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                initialValue: 'adsfadfadf',
                onChanged: (value) {
                  setState(() {});
                },
                borderColor:
                    moimPlace!.text.isNotEmpty ? P_3 : B_5,
                fillColor: moimPlace!.text.isNotEmpty ? P_3 : WHITE,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.h),
                  Text(
                    '태그',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: B_1,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    controller: _moimTags,
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
                        fontWeight: FontWeight.w400,
                        color: B_4,
                      ),
                      filled: true,
                      fillColor: B_5,
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        displayTexts.add(value);
                        _moimTags.clear();
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    color: Colors.transparent,
                    height: 90.h,
                    child: Wrap(
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
                                      onTap: () {
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
                  ),
                ],
              ),
              SizedBox(height: 38.h),
              Text(
                '지원서 양식 관리',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: B_1,
                ),
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                initialValue: 'adsfadfadf',
                onChanged: (value) {
                  setState(() {});
                },
                borderColor:
                moimPlace!.text.isNotEmpty ? P_3 : B_5,
                fillColor: moimPlace!.text.isNotEmpty ? P_3 : WHITE,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
