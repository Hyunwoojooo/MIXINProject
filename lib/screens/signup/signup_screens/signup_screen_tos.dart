import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../const/colors.dart';
import '../../../const/term_of_service_text/progress_text.dart';
import '../../../layout/appbar_layout.dart';
import '../../../layout/custom_floating_action_button.dart';
import '../../../layout/text_layout.dart';
import '../terms_of_use_screen/ad_ifm_term_screen.dart';
import '../terms_of_use_screen/community_use_term_screen.dart';
import '../terms_of_use_screen/personal_ifm_term_screen.dart';
import '../terms_of_use_screen/service_use_term_screen.dart';
import 'signup_screen_namephone.dart';

/*
  FloatingActionButton에 blur 처리가 되어있는데 있는게 맞나 없는게 맞나 물어봐야 됨 O
  세부사항으로 들어가서 '확인하고 동의' 눌렀을 때 동의 버튼 체크 O
  세부사항으로 들어가면 글자 행간 간격을 좀 벌렸으면 좋겠다 O
  checkbutton 수정 O
  totalCheckbutton 알고리즘 수정 (문제 많음)
 */

class SignUpTosScreen extends StatefulWidget {
  const SignUpTosScreen({Key? key}) : super(key: key);

  @override
  State<SignUpTosScreen> createState() => _SignUpTosScreenState();
}

class _SignUpTosScreenState extends State<SignUpTosScreen> {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final storage = const FlutterSecureStorage();

  bool isTotalChecked = false;
  bool isServiceUserChecked = false;
  bool isPersonalIfmChecked = false;
  bool isCommunityChecked = false;
  bool isAdIfmChecked = false;
  bool isProgressChecked = false;
  bool isAgeChecked = false;

  bool nextButtonColor = false;

  String isAdIfmCheckedText = '';

  void changeData() {
    if (isServiceUserChecked == true &&
        isPersonalIfmChecked == true &&
        isCommunityChecked == true &&
        isProgressChecked == true &&
        isAgeChecked == true) {
      nextButtonColor = true;
      isTotalChecked = true;
    } else {
      nextButtonColor = false;
      isTotalChecked = false;
    }
  }

