import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/moim_card_format.dart';
import '../../../const/colors.dart';
import '../../moim/moim_detail_screens/moim_detail_screen.dart';

class MainMoimScreen extends StatefulWidget {
  const MainMoimScreen({Key? key}) : super(key: key);

  @override
  State<MainMoimScreen> createState() => _MainMoimScreenState();
}

class _MainMoimScreenState extends State<MainMoimScreen>
    with SingleTickerProviderStateMixin {
  List<bool> _isHeartSelect = List.filled(5, false);
  List<String> tagText = ['자격증', '산업기사', '집중'];
  List<String> selectedCategory = ['전체보기', 'IT/개발', '디자인', '문화활동', '기타'];
  bool _isThunderSelect = false;
  int selectedButtonIndex = 0;

  void onTap(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(76.h),
        child: AppBar(
          backgroundColor: WHITE,
          automaticallyImplyLeading: false,
          toolbarHeight: 110.h,
          elevation: 0.0,
          titleSpacing: 24.w,
          title: Column(
            children: [
              SizedBox(height: 25.h),
              Text(
                '모임',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                  color: MIXIN_BLACK_1,
                ),
              ),
            ],
          ),
          flexibleSpace: SizedBox(
            height: 76.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(top: 6.h),
                        icon: Image.asset(
                          'assets/images/icon_search.png',
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/icons/bell.png',
                          color: Colors.black,
                          width: 26.w,
                          height: 26.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            // scrollDirection: Axis.vertical,
            children: [
              // 카테고리
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: selectedCategory.length,
                      itemBuilder: (context, index){
                    return  Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = index;
                            });
                          },
                          child: Text(
                            selectedCategory[index],
                            style: TextStyle(
                              fontWeight: index == selectedButtonIndex ? FontWeight.w600 : FontWeight.w500,
                              fontSize: 18.sp,
                              color: index == selectedButtonIndex ? MIXIN_47 : const Color(0xFFB1B1B7),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 24.w),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 13건',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xFFB1B1B7),
                      ),
                    ),
                    Row(
                      children: [
                        // 번개만
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              _isThunderSelect = !_isThunderSelect;
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/icons/thunder_moim_icon.png',
                                width: 15.w,
                                color: _isThunderSelect ? null : MIXIN_BLACK_4,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '번개만',
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: _isThunderSelect
                                      ? MIXIN_POINT_COLOR
                                      : MIXIN_BLACK_4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        // 정렬
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                '날짜순',
                                style: TextStyle(
                                  fontFamily: 'SUIT',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: MIXIN_BLACK_3,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Image.asset(
                                'assets/images/icons/sort_icon.png',
                                width: 15.w,
                                color: MIXIN_BLACK_3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // 정규 모임 카드
              RecruitmentMoimCardBig(
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
                        builder: (context) => const MoimDetailScreen()),
                  );
                  print('1');
                },
                iconOnPressed: () {},
                heartColor: MIXIN_POINT_COLOR,
                moimName: '산업안전 산업기사 자격증 스터디',
                tag: tagText,
              ),
              // 번개 모임 카드
              MoimThunder(
                imageAsset: 'assets/images/category_images/health.png',
                categoryName: '운동',
                memberGender: 1,
                totalMember: 5,
                currentMember: 2,
                onPressed: () {},
                moimName: '풋살 6명 구합니다!',
                moimDate: '6/7 (수)',
                moimPlace: '6호관 앞 흡연부스',
              ),
              MoimThunder(
                imageAsset: 'assets/images/category_images/music.png',
                categoryName: '음악',
                memberGender: 1,
                totalMember: 5,
                currentMember: 2,
                onPressed: () {},
                moimName: '역전할맥 ',
                moimDate: '12/1 (목)',
                moimPlace: '6호관 앞 흡연부스 오세오세',
              ),
              RecruitmentMoimCardBig(
                moimType: '스터디',
                dDay: 10,
                categoryImage: 'assets/images/category_images/music.png',
                backgroundImage: 'assets/images/complete_make_moim.png',
                categoryName: '음악',
                memberGender: 0,
                totalMember: 14,
                currentMember: 4,
                onPressed: () {},
                iconOnPressed: () {},
                heartColor: MIXIN_POINT_COLOR,
                moimName: 'LP바 같이 가실분',
                tag: tagText,
              ),
              RecruitmentMoimCardBig(
                moimType: '스터디',
                dDay: 10,
                categoryImage: 'assets/images/category_images/music.png',
                backgroundImage: 'assets/images/complete_make_moim.png',
                categoryName: '음악',
                memberGender: 0,
                totalMember: 14,
                currentMember: 4,
                onPressed: () {},
                iconOnPressed: () {},
                heartColor: MIXIN_POINT_COLOR,
                moimName: 'LP바 같이 가실분',
                tag: tagText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
