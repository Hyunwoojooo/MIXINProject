import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime? today;
  DateTime? previousDate;

  @override
  void initState() {
    today = DateTime.now();
    previousDate = today?.subtract(const Duration(days: 1));
    super.initState();
  }


  void _saveData(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 405.h,
      child: TableCalendar(
        locale: 'ko_KR',
        firstDay: DateTime.utc(2021, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: focusedDay,
        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay.isBefore(today!)) {
            // 선택한 날짜가 오늘보다 이전인 경우 처리
            return;
          }
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
            print(
                'this.selectedDay.toString(): ${this.selectedDay.toString()}');
            print('this.focusedDay.toString(): ${this.focusedDay.toString()}');
            print('today: $today');
            print(previousDate.toString());
            _saveData('regularMoimDate', selectedDay.toString());
          });
        },
        selectedDayPredicate: (DateTime day) {
          return isSameDay(selectedDay, day);
        },
        daysOfWeekHeight: 48.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            color: MIXIN_BLACK_1,
          ),
          weekendStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            color: MIXIN_BLACK_1,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontFamily: 'SUIT',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
          headerPadding:
              EdgeInsets.only(bottom: 15.h, top: 25.h, left: 10.w, right: 10.w),
        ),
        calendarStyle: CalendarStyle(
          tablePadding: EdgeInsets.symmetric(horizontal: 20.w),
          todayDecoration: const BoxDecoration(
            color: MIXIN_,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: MIXIN_POINT_COLOR,
          ),
          selectedDecoration: BoxDecoration(
            color: MIXIN_POINT_COLOR,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: MIXIN_,
          ),
          defaultTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: MIXIN_BLACK_1,
          ),
          weekendTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: MIXIN_BLACK_1,
          ),
          rangeEndTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Colors.red,
          ),
          outsideTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: MIXIN_BLACK_4,
          ),
        ),
      ),
    );
  }
}
