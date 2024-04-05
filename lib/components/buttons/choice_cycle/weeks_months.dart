import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';

//
class WeeksMonths extends StatelessWidget {
  final bool isItAm;

  const WeeksMonths({super.key, required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          isItAm == true ? '매주' : '매달',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            color: B_2,
          ),
        ),
      ),
    );
  }
}
