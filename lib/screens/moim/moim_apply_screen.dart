import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/custom_textformfield.dart';
import 'package:mixin_mac_2/const/colors.dart';
import 'package:mixin_mac_2/const/data.dart';

import '../../layout/appbar_layout.dart';
import '../../layout/custom_floating_action_button.dart';
import '../main_screens/main_bottom_navigation_bar.dart';

class MoimApplyScreen extends StatefulWidget {
  int moimId;

  MoimApplyScreen({required this.moimId, super.key});

  @override
  State<MoimApplyScreen> createState() => _MoimApplyScreenState();
}

class _MoimApplyScreenState extends State<MoimApplyScreen> {
  Dio dio = Dio();
  TextEditingController moimApplyText = TextEditingController();
  final url = 'http://$ip/api/moim/join';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppbarIconTextLayout(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: '지원서 작성',
                              width: 99,
                            ),
                          ],
                        ),
                        SizedBox(height: 43.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: B_5,
                          ),
                          child: Text(
                            '안녕하세요. 이 스터디는 디자인 포트폴리오 스터디인만큼 성실하고 디자인툴 사용 가능자 위주로 받고 있습니다. 사용가능한 디자인 툴과 포부 한마디씩 작성해주세요!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: B_1,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.w,
                          color: B_5,
                          height: 32.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: CustomTextFormField(
                      width: 354.w,
                      height: 450.h,
                      hintText: '지원서를 작성해주세요.',
                      borderColor: Colors.transparent,
                      maxLines: 20,
                      controller: moimApplyText,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 70.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 0.0,
                        blurRadius: 0.0,
                      ),
                    ]),
                width: 342.w,
                height: 56.h,
                child: RawMaterialButton(
                  fillColor: P_1,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  onPressed: () async {
                    String? refreshToken =
                        await storage.read(key: REFRESH_TOKEN_KEY);

                    // final Response resp = await dio.post(
                    //     url,
                    //     options: Options(
                    //       headers: {
                    //         "Authorization": jsonDecode(refreshToken!)[0],
                    //       },
                    //     ),
                    //     data: {
                    //       'moimId': widget.moimId,
                    //       'applyText': moimApplyText.text,
                    //     });
                    // print(resp);
                    _showDialog(context, () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MainBottomNavigationBar()),
                      );
                    });
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, void Function() onPressed) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            content: Text(
              '가입이 완료되었습니다.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: B_1,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  backgroundColor: P_1,
                ),
                  onPressed: onPressed,
                  child: Text(
                    '예',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: WHITE,
                    ),
                  )),
            ],
          );
        });
  }
}
