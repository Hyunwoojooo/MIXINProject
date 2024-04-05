import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mixin_mac_2/screens/login_screen.dart';
import 'package:mixin_mac_2/screens/main_screens/main_bottom_navigation_bar.dart';
import 'package:mixin_mac_2/screens/make_profile_card_screens/make_category_screen.dart';

Future<void> main() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Mixin());
}

class Mixin extends StatelessWidget {
  const Mixin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'SUIT',
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MakeCategoryScreen(),
          },
        );
      },
    );
  }
}
