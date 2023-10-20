import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/colors.dart';

//
class Numbs extends StatelessWidget {
  int numbs;

  Numbs({super.key, required this.numbs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          numbs.toString(),
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            color: MIXIN_BLACK_1,
          ),
        ),
      ),
    );
  }
}
