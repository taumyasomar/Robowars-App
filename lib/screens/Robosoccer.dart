import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';


class Robosoccer extends StatefulWidget {
  static String id = "robo_soccer";
  const Robosoccer({super.key});

  @override
  State<Robosoccer> createState() => _RobosoccerState();
}

class _RobosoccerState extends State<Robosoccer> {
  final List<String> teams = ['Team_1', 'Team_2', 'Team_3', 'Team_4', 'Team_5'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: GAppColors.black,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: GAppColors.white,
                )),
            title: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Roboscoccers',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
            backgroundColor: GAppColors.black,
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2, color: GAppColors.orange)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: AnotherCarousel(
                        images: [
                          Image.asset('images/robosoccer_1.jpg',
                              fit: BoxFit.fill),
                          Image.asset('images/Robovitics.jpeg',
                              fit: BoxFit.fill)
                        ],
                        dotBgColor: Colors.transparent,
                        dotColor: GAppColors.orange,
                        indicatorBgPadding: 2.0,
                        dotSize: 4,
                        dotSpacing: 15,
                        dotIncreasedColor: GAppColors.lightorange,
                        borderRadius: true,
                        autoplay: false,
                        animationDuration: Duration(milliseconds: 1000),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: GAppColors.orange, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 194,
                        width: 2,
                        color: GAppColors.orange,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                  color: GAppColors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 120,
                              width: 269,
                              child: AutoSizeText(
                                'Get ready to be thrilled by the electrifying fusion of strategy and skill at RoboSoccer, where cutting-edge robotics meets the beautiful game! Watch in awe as bots compete in a high-octane showdown of precision and teamwork, delivering a mesmerizing display of tech-powered soccer like never before.',
                                style: TextStyle(color: Colors.white),
                                maxLines: 8,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TEAMS',
                        style: TextStyle(
                          color: GAppColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 8,
                        children: teams.map((names) {
                          return Chip(
                            label: Text(
                              names,
                              style: TextStyle(color: GAppColors.white),
                            ),
                            backgroundColor: GAppColors.lightorange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            side:
                                BorderSide(color: GAppColors.orange, width: 2),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
