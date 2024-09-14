import 'package:flutter/material.dart';
import 'package:robowars3/screens/homescreen.dart';

import 'screens/robosoccer.dart';
import 'screens/robowars_about_page.dart';
import 'screens/schedule_page.dart';
import 'screens/splash_screen.dart';
import 'screens/teams_screen.dart';
import 'screens/update_screen.dart';
import 'screens/viewmorescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Homescreen.id: (context) => Homescreen(),
        RobowarsAboutPage.id: (context) => RobowarsAboutPage(),
        ViewMoreScreen.id: (context) => ViewMoreScreen(),
        UpdatesScreen.id: (context) => UpdatesScreen(),
        TeamsScreen.id: (context) => TeamsScreen(),
        MatchScheduleScreen.id: (context) => MatchScheduleScreen(),
        Robosoccer.id: (context) => Robosoccer(),
      },
    );
  }
}
