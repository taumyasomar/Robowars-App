import 'package:flutter/material.dart';
import 'package:robowars/screens/homescreen.dart';
import 'screens/robowars_about_screen.dart';
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
      initialRoute: Homescreen.id,

      routes: {
        Homescreen.id: (context)=>Homescreen(),
        RobowarsAboutScreen.id: (context) => RobowarsAboutScreen(),
        ViewMoreScreen.id : (context) => ViewMoreScreen(),
      },
    );
  }
}