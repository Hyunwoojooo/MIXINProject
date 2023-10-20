import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../const/colors.dart';

class ProfileImage60 extends StatelessWidget {
  const ProfileImage60({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset('assets/images/default_profile_image.png', width: 60.w, height: 60.h,),
        SizedBox(
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
                        MIXIN_,
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

class ProfileImage36 extends StatelessWidget {
  const ProfileImage36({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset('assets/images/default_profile_image.png', width: 36.w, height: 36.h,),
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
                        MIXIN_,
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
  const ProfileImage48({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset('assets/images/default_profile_image.png', width: 36.w, height: 36.h,),
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
                        MIXIN_,
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
