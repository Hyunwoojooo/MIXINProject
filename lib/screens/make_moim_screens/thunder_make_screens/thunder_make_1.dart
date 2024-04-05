import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mixin_mac_2/components/custom_textformfield.dart';
import 'package:mixin_mac_2/screens/make_moim_screens/make_moim_4.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/buttons/choice_gender_button.dart';
import '../../../components/buttons/choice_numb_button.dart';
import '../../../components/buttons/choice_resistar_button.dart';
import '../../../const/colors.dart';
import '../../../const/data.dart';
import '../../../layout/appbar_layout.dart';
import '../make_moim_2.dart';

class ThunderMake1 extends StatefulWidget {
  const ThunderMake1({Key? key}) : super(key: key);

  @override
  State<ThunderMake1> createState() => _ThunderMake1State();
}

class _ThunderMake1State extends State<ThunderMake1> {
  DateTime? today;
  DateTime? previousDate;
  int? day;
  String? date;
  int isChecked = 0;
  Dio dio = Dio();

  final url = 'http://$ip/api/moim/create';
  List<bool> isPressed = List.filled(7, false);
  int selectedIndex = -1;

  TextEditingController moimPlaceController = TextEditingController();

  String moimName = '';
  String moimType = '';
  String moimCategory = '';
  List<String> moimTags = [];
  String moimDescription = '';
  String moimMemberLimit = '';
  String genderRestriction = '';
  String moimAdmissionCriteria = '';
  String moimRecruitmentPeriod = '';
  String moimFrequency = '';
  String moimRules = '';


  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void realUse() async {
    String? refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    moimName = prefs.getString('moimName')!;
    moimType = prefs.getString('moimType')!;
    moimCategory = prefs.getString('moimCategory')!;
    moimTags = prefs.getStringList('moimTags')!;
    moimDescription = prefs.getString('moimDescription')!;
    moimMemberLimit = prefs.getString('moimMemberLimit')!;
    genderRestriction = prefs.getString('genderRestriction')!;
    moimAdmissionCriteria = prefs.getString('moimAdmissionCriteria')!;
    moimRecruitmentPeriod = prefs.getString('moimRecruitmentPeriod')!;
    moimFrequency = prefs.getString('moimFrequency')!;
    moimRules = prefs.getString('moimRules')!;


    print("moimName = $moimName");
    print("moimType = $moimType");
    print("moimCategory = $moimCategory");
    print("moimTags = $moimTags");
    print("moimDescription = $moimDescription");
    print("moimMemberLimit = $moimMemberLimit");
    print("genderRestriction = $genderRestriction");
    print("moimAdmissionCriteria = $moimAdmissionCriteria");
    print("moimRecruitmentPeriod = $moimRecruitmentPeriod");
    print("moimFrequency = $moimFrequency");
    print("moimRules = $moimRules");


    // dio 사용
    try {
      Options options = Options(
        headers: {
          "Authorization": jsonDecode(refreshToken!)[0],
        },
        method: 'POST',
      );

      final Response resp = await dio.post(
        url,
        options: options,
        data: {
          "moimName": moimName,
          "moimType": moimType,
          "moimCategory": moimCategory,
          "moimTags": moimTags,
          "moimDescription": moimDescription,
          "moimMemberLimit": moimMemberLimit,
          "genderRestriction": genderRestriction,
          "moimAdmissionCriteria": moimAdmissionCriteria,
          "moimRecruitmentPeriod": moimRecruitmentPeriod,
          "moimFrequency": 'null',
          "moimThumbnailFileUrl": 'null',
          "moimRules": moimRules,
          "moimPlace": moimPlaceController.text
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
  void initState() {
    today = DateTime.now();
    previousDate = today?.subtract(const Duration(days: 2));
    print(previousDate);
    day = int.parse(DateFormat('d').format(today!));

    print(DateFormat('d').format(today!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 2.h,
                    width: 248.w,
                    color: P_2,
                  ),
                  Container(
                    height: 2.h,
                    width: 142.w,
                    color: B_5,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            '번개 만들기',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: B_1,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 43.h),
                    _text('인원 수'),
                    SizedBox(height: 12.h),
                    const ChoiceNumbButton(),
                    SizedBox(height: 36.h),
                    _text('성별'),
                    SizedBox(height: 12.h),
                    const ChoiceGenderButton(),
                    SizedBox(height: 36.h),
                    _text('모임 날짜'),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 47.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // physics: const NeverScrollableScrollPhysics(),
                        // padding: EdgeInsets.symmetric(horizontal: 8.w), // Adjusted padding
                        itemExtent: 51.w,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle selection
                                selectedIndex = selectedIndex == index ? -1 : index;
                              });

                              print(index);
                              print(isPressed[index]);
                            },
                            child: CircleAvatar(
                              radius: 47.r,
                              backgroundColor: selectedIndex == index ? P_3 : Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: B_5,

                                  ),
                                ),
                                child: Text(
                                  DateFormat.d().format(
                                    DateTime.now().add(Duration(days: index)),
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                    color: selectedIndex == index ? P_1 : B_4,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 7,
                      ),
                    ),

                    SizedBox(height: 36.h),
                    _text('모임 장소'),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      hintText: '모임 장소를 작성해주세요',
                      controller: moimPlaceController,
                      onChanged: (value){
                        _saveData('moimPlace', moimPlaceController.text);
                      },
                    ),
                    SizedBox(height: 36.h),
                    _text('승인 여부'),
                    SizedBox(height: 12.h),
                    const ChoiceResisterButton(),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size(342.w, 56.h),
                        elevation: 0,
                        backgroundColor: P_1,
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
                    SizedBox(height: 34.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'SUIT',
        color: B_3,
      ),
    );
  }
}