  ProgressText progressText = ProgressText();
  String progressTextMain = ProgressText().progressText;
  String ageTextMain = ProgressText().ageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        text: '다음',
        fillColor: nextButtonColor == true ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
        onPressed: () async {
          if (nextButtonColor == true) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpScreenNamePhone(),
              ),
            );
            print('광고성 약관 : $isAdIfmCheckedText');
          }
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => SignUpScreenNamePhone(),
          //   ),
          // );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppbarLayout(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 45.0.h),
                const HeadlineText(text: '믹스인이 처음이신가요?\n이용약관 동의가 필요해요!'),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(Size(22.w, 22.h)),
                      onPressed: () {
                        setState(() {
                          isTotalChecked = !isTotalChecked;
                          isServiceUserChecked = !isServiceUserChecked;
                          isPersonalIfmChecked = !isPersonalIfmChecked;
                          isCommunityChecked = !isCommunityChecked;
                          isAdIfmChecked = !isAdIfmChecked;
                          isProgressChecked = !isProgressChecked;
                          isAgeChecked = !isAgeChecked;

                          if (isAdIfmChecked == true) {
                            isAdIfmCheckedText = '동의';
                          } else if (isAdIfmChecked == false) {
                            isAdIfmCheckedText = '비동의';
                          }
                          storage.write(
                              key: 'isAdIfmChecked', value: isAdIfmCheckedText);
                          changeData();
                          print(isTotalChecked);
                        });
                      },
                      icon: Image.asset(
                        isTotalChecked
                            ? 'assets/images/total_checkbox_on.png'
                            : 'assets/images/total_checkbox_off.png',
                        width: 22.h,
                        height: 22.h,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '약관 정책동의',
                      style: TextStyle(
                        color: MIXIN_BLACK_1,
                        fontFamily: 'SUIT',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30.h,
                  thickness: 1.0.h,
                  color: MIXIN_BLACK_5,
                ),
                SizedBox(height: 4.0.h),
                Column(
                  children: [
                    // 서비스이용약관
                    SizedBox(
                      height: 18.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints.tight(Size(18.w, 18.h)),
                                onPressed: () {
                                  setState(() {
                                    isServiceUserChecked =
                                        !isServiceUserChecked;
                                    changeData();
                                  });
                                },
                                icon: Image.asset(
                                  isServiceUserChecked
                                      ? 'assets/images/checkbox_on.png'
                                      : 'assets/images/checkbox_off.png',
                                  width: 18.h,
                                  height: 18.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '서비스이용약관 동의 (필수)',
                                style: TextStyle(
                                  color: MIXIN_BLACK_1,
                                  fontFamily: 'SUIT',
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            iconSize: 18.0.w,
                            onPressed: () {
                              setState(() {
                                isServiceUserChecked = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceUseTerm(),
                                ),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/arrow_right_3x.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),
                    // 개인정보처리방침
                    SizedBox(
                      height: 18.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints.tight(Size(18.w, 18.h)),
                                onPressed: () {
                                  setState(() {
                                    isPersonalIfmChecked =
                                        !isPersonalIfmChecked;
                                    changeData();
                                  });
                                },
                                icon: Image.asset(
                                  isPersonalIfmChecked
                                      ? 'assets/images/checkbox_on.png'
                                      : 'assets/images/checkbox_off.png',
                                  width: 18.h,
                                  height: 18.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '개인정보처리방침 동의 (필수)',
                                style: TextStyle(
                                  color: MIXIN_BLACK_1,
                                  fontFamily: 'SUIT',
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            onPressed: () {
                              setState(() {
                                isPersonalIfmChecked = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalIfmterm()),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/arrow_right_3x.png',
                              width: 18.w,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),
                    // 커뮤니티이용규칙
                    SizedBox(
                      height: 18.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints.tight(Size(18.w, 18.h)),
                                onPressed: () {
                                  setState(() {
                                    isCommunityChecked = !isCommunityChecked;
                                    if (isTotalChecked == false) {
                                      isCommunityChecked == false;
                                    }
                                    changeData();
                                  });
                                },
                                icon: Image.asset(
                                  isCommunityChecked
                                      ? 'assets/images/checkbox_on.png'
                                      : 'assets/images/checkbox_off.png',
                                  width: 18.h,
                                  height: 18.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '커뮤니티이용규칙 확인 (필수)',
                                style: TextStyle(
                                  color: MIXIN_BLACK_1,
                                  fontFamily: 'SUIT',
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            iconSize: 18.0.w,
                            onPressed: () {
                              setState(() {
                                isCommunityChecked = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommunityUseTerm()),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/arrow_right_3x.png',
                              width: 18.w,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0.h),
                    // 광고성 정보 수신
                    SizedBox(
                      height: 18.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints:
                                    BoxConstraints.tight(Size(18.w, 18.h)),
                                onPressed: () {
                                  setState(() {
                                    isAdIfmChecked = !isAdIfmChecked;
                                    if (isAdIfmChecked == true) {
                                      isAdIfmCheckedText = '동의';
                                    } else if (isAdIfmChecked == false) {
                                      isAdIfmCheckedText = '비동의';
                                    }
                                  });
                                  storage.write(
                                      key: 'isAdIfmChecked',
                                      value: isAdIfmCheckedText);
                                  setState(() {});
                                },
                                icon: Image.asset(
                                  isAdIfmChecked
                                      ? 'assets/images/checkbox_on.png'
                                      : 'assets/images/checkbox_off.png',
                                  width: 18.h,
                                  height: 18.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '광고성 정보 수신 동의 (선택)',
                                style: TextStyle(
                                  color: MIXIN_BLACK_1,
                                  fontFamily: 'SUIT',
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            iconSize: 18.0.w,
                            onPressed: () {
                              setState(() {
                                isAdIfmChecked = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdIfmTerm()),
                              );
                            },
                            icon: Image.asset(
                              'assets/images/arrow_right_3x.png',
                              width: 18.w,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34.h),
                    // 본인 명의
                    SizedBox(
                      height: 20.0.h,
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            onPressed: () {
                              setState(() {
                                isProgressChecked = !isProgressChecked;
                                changeData();
                              });
                            },
                            icon: Image.asset(
                              isProgressChecked
                                  ? 'assets/images/checkbox_on.png'
                                  : 'assets/images/checkbox_off.png',
                              width: 18.h,
                              height: 18.h,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '본인 명의를 이용하여 가입을 진행하겠습니다.',
                            style: TextStyle(
                              color: MIXIN_BLACK_1,
                              fontFamily: 'SUIT',
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    // 본인 명의 내용
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      // alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F7),
                        borderRadius: BorderRadius.circular(8.0.r),
                        border: Border.all(
                          color: const Color(0xFFCED0D5),
                          width: 1.0.w,
                        ),
                      ),
                      // width: 342.w,
                      // height: 114.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '부모님, 친구 등 타인의 명의로 가입할 수 없습니다.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w600,
                              color: MIXIN_BLACK_2,
                            ),
                          ),
                          Text(
                            progressTextMain,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              fontFamily: 'SUIT',
                              color: MIXIN_BLACK_2,
                              height: 1.4.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34.0.h),
                    // 14세 이상
                    SizedBox(
                      height: 20.0.h,
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints.tight(Size(18.w, 18.h)),
                            onPressed: () {
                              setState(() {
                                isAgeChecked = !isAgeChecked;
                                changeData();
                              });
                            },
                            icon: Image.asset(
                              isAgeChecked
                                  ? 'assets/images/checkbox_on.png'
                                  : 'assets/images/checkbox_off.png',
                              width: 18.h,
                              height: 18.h,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '만 14세 이상입니다.',
                            style: TextStyle(
                              color: MIXIN_BLACK_1,
                              fontFamily: 'SUIT',
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.w),
                    // 14세 이상 내용
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F7),
                        borderRadius: BorderRadius.circular(8.0.r),
                        border: Border.all(
                          color: const Color(0xFFCED0D5),
                          width: 1.0.w,
                        ),
                      ),
                      width: 342.w,
                      height: 50.h,
                      child: Text(
                        ageTextMain,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0.sp,
                          fontFamily: 'SUIT',
                          color: MIXIN_BLACK_2,
                          height: 1.4.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
