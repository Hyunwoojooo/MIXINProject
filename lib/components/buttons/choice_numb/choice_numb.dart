import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../choice_cycle/numbs.dart';

class ChoiceNumb extends StatefulWidget {
  const ChoiceNumb({Key? key}) : super(key: key);

  @override
  State<ChoiceNumb> createState() => _ChoiceNumbState();
}

class _ChoiceNumbState extends State<ChoiceNumb> {
  late FixedExtentScrollController _controller;

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hours wheel
            Container(
              width: 270.w,
              height: 230.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.r),
                  topLeft: Radius.circular(24.r),
                ),
              ),
              child: ListWheelScrollView.useDelegate(
                controller: _controller,
                itemExtent: 70,
                perspective: 0.005,
                diameterRatio: 1000,
                squeeze: 1,
                overAndUnderCenterOpacity: 0.2,
                useMagnifier: true,
                magnification: 1.3,
                onSelectedItemChanged: (value){
                  _saveData('moimMemberLimit', value.toString());
                  print(value.toString());
                },
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildListDelegate(
                  children: List<Widget>.generate(31, (index) {
                    return Numbs(
                      numbs: index,
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
