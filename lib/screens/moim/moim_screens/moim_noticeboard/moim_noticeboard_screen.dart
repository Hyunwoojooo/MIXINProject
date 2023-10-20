import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_main_screen.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_notice_detail.dart';

import '../../../../components/profile_image.dart';
import '../../../../const/colors.dart';
import 'moim_noticeboard_post_detail.dart';

class MoimNoticeboardScreen extends StatefulWidget {
  const MoimNoticeboardScreen({Key? key}) : super(key: key);

  @override
  State<MoimNoticeboardScreen> createState() => _MoimNoticeboardScreenState();
}

class _MoimNoticeboardScreenState extends State<MoimNoticeboardScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  scrollListener() async {
    // print('offset = ${_scrollController.offset}');

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('스크롤이 맨 바닥에 위치해 있습니다');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MoimNoticeboardMainScreen()),
      );
    } else if (_scrollController.offset ==
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('스크롤이 맨 위에 위치해 있습니다');
    }
  }

  final List<String> name = ['먼지이잉', '현우우우우', '다비디이이인', '지워너너넌'];
  final List<String> ttext = [
    '오픈데이터 항목인데, 여기 들어가면 다전공 학생들의 통계랑 졸업자수, 개설된 강의들이 어떤 교재 쓰는지 다나와!!! 대박인데? ...더보기',
    '오픈데이터 항목인데, 여기 들어가면 다전공 학생들의 통계랑 졸업자수, 개설된 강의들이 어떤 교재 쓰는지 다나와!!! 대박인데? ...더보기',
    '오픈데이터 항목인데, 여기 들어가면 다전공 학생들의 통계랑 졸업자수, 개설된 강의들이 어떤 교재 쓰는지 다나와!!! 대박인데? ...더보기',
    '오픈데이터 항목인데, 여기 들어가면 다전공 학생들의 통계랑 졸업자수, 개설된 강의들이 어떤 교재 쓰는지 다나와!!! 대박인데? ...더보기',
  ];

  final List dummyNotice = [
    '18',
    '졸전 인스타 아카이빙 투표관련 공지',
    '2023년 10월 1일',
    '‼️‼️‼️‼️중요공지‼️‼️‼️‼️'
        '커밤이 열리기 위한 행정절차의 일환으로 학우 여러분이 꼭!!!해주셔야 하는 일이 있습니다!!!!!'
        '커밤에 와주시는 ⚠️모든⚠️학우분들이 반드시! 모두! 위인전 홈페이지에서 커밤을 신청해주셔야 한다고 합니다‼️ 아래 링크를 통해 위인전에 접속하거나, 또는 아래 ‘위인전 직접 검색’을 참조하여 신청해주시면 됩니다! 로그인해서 신청하기 버튼만 눌러주시면 되니 제발제발 해주세요!!!!!🥺🙏🙏🙏'
        '위인전 직접검색 :'
        '위인전 로그인 > 학습관리(상단) > 비교과관리(좌측메뉴) >단과대비교과 > ‘커디의 밤’ 검색 > 1,2,3차 확인 후 신청',
    '먼지이이잉',
  ];

  final List dummyData = [
    [
      '먼지이잉잉',
      '8분',
      '오픈데이터 항목인데, 여기 들어가면 다전공 학생들의 통계랑 졸업자수, 개설된 강의들이 어떤 교재 쓰는지 다나와!!! 대박인데? ',
    ],
    [
      '하하오오',
      '2023년 10월 4일',
      '6일(현지 시간) 미국 뉴욕증시. 장 초반 공포가 엄습했다. 고용지표는 예상보다 훨씬 견조했다. 곧바로 국채금리가 뛰었다. 장 초반 뉴욕증시 3대 지수는 1% 안팎 하락했다.'
          '떨어지는 칼날, 지푸라기 하나라도 잡고 버텨보려는 심리 때문일까. 고용지표 중 임금 상승률이 예상보다 둔화됐다는 명분 하나를 찾아냈다. 국채금리가 장이 진행되면서 오름폭이 약간 완만해졌다. 이에 미국 뉴욕증시 3대 지수가 모두 올랐다. 결국 1% 안팎 상승 마감했다. 하루 사이 2~3% 롤러코스터를 탄 것이다.'
    ],
    [
      '이게닉네임입니다',
      '2023년 10월 1일',
      '경찰은 이번 압수수색을 통해 아파트 철근 누락 등 부실시공 의혹 전반을 수사할 방침이다.'
          '지난 4월29일 인천 검단아파트 주차장 지하 1층과 2층의 상부 슬래브가 붕괴되는 사고가 발생했다. 시공사는 GS건설, 발주사는 LH였다.'
          '사고 건설사고조사위원회에 따르면 전단보강근(철근)이 제대로 시공되지 않은 점이 사고의 직접적인 원인으로 지목된다.'
          '조사에 따르면 기둥과 슬래브(지붕층)를 연결해 강도를 높이는 역할을 하는 전단보강근은 구조설계 상 모든 기둥(32개소)에 필요했으나 설계에서 15개소가 빠졌고, 시공 단계에서도 4개소가 누락됐다. 총 32개소 중 제대로 시공된 건 13개소에 불과했다.'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/bell.png',
                            width: 26.w,
                            height: 26.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '공지사항',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: MIXIN_BLACK_2,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20.w),
                            Text(
                              'All',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: MIXIN_BLACK_4,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 14.w,
                              color: MIXIN_BLACK_4,
                            ),
                          ],
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 18.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MoimNoticeboardNoticeDetail(
                                postInfo: dummyNotice)),
                      );
                    },
                    child: Container(
                      height: 134.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: MIXIN_BLACK_5),
                      ),
                      padding: EdgeInsets.only(left: 20.w, top: 21.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              width: 45.w,
                              height: 20.h,
                              padding: EdgeInsets.only(left: 2.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF3D77DB).withOpacity(0.3),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.h,
                                    padding: EdgeInsets.all(3.h),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF3D77DB),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/icons/check_icon.png',
                                      fit: BoxFit.contain,
                                      height: 8.h,
                                      width: 11.w,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    dummyNotice[0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: const Color(0xFF3D77DB)),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 21.h),
                          Text(
                            dummyNotice[1],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: MIXIN_BLACK_2,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                dummyNotice[2],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: MIXIN_BLACK_4,
                                ),
                              ),
                              SizedBox(width: 13.w),
                              Text(
                                '미확인',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: MIXIN_POINT_COLOR,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6.w,
              color: MIXIN_BLACK_5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/notice_board.png',
                        height: 26.h,
                        width: 26.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '게시판',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: MIXIN_BLACK_2,
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dummyData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoimNoticeboardPostDetail(
                                          postInfo: dummyData[index])),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ProfileImage36(),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dummyData[index][0],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: MIXIN_BLACK_1,
                                          ),
                                        ),
                                        Text(
                                          dummyData[index][1],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp,
                                            color: MIXIN_BLACK_4,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                // 텍스트
                                Padding(
                                  padding: EdgeInsets.only(left: 48.w),
                                  child: Text(
                                    dummyData[index][2],
                                    style: TextStyle(
                                      fontFamily: 'SUIT',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: MIXIN_BLACK_2,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Divider(
                                  thickness: 1.w,
                                  color: MIXIN_BLACK_5,
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
