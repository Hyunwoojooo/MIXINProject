import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../const/colors.dart';
import '../make_moim_screens/make_moim_1.dart';
import 'main_chatting_screens/main_chatting_screen.dart';
import 'main_community_screens/main_community_screen.dart';
import 'main_moim_screens/main_moim_screen.dart';
import 'main_home_screens/main_home_screen.dart';
import 'main_profile_screens/main_profile_screen_1.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _bNBSelectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _bNBSelectedIndex = index;
    });
  }

  final List<Widget> _bNBWidgetOptions = [
    const MainHomeScreen(),
    const MainMoimScreen(),
    const MainCommunityScreen(),
    const MainChattingScreen(),
    const MainProfileScreen1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _bNBWidgetOptions.elementAt(_bNBSelectedIndex),
      ),
      floatingActionButton: floatingButtons(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          currentIndex: _bNBSelectedIndex,
          iconSize: 26.w,
          selectedItemColor: MIXIN_BLACK_1,
          unselectedItemColor: MIXIN_BLACK_4,
          selectedFontSize: 11.sp,
          unselectedFontSize: 11.sp,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            color: MIXIN_BLACK_4,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            color: MIXIN_BLACK_4,
          ),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_navigation_bar_icons/bottomNavigationBar_home.png',
                width: 26.w,
                height: 26.h,
                color: _bNBSelectedIndex == 0 ? MIXIN_BLACK_1 : MIXIN_BLACK_4,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_navigation_bar_icons/bottomNavigationBar_moim.png',
                width: 26.w,
                height: 26.h,
                color: _bNBSelectedIndex == 1 ? MIXIN_BLACK_1 : MIXIN_BLACK_4,
              ),
              label: '모임',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_navigation_bar_icons/bottomNavigationBar_chatting.png',
                width: 26.w,
                height: 26.h,
                color: _bNBSelectedIndex == 3 ? MIXIN_BLACK_1 : MIXIN_BLACK_4,
              ),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_navigation_bar_icons/bottomNavigationBar_profile.png',
                width: 26.w,
                height: 26.h,
                color: _bNBSelectedIndex == 4 ? MIXIN_BLACK_1 : MIXIN_BLACK_4,
              ),
              label: '프로필',
            ),
          ],
        ),
      ),
    );
  }

  Widget? floatingButtons() {
    return SpeedDial(
      overlayColor: const Color(0xFF000000).withOpacity(0.64),
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: MIXIN_POINT_COLOR,
      spaceBetweenChildren: 10.h,
      spacing: 12.h,
      elevation: 0.0,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: '모임 만들기',
          labelStyle: TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: WHITE,
          ),
          backgroundColor: MIXIN_POINT_COLOR,
          labelBackgroundColor: const Color(0xFF000000).withOpacity(0.001),
          labelShadow: [
            const BoxShadow(
              color: Colors.transparent,
            )
          ],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MakeMoim1()),
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.accessibility_new_rounded,
            color: Colors.white,
          ),
          elevation: 0.0,
          label: '모임 가입',
          labelStyle: TextStyle(
            fontFamily: 'SUIT',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: WHITE,
          ),
          backgroundColor: MIXIN_POINT_COLOR,
          labelBackgroundColor: const Color(0xFF000000).withOpacity(0.001),
          labelShadow: [
            const BoxShadow(
              color: Colors.transparent,
            )
          ],
          onTap: () {},
        ),
      ],
    );
  }
}
