import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../const/colors.dart';

class ProfileGauge extends StatelessWidget {
  const ProfileGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    Color(0xFF8DCAC2),
                    Color(0xFF51B49F),
                  ],
                  stops: <double>[
                    0.25,
                    0.75,
                  ],
                ),
              ),
              // MarkerPointer(
              //   value: 50,
              //   markerHeight: 15,
              //   markerWidth: 15,
              //   markerType: MarkerType.circle,
              //   color: Color(0xFF32A086),
              // )
            ],
          )
        ],
      ),
    );
  }
}

class SmallProfileCardGauge extends StatelessWidget {
  SmallProfileCardGauge({super.key});
  var image; // 카메라로 촬영한 이미지를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: Container(
            width: 41.w,
            height: 41.h,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: B_4, blurRadius: 1.0)],
              shape: BoxShape.circle,
              // color: Colors.transparent,
            ),
            child: ClipOval(
              child: image != null
                  ? Image.file(File(image!.path), fit: BoxFit.cover)
                  : Image.asset(
                'assets/images/default_profile.png',
                fit: BoxFit.cover,
              ),
            ), //가져온 이미지를 화면에 띄워주는 코드
          ),
        ),
        SizedBox(
          height: 41.h,
          width: 41.w,
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
                  thickness: 3,
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
                        Color(0xFF8DCAC2),
                        Color(0xFF51B49F),
                      ],
                      stops: <double>[
                        0.25,
                        0.75,
                      ],
                    ),
                  ),
                  // MarkerPointer(
                  //   value: 50,
                  //   markerHeight: 15,
                  //   markerWidth: 15,
                  //   markerType: MarkerType.circle,
                  //   color: Color(0xFF32A086),
                  // )
                ],
              )
            ],
          ),
        ),
      ],
    );

  }
}


class ProfileCardGauge extends StatelessWidget {
  ProfileCardGauge({super.key});

  var image; // 카메라로 촬영한 이미지를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: B_4, blurRadius: 1.0)],
              shape: BoxShape.circle,
              // color: Colors.transparent,
            ),
            child: ClipOval(
              child: image != null
                  ? Image.file(File(image!.path), fit: BoxFit.cover)
                  : Image.asset(
                      'assets/images/default_profile.png',
                      fit: BoxFit.cover,
                    ),
            ), //가져온 이미지를 화면에 띄워주는 코드
          ),
        ),
        SizedBox(
          height: 64.h,
          width: 64.w,
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
                  thickness: 3,
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
                        Color(0xFF8DCAC2),
                        Color(0xFF51B49F),
                      ],
                      stops: <double>[
                        0.25,
                        0.75,
                      ],
                    ),
                  ),
                  // MarkerPointer(
                  //   value: 50,
                  //   markerHeight: 15,
                  //   markerWidth: 15,
                  //   markerType: MarkerType.circle,
                  //   color: Color(0xFF32A086),
                  // )
                ],
              )
            ],
          ),
        ),
      ],
    );

    // return SizedBox(
    //   height: 65.h,
    //   width: 65.w,
    //   child: SfRadialGauge(
    //     animationDuration: 2000,
    //     axes: <RadialAxis>[
    //       RadialAxis(
    //         startAngle: 90,
    //         endAngle: 90,
    //         radiusFactor: 1,
    //         isInversed: true,
    //         canScaleToFit: true,
    //         minimum: 0,
    //         maximum: 100,
    //         showLabels: false,
    //         showTicks: false,
    //         axisLineStyle: AxisLineStyle(
    //           thickness: 4.w,
    //           cornerStyle: CornerStyle.bothFlat,
    //           color: Colors.white,
    //         ),
    //         pointers: const <GaugePointer>[
    //           RangePointer(
    //             value: 50,
    //             width: 0.11,
    //             sizeUnit: GaugeSizeUnit.factor,
    //             cornerStyle: CornerStyle.bothCurve,
    //             gradient: SweepGradient(
    //               colors: <Color>[
    //                 Color(0xFF8DCAC2),
    //                 Color(0xFF51B49F),
    //               ],
    //               stops: <double>[
    //                 0.25,
    //                 0.75,
    //               ],
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}

class Ver72ProfileGauge extends StatelessWidget {
  const Ver72ProfileGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74.h,
      width: 74.w,
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
              color: Color(0xFFE2E2E2),
            ),
            pointers: const <GaugePointer>[
              RangePointer(
                value: 50,
                width: 0.11,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
                gradient: SweepGradient(
                  colors: <Color>[
                    Color(0xFF8DCAC2),
                    Color(0xFF51B49F),
                  ],
                  stops: <double>[
                    0.25,
                    0.75,
                  ],
                ),
              ),
              // MarkerPointer(
              //   value: 50,
              //   markerHeight: 15,
              //   markerWidth: 15,
              //   markerType: MarkerType.circle,
              //   color: Color(0xFF32A086),
              // )
            ],
          )
        ],
      ),
    );
  }
}

class MiniProfileGauge extends StatelessWidget {
  const MiniProfileGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      width: 34.w,
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
              thickness: 2,
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
                    Color(0xFF8DCAC2),
                    Color(0xFF51B49F),
                  ],
                  stops: <double>[
                    0.25,
                    0.75,
                  ],
                ),
              ),
              // MarkerPointer(
              //   value: 50,
              //   markerHeight: 15,
              //   markerWidth: 15,
              //   markerType: MarkerType.circle,
              //   color: Color(0xFF32A086),
              // )
            ],
          )
        ],
      ),
    );
  }
}
