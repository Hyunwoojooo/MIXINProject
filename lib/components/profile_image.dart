import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../const/colors.dart';
import '../const/data.dart';

class ProfileImage60 extends StatelessWidget {
  final String profilePicture;

  const ProfileImage60({required this.profilePicture, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65.r),
            child: Image.network(
              '$imageUrl$profilePicture',
              width: 59.w,
              height: 59.h,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 60.h,
            width: 60.w,
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
                    thickness: 4,
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
                          P_3,
                          Color(0xFF51B49F),
                        ],
                        stops: <double>[
                          0.25,
                          0.75,
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileImage30 extends StatelessWidget {
  final String profilePicture;

  const ProfileImage30({required this.profilePicture, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65.r),
            // child: Image.network(
            //   '$imageUrl$profilePicture',
            //   width: 29.w,
            //   height: 29.h,
            // ),
            child: Image.asset(
              'assets/images/icons/person.png',
              width: 29.w,
              height: 29.h,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
          width: 30.w,
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
                        P_3,
                        Color(0xFF51B49F),
                      ],
                      stops: <double>[
                        0.25,
                        0.75,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
class NewProfileImage30 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65.r),
            // child: Image.network(
            //   '$imageUrl$profilePicture',
            //   width: 29.w,
            //   height: 29.h,
            // ),
            child: Image.asset(
              'assets/images/icons/person.png',
              width: 29.w,
              height: 29.h,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
          width: 30.w,
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
                        P_3,
                        Color(0xFF51B49F),
                      ],
                      stops: <double>[
                        0.25,
                        0.75,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileImage48 extends StatelessWidget {
  final String profilePicture;

  const ProfileImage48({required this.profilePicture, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(65.r),
              child: Image.network(
                '$imageUrl$profilePicture',
                width: 64.w,
                height: 64.h,
              )),
        ),
        Center(
          child: SizedBox(
            height: 65.h,
            width: 65.w,
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
                          P_3,
                          Color(0xFF51B49F),
                        ],
                        stops: <double>[
                          0.25,
                          0.75,
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileImage72 extends StatelessWidget {
  const ProfileImage72({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/default_profile_image.png',
          width: 36.w,
          height: 36.h,
        ),
        SizedBox(
          height: 36.h,
          width: 36.w,
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
                        P_3,
                        Color(0xFF51B49F),
                      ],
                      stops: <double>[
                        0.25,
                        0.75,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
