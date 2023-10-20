import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/screens/moim/moim_screens/moim_noticeboard/moim_noticeboard_post_detail.dart';

import '../../../../components/profile_image.dart';
import '../../../../layout/appbar_layout.dart';

class MoimNoticeboardMainScreen extends StatelessWidget {
  MoimNoticeboardMainScreen({super.key});

  final List<String> name = ['먼지이잉', '현우우우우', '다비디이이인', '지워너너넌'];

  final List dummyNotice = [
    '18',
    '졸전 인스타 아카이빙 투표관련 공지',
    '2023년 10월 1일',
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
    ],
    [
      '구로구로',
      '2023년 9월 28일',
      '구독자 수 2120만명을 보유한 유튜브 채널이 저출산 위기를 겪는 한국을 조명하면서 전 세계 누리꾼들의 관심을 끌고 있다.'
          '지난 4일 유튜브 채널 \'쿠르츠게작트\'은 \'한국은 왜 망해가나\'라는 제목의 영상을 올렸다. 해당 영상의 섬네일에는 흘러내리는 태극기의 이미지가 담겼다. 해당 영상은 이날 기준 이틀 만에 조회수 266만회를 돌파했다.'
          '쿠르츠게작트는 지난해 한국의 합계출산율(여성 1명이 평생 낳을 것으로 예상되는 평균 출생아 수)이 0.78명을 기록한 사실을 전하며 "세계에서 가장 낮은 수치"라고 말했다.'
    ],
    [
      '신도림신도리임',
      '2023년 9월 14일',
      '앞서 지난해에는 우리은행 횡령사건으로 파장이 일었다. 금융감독원 검사결과 우리은행 본점 기업개선부 직원이 2012년 6월~2020년 6월 8년 간 8회에 걸쳐 총 697억3000만원을 횡령한 것으로 확인됐다.'

      '또 올해 8월에는 대구은행 일부 지점 직원들이 평가 실적을 올리기 위해 지난해 1000여건이 넘는 고객 문서를 위조해 증권 계좌를 개설한 것으로 알려졌다.'

      'KB국민은행에서는 증권대행업무 직원들이 상장법인의 무상증자 업무를 처리하는 과정에서 알게 된 미공개중요정보를 이용해 본인이 직접 주식거래를 하거나, 해당 정보를 타 부서 직원 및 가족, 지인 등에 전달해 매매에 이용한 사실이 적발됐다.'
          '출처 : 디지털투데이 (DigitalToday)(http://www.digitaltoday.co.kr)'
    ],
    [
      '이게닉네임입니다',
      '2023년 10월 1일',
      '경찰은 이번 압수수색을 통해 아파트 철근 누락 등 부실시공 의혹 전반을 수사할 방침이다.'
          '지난 4월29일 인천 검단아파트 주차장 지하 1층과 2층의 상부 슬래브가 붕괴되는 사고가 발생했다. 시공사는 GS건설, 발주사는 LH였다.'
          '사고 건설사고조사위원회에 따르면 전단보강근(철근)이 제대로 시공되지 않은 점이 사고의 직접적인 원인으로 지목된다.'
          '조사에 따르면 기둥과 슬래브(지붕층)를 연결해 강도를 높이는 역할을 하는 전단보강근은 구조설계 상 모든 기둥(32개소)에 필요했으나 설계에서 15개소가 빠졌고, 시공 단계에서도 4개소가 누락됐다. 총 32개소 중 제대로 시공된 건 13개소에 불과했다.'
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppbarIconTextLayout(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: '필름감아',
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 18.h),
                          child: GestureDetector(
                            onTap: () {
                              print('나의 이웃 설정');
                            },
                            child: Image.asset(
                              'assets/images/icons/plus.png',
                              width: 26.w,
                              height: 26.h,
                              color: MIXIN_BLACK_1,
                            ),
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Padding(
                          padding: EdgeInsets.only(top: 18.h),
                          child: GestureDetector(
                            onTap: () {
                              print('나의 이웃 설정');
                            },
                            child: Image.asset(
                              'assets/images/more_vert.png',
                              width: 26.w,
                              height: 26.h,
                              color: MIXIN_BLACK_1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                    Container(
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
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MoimNoticeboardPostDetail(postInfo: dummyData[index])),
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
      ),
    );
  }
}
