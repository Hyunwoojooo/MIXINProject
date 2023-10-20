import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../const/colors.dart';

class FrontProfileCardScreen extends StatefulWidget {
  FrontProfileCardScreen({Key? key}) : super(key: key);

  @override
  State<FrontProfileCardScreen> createState() => _FrontProfileCardScreenState();
}

class _FrontProfileCardScreenState extends State<FrontProfileCardScreen> {
  final storage = const FlutterSecureStorage();
  String? userNickName = '';
  String? userIntroduceText = '';
  String? userDepartment = '';
  String? userName = '';
  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _bringData();
  }

  // void _bringData() async {
  //   userNickName = await storage.read(key: 'userNickName');
  //   userIntroduceText = await storage.read(key: 'userIntroduceText');
  //   // userDepartment = await storage.read(key: 'userDepartment');
  //   // userName = await storage.read(key: 'userName');
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 342.w,
          height: 425.h,
          padding: EdgeInsets.fromLTRB(31.w, 27.h, 31.w, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.0),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  width: 221.w,
                  height: 42.0.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bubble_speech.png'),
                    ),
                  ),
                  child: Text(
                    '모임에 참여할 수록 점수가 올라요!',
                    style: TextStyle(
                      fontFamily: 'SUIT',
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w500,
                      color: MIXIN_POINT_COLOR,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.h),
                Stack(
                  children: [
                    Container(
                      width: 90.w,
                      height: 90.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3.0),
                          ]),
                    ),
                    SizedBox(
                      height: 90.h,
                      width: 90.w,
                      child: SfRadialGauge(
                        animationDuration: 2000,
                        axes: <RadialAxis>[
                          RadialAxis(
                            startAngle: 90,
                            endAngle: 90,
                            radiusFactor: 1,
                            isInversed: true,
                            canScaleToFit: true,
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: const AxisLineStyle(
                              thickness: 5,
                              cornerStyle: CornerStyle.bothFlat,
                              color: Colors.white,
                            ),
                            pointers: const <GaugePointer>[
                              RangePointer(
                                value: 50,
                                width: 0.11,
                                sizeUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.bothCurve,
                                gradient: SweepGradient(
                                  colors: <Color>[
                                    MIXIN_,
                                    Color(0xFF51B49F),
                                  ],
                                  stops: <double>[
                                    0.25,
                                    0.75,
                                  ],
                                ),
                              ),
                              MarkerPointer(
                                value: 50,
                                markerHeight: 15,
                                markerWidth: 15,
                                markerType: MarkerType.circle,
                                color: Color(0xFF32A086),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0.h),
                Text(
                  userNickName!.isEmpty ? userName! : userNickName!,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0.sp,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  userDepartment!,
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp,
                  ),
                ),
                SizedBox(height: 32.0.h),
                Container(
                  height: 138.h,
                  width: 280.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0.r),
                    color: MIXIN_BLACK_5,
                  ),
                  child: Text(
                    userIntroduceText ?? ' ',
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: visible == true ? false : true,
          child: Container(
            width: 342.w,
            height: 425.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: TextButton(
              onPressed: () async {
                visible = true;
                userNickName = await storage.read(key: 'userNickName');
                userIntroduceText =
                    await storage.read(key: 'userIntroduceText');
                userName = await storage.read(key: 'userName');
                userDepartment = await storage.read(key: 'userDepartment');
                setState(() {});
                print(userNickName);
                print(userIntroduceText);
                print(userName);
                print(userDepartment);
              },
              child: Text(
                'CLICK!',
                style: TextStyle(
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w600,
                  color: WHITE,
                  fontSize: 60.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
