import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/layout/nopadding_textbutton.dart';
import 'package:mixin_mac_2/screens/make_moim_screens/thunder_make_screens/thunder_make_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/colors.dart';
import '../../layout/appbar_layout.dart';
import '../../components/buttons/category_button.dart';
import 'make_moim_2.dart';
import 'make_moim_tag.dart';

/*
1. 태그 버튼을 눌렀을 때 태그 초기화 되는거 수정해야됨
2. 수정 버튼 눌렀을 때

 */
class MakeMoim1 extends StatefulWidget {
  List<String> moimTags = [];

  MakeMoim1({super.key});

  @override
  State<MakeMoim1> createState() => _MakeMoim1State();
}

class _MakeMoim1State extends State<MakeMoim1> {
  final int maxLength = 500;
  String textValue = "";
  TextEditingController moimNameTextController = TextEditingController();
  TextEditingController moimDescriptionTextController = TextEditingController();
  List<String> moimTags = [];
  String moimType = '';

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    moimType = prefs.getString('moimType')!;

  }

  void _saveListData(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  void _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    moimType = prefs.getString('moimType')!;
    setState(() {});
  }


  final TextEditingController _textEditingController = TextEditingController();
  List<String> displayTexts = [];

  void _removeItem(int index) {
    setState(() {
      displayTexts.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _setData();
    print('moimType : $moimType');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 2.h,
                    width: 98.w,
                    color: P_2,
                  ),
                  Container(
                    height: 2.h,
                    width: 292.w,
                    color: B_5,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                          color: B_1,
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
                          onChanged: (value) {
                            _saveData(
                              'moimName',
                              moimNameTextController.text,
                            );
                            _setData();
                          },
                          decoration: InputDecoration(
                            hintText: '모임명을 작성해주세요',
                            hintStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: B_4,
                            ),
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: B_1,
                          ),
                          maxLength: 25,
                          maxLines: 1,
                        ),
                        Divider(thickness: 1.w, color: B_5),
                        TextField(
                          controller: moimDescriptionTextController,
                          onChanged: (value) {
                            _saveData('moimDescription',
                                moimDescriptionTextController.text);
                            _setData();
                          },
                          decoration: InputDecoration(
                            hintText: "모임에 대한 정보를 입력해주세요.",
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: B_4,
                            ),
                            counterStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: B_4,
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
              Divider(thickness: 8.w, color: B_5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0.r)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: B_5, width: 1.0.w),
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0.r)),
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
              ),
              // SizedBox(height: 52.h),
              ElevatedButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(342.w, 56.h),
                  elevation: 0,
                  backgroundColor: P_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  ),
                onPressed: () async {
                  _saveListData('moimTags', displayTexts);
                  print('moimType : $moimType');
                  if(moimType == '번개'){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ThunderMake1(),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MeetingPage2(),
                      ),
                    );
                  }
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
    );
  }
}
