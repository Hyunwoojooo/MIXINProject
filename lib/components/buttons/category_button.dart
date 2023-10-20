import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';
import '../../layout/category_layout_round.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({Key? key}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

List<bool> categoryList = List.filled(14, false);
bool _isPressed1 = false;
bool _isPressed2 = false;
bool _isPressed3 = false;
bool _isPressed4 = false;

class _CategoryButtonState extends State<CategoryButton> {
  String _moim = "모임종류";
  final _grey = MIXIN_BLACK_5; //MIXIN_BLACK_5의 색이 잘 안보여서 임시대체

  List<String> selectCategory = [
    '카테고리',
    'assets/images/category_images/none_space.png'
  ];


  void _saveData(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  @override
  Widget build(BuildContext context) {
    Color moimcolor = _isPressed1 ? MIXIN_2 : MIXIN_BLACK_4;
    Color categorycolor = _isPressed2 ? MIXIN_2 : MIXIN_BLACK_4;

    void categoryOnpressed(int index, String text) {
      categoryList.fillRange(0, categoryList.length, false);
      categoryList[index] = true;
      _isPressed4 = !_isPressed4;
      _isPressed2 = !_isPressed2;

      print('_isPressed1 : $_isPressed1');
      print('_isPressed2 : $_isPressed2');
      print('_isPressed3 : $_isPressed3');
      print('_isPressed4 : $_isPressed4');
      print('----------------------------');
    }

    return Column(
      children: [
        SizedBox(height: 1.h),
        Row(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(18.r),
              padding: EdgeInsets.zero,
              color: _moim != '모임종류' ? MIXIN_ : MIXIN_BLACK_4,
              child: SizedBox(
                height: 36.h,
                width: 80.w,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPressed1 = !_isPressed1;
                      _isPressed2 = false;
                      _isPressed3 = false;
                    });
                    _saveData('moimType', _moim);
                    print('_isPressed1 : $_isPressed1');
                    print('_isPressed2 : $_isPressed2');
                    print('_isPressed3 : $_isPressed3');
                    print('_isPressed4 : $_isPressed4');
                    print('----------------------------');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: _moim != '모임종류' ? MIXIN_ : Colors.transparent,
                    ),
                    backgroundColor: _moim != '모임종류' ? MIXIN_ : WHITE,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    _moim,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color:
                          _moim != '모임종류' ? MIXIN_POINT_COLOR : MIXIN_BLACK_4,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(18.r),
              padding: EdgeInsets.zero,
              color: selectCategory[0] != '카테고리'
                  ? Colors.transparent
                  : MIXIN_BLACK_4,
              child: SizedBox(
                height: 36.h,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPressed1 = false;
                      _isPressed2 = !_isPressed2;
                      _isPressed4 = false;
                    });
                    _saveData('category', selectCategory[0]);
                    print('_isPressed1 : $_isPressed1');
                    print('_isPressed2 : $_isPressed2');
                    print('_isPressed3 : $_isPressed3');
                    print('_isPressed4 : $_isPressed4');
                    print('----------------------------');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor:
                        selectCategory[0] != '카테고리' ? WHITE : WHITE,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: selectCategory[0] != '카테고리'
                            ? MIXIN_BLACK_4
                            : Colors.transparent,
                        width: 1.0.w,
                      ),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (selectCategory[0] != '카테고리')
                          Image.asset(
                            selectCategory[1],
                            width: 26.w,
                            height: 26.h,
                          ),
                        if (selectCategory[0] != '카테고리') SizedBox(width: 4.w),
                        Text(
                          selectCategory[0],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: selectCategory[0] != '카테고리'
                                ? MIXIN_BLACK_2
                                : MIXIN_BLACK_4,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_isPressed1)
          Column(
            children: [
              Row(
                children: [
                  _TextButton(
                    onPressed: () {
                      setState(() {
                        _isPressed1 = false;
                        if (categoryList.contains(true)) {
                          _isPressed2 = false;
                        } else {
                          _isPressed2 = true;
                        }
                        _isPressed3 = true;
                        _moim = "동아리";
                      });
                    },
                    text: '동아리',
                  ),
                  _TextButton(
                    onPressed: () {
                      setState(() {
                        _isPressed1 = false;
                        if (categoryList.contains(true)) {
                          _isPressed2 = false;
                        } else {
                          _isPressed2 = true;
                        }
                        _isPressed3 = true;
                        _moim = "번개";
                      });
                    },
                    text: '번개',
                  ),
                  _TextButton(
                    onPressed: () {
                      setState(() {
                        _isPressed1 = false;
                        if (categoryList.contains(true)) {
                          _isPressed2 = false;
                        } else {
                          _isPressed2 = true;
                        }
                        _isPressed3 = true;
                        _moim = "스터디";
                      });
                    },
                    text: '스터디',
                  ),
                  _TextButton(
                    onPressed: () {
                      setState(() {
                        _isPressed1 = false;
                        if (categoryList.contains(true)) {
                          _isPressed2 = false;
                        } else {
                          _isPressed2 = true;
                        }
                        _isPressed3 = true;
                        _moim = "프로젝트";
                      });
                    },
                    text: '프로젝트',
                  ),
                ],
              ),
            ],
          ),
        SizedBox(height: 12.h),
        if (_isPressed2)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1열
              Row(
                children: [
                  RemakeCategoryLayout(
                    index: 0,
                    imageAsset: 'assets/images/category_images/IT.png',
                    text: 'IT/개발',
                    mainSizedBoxWidth: 105.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(0, 'IT/개발');
                        selectCategory = [
                          'IT/개발',
                          'assets/images/category_images/IT.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 1,
                    imageAsset: 'assets/images/category_images/design.png',
                    text: '디자인',
                    mainSizedBoxWidth: 99.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(1, '디자인');
                        selectCategory = [
                          '디자인',
                          'assets/images/category_images/design.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 2,
                    imageAsset: 'assets/images/category_images/culture.png',
                    text: '문화활동',
                    mainSizedBoxWidth: 111.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(2, '문화활동');
                        selectCategory = [
                          '문화활동',
                          'assets/images/category_images/culture.png'
                        ];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0.h),
              // 2열
              Row(
                children: [
                  RemakeCategoryLayout(
                    index: 3,
                    imageAsset: 'assets/images/category_images/music.png',
                    text: '음악',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(3, '음악');
                        selectCategory = [
                          '음악',
                          'assets/images/category_images/music.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 4,
                    imageAsset: 'assets/images/category_images/trip.png',
                    text: '여행',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(4, '여행');
                        selectCategory = [
                          '여행',
                          'assets/images/category_images/trip.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 5,
                    imageAsset: 'assets/images/category_images/bongsa.png',
                    text: '봉사활동',
                    mainSizedBoxWidth: 111.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(5, '봉사활동');
                        selectCategory = [
                          '봉사활동',
                          'assets/images/category_images/bongsa.png'
                        ];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0.h),
              // 3열
              Row(
                children: [
                  RemakeCategoryLayout(
                    index: 6,
                    imageAsset: 'assets/images/category_images/health.png',
                    text: '운동',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(6, '운동');
                        selectCategory = [
                          '운동',
                          'assets/images/category_images/health.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 7,
                    imageAsset: 'assets/images/category_images/animal.png',
                    text: '반려동물',
                    mainSizedBoxWidth: 111.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(7, '반려동물');
                        selectCategory = [
                          '반려동물',
                          'assets/images/category_images/animal.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 8,
                    imageAsset: 'assets/images/category_images/sagyo.png',
                    text: '사교',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(8, '사교');
                        selectCategory = [
                          '사교',
                          'assets/images/category_images/sagyo.png'
                        ];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0.h),
              // 4열
              Row(
                children: [
                  RemakeCategoryLayout(
                      index: 9,
                      imageAsset: 'assets/images/category_images/class.png',
                      text: '수업',
                      mainSizedBoxWidth: 87.w,
                      onPressed: () {
                        setState(() {
                          categoryOnpressed(9, '수업');
                          selectCategory = [
                            '수업',
                            'assets/images/category_images/class.png'
                          ];
                        });
                      }),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                      index: 10,
                      imageAsset: 'assets/images/category_images/class.png',
                      text: '외국어',
                      mainSizedBoxWidth: 99.w,
                      onPressed: () {
                        setState(() {
                          categoryOnpressed(10, '외국어');
                          selectCategory = [
                            '외국어',
                            'assets/images/category_images/class.png'
                          ];
                        });
                      }),
                  SizedBox(width: 8.0.w),
                  RemakeCategoryLayout(
                    index: 11,
                    imageAsset: 'assets/images/category_images/restuarant.png',
                    text: '맛집',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(11, '맛집');
                      });
                      selectCategory = [
                        '맛집',
                        'assets/images/category_images/restuarant.png'
                      ];
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0.h),
              // 5열
              Row(
                children: [
                  RemakeCategoryLayout(
                    index: 12,
                    imageAsset: 'assets/images/category_images/cook.png',
                    text: '요리',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(12, '요리');
                        selectCategory = [
                          '요리',
                          'assets/images/category_images/cook.png'
                        ];
                      });
                    },
                  ),
                  SizedBox(width: 12.0.w),
                  RemakeCategoryLayout(
                    index: 13,
                    imageAsset: 'assets/images/category_images/finance.png',
                    text: '금융',
                    mainSizedBoxWidth: 87.w,
                    onPressed: () {
                      setState(() {
                        categoryOnpressed(13, '금융');
                        selectCategory = [
                          '금융',
                          'assets/images/category_images/finance.png'
                        ];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Divider(
                thickness: 1,
                height: 1,
                color: MIXIN_BLACK_5,
              ),
            ],
          ),
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  _TextButton({required this.onPressed, required this.text});

  void Function() onPressed;
  String text = '';
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14.sp,
            color: MIXIN_2,
            fontWeight: FontWeight.w500,
            fontFamily: 'SUIT'),
      ),
    );
  }
}

class RemakeCategoryLayout extends StatefulWidget {
  RemakeCategoryLayout(
      {required this.index,
      required this.imageAsset,
      required this.text,
      required this.mainSizedBoxWidth,
      required this.onPressed,
      super.key});

  int index;
  String imageAsset;
  String text;
  double mainSizedBoxWidth;
  void Function() onPressed;
  @override
  State<RemakeCategoryLayout> createState() => _RemakeCategoryLayoutState();
}

class _RemakeCategoryLayoutState extends State<RemakeCategoryLayout> {
  @override
  Widget build(BuildContext context) {
    return CategoryLayoutRound(
      mainSizedBoxWidth: widget.mainSizedBoxWidth,
      borderSideColor:
          categoryList[widget.index] == true ? MIXIN_2 : MIXIN_BLACK_5,
      backgroundColor: categoryList[widget.index] == true ? MIXIN_ : WHITE,
      onPressed: widget.onPressed,
      containerColor: categoryList[widget.index] == true ? MIXIN_ : WHITE,
      imageAsset: widget.imageAsset,
      text: widget.text,
    );
  }
}
