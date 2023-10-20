import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/all_category.dart';
import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';
import '../../../layout/category_layout_round.dart';
import '../../../models/moim_card_model.dart';
import '../../moim/moim_detail_screens/moim_detail_screen.dart';

class MainHomeHomeScreen extends StatefulWidget {
  const MainHomeHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeHomeScreen> createState() => _MainHomeHomeScreenState();
}

class _MainHomeHomeScreenState extends State<MainHomeHomeScreen> {
  final List<bool> _selectScript = List.filled(3, false);
  List<String> tagText = ['자격증', '산업기사', '집중'];
  List<bool> categoryList = List.filled(14, false);

  List<String> selectedOptions = [];

  final List<MoimCardModel> _registeredMoim = [
    MoimCardModel(
      title: '제발되라',
      memberCount: 4,
      hashTag: ['사랑', '존중', '배려'],
      dDate: 5,
      category: Category.classes,
      type: Type.thunder,
    ),
    MoimCardModel(
      title: '제발되라제발제발',
      memberCount: 23,
      hashTag: ['행복', '재미', '격려'],
      dDate: 7,
      category: Category.it,
      type: Type.study,
    ),
    MoimCardModel(
      title: '이게 되면 좀 뭐가 된다',
      memberCount: 1,
      hashTag: ['부담', '걱정', '염려'],
      dDate: 3,
      category: Category.cook,
      type: Type.project,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //배너
          SizedBox(
            height: 251.h,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 176.h,
                  color: const Color(0xFF495FE7),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        '우리들의 놀이터, 믹스인',
                        style: TextStyle(
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0.sp,
                          color: WHITE,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '더 잘 활용하는 방법은?',
                        style: TextStyle(
                          fontFamily: 'SUIT',
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 91.h,
                  left: 24.w,
                  child: SizedBox(
                    width: 342.w,
                    height: 160.h,
                    child: Image.asset('assets/images/maskgroup.png'),
                  ),
                )
              ],
            ),
          ),

          // 정규모임 카드
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 16.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MoimCardSmall(
                    moimType: '스터디',
                    dDay: 10,
                    categoryImage: 'assets/images/category_images/class.png',
                    backgroundImage: 'assets/images/complete_make_moim.png',
                    categoryName: '수업',
                    memberGender: 0,
                    totalMember: 5,
                    currentMember: 3,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                            const MoimDetailScreen()),
                      );
                      print('1');
                    },
                    iconOnPressed: (){},
                    heartColor: MIXIN_POINT_COLOR,
                    moimName: '산업안전 산업기사 자격증 스터디',
                    tag: tagText,
                  ),
                  SizedBox(width: 12.w),
                  MoimCardSmall(
                    moimType: '스터디',
                    dDay: 7,
                    categoryImage: 'assets/images/category_images/music.png',
                    backgroundImage: 'assets/images/complete_make_moim.png',
                    categoryName: '음악',
                    memberGender: 2,
                    totalMember: 6,
                    currentMember: 1,
                    onPressed: () {},
                    iconOnPressed: (){},
                    heartColor: MIXIN_POINT_COLOR,
                    moimName: '필름감아',
                    tag: tagText,
                  ),
                  SizedBox(width: 12.w),
                  MoimCardSmall(
                    moimType: '프로젝트',
                    dDay: 14,
                    categoryImage: 'assets/images/category_images/IT.png',
                    backgroundImage: 'assets/images/complete_make_moim.png',
                    categoryName: 'IT/개발',
                    memberGender: 0,
                    totalMember: 6,
                    currentMember: 1,
                    onPressed: () {},
                    iconOnPressed: (){},

                    heartColor: MIXIN_POINT_COLOR,
                    moimName: '플러터 개발자 구합니다.',
                    tag: tagText,
                  ),
                  SizedBox(width: 12.w),
                  MoimCardSmall(
                    moimType: '스터디',
                    dDay: 7,
                    categoryImage: 'assets/images/category_images/music.png',
                    backgroundImage: 'assets/images/complete_make_moim.png',
                    categoryName: '음악',
                    memberGender: 1,
                    totalMember: 6,
                    currentMember: 1,
                    onPressed: () {},
                    iconOnPressed: (){},
                    heartColor: MIXIN_POINT_COLOR,
                    moimName: '필름감아',
                    tag: tagText,
                  ),
                  SizedBox(width: 12.w),
                  MoimCardSmall(
                    moimType: '스터디',
                    dDay: 7,
                    categoryImage: 'assets/images/category_images/music.png',
                    backgroundImage: 'assets/images/complete_make_moim.png',
                    categoryName: '음악',
                    memberGender: 1,
                    totalMember: 6,
                    currentMember: 1,
                    onPressed: () {},
                    iconOnPressed: (){},
                    heartColor: MIXIN_POINT_COLOR,
                    moimName: '필름감아',
                    tag: tagText,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 8,
            color: MIXIN_BLACK_5,
          ),
          // 활동 추천
          Padding(
            padding:
                EdgeInsets.only(left: 24.w, top: 24.h, right: 0, bottom: 32.h),
            child: Column(
              children: [
                // 타이틀
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이 활동(추천)은 어떠세요?',
                      style: TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.0.w),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'All >',
                          style: TextStyle(
                              color: MIXIN_BLACK_4,
                              fontSize: 14.sp,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                // 콘텐츠
                Column(
                  children: [
                    // 콘텐츠 1
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: MIXIN_BLACK_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '안양시청',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: MIXIN_POINT_COLOR),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '안양시 캐릭터 콘테스트',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: MIXIN_BLACK_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: MIXIN_BLACK_5,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontFamily: 'SUIT',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: MIXIN_BLACK_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[0] ? Colors.white : MIXIN_BLACK_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(width: 2.w, color: MIXIN_BLACK_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[0] = !_selectScript[0];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[0]
                                ? MIXIN_POINT_COLOR
                                : MIXIN_BLACK_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // 콘텐츠 2
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: MIXIN_BLACK_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '미분당',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: MIXIN_POINT_COLOR),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '미분당 로고 리뉴얼',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: MIXIN_BLACK_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MIXIN_BLACK_5,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontFamily: 'SUIT',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: MIXIN_BLACK_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[1] ? Colors.white : MIXIN_BLACK_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(width: 2.w, color: MIXIN_BLACK_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[1] = !_selectScript[1];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[1]
                                ? MIXIN_POINT_COLOR
                                : MIXIN_BLACK_4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // 콘텐츠 3
                    Row(
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: MIXIN_BLACK_5,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '이마트24',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp,
                                  color: MIXIN_POINT_COLOR),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '신메뉴 네이밍 콘테스트',
                              style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: MIXIN_BLACK_1),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 180.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MIXIN_BLACK_5,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                '2023.12.01 ~ 2023.12.31',
                                style: TextStyle(
                                    fontFamily: 'SUIT',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: MIXIN_BLACK_2),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectScript[2] ? Colors.white : MIXIN_BLACK_5,
                            fixedSize: Size(16.w, 16.h),
                            shape: const CircleBorder(),
                            side: BorderSide(width: 2.w, color: MIXIN_BLACK_5),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectScript[2] = !_selectScript[2];
                            });
                          },
                          child: Image.asset(
                            'assets/images/icons/subscribe_icon.png',
                            width: 14.w,
                            height: 20.h,
                            color: _selectScript[2]
                                ? MIXIN_POINT_COLOR
                                : MIXIN_BLACK_4,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 8,
            color: MIXIN_BLACK_5,
          ),
        ],
      ),
    );
  }
}
