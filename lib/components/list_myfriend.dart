import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mixin_mac_2/components/profile_gauge.dart';
import 'package:mixin_mac_2/const/colors.dart';

class ListMyFriend extends StatelessWidget {
  var image;
  String name;
  String schoolID;
  String department;
  ListMyFriend(this.image, {required this.name, required this. schoolID, required this.department, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Row(
        children: [
          SmallProfileCardGauge(),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MIXIN_BLACK_1,
                ),
              ),
              Text(
                '$department / $schoolID',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: MIXIN_POINT_COLOR,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
