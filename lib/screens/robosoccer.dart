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
              'Robosoccers',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
          backgroundColor: GAppColors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 10, right: 20, left: 20, bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 2, color: GAppColors.black)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AnotherCarousel(
                        images: [
                          Image.asset(
                            'assets/robosoccergif.gif',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/',
                            fit: BoxFit.fill,
                          ),
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
                SizedBox(height: 40),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: GAppColors.orange, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15),
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teams',
                        style: TextStyle(
                            color: GAppColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 15,
                        children: teams.map((names) {
                          return Chip(
                            label: Text(
                              names,
                              style: TextStyle(color: GAppColors.white),
                            ),
                            backgroundColor: GAppColors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(35)),
                            side: BorderSide(
                                color: GAppColors.orange, width: 2),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  ' Score Board',
                  style: TextStyle(
                      color: GAppColors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),

                SizedBox(height: 10),

                // Score card list
                Container(
                  height: 200,
                  child: ListView(
                    children: [
                      matchCard(
                          team1: 'Team_1',
                          team2: 'Team_2',
                          score1: 2,
                          score2: 1,
                        team1image:'assets/sample 1.jpg',
                        team2image: 'assets/sample 2.jpg',
                        
                        
                      
                      
                      ),
                      
                      



                      SizedBox(height: 20,),
                      /*matchCard(
                          team1: 'Team_3',
                          team2: 'Team_4',
                          score1: 1,
                          score2: 1),
                      SizedBox(height: 20,),
                      matchCard(
                          team1: 'Team_5',
                          team2: 'Team_6',
                          score1: 0,
                          score2: 3),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class matchCard extends StatelessWidget {
  final String team1;
  final String team2;
  final int score1;
  final int score2;
  final String team1image;
  final String team2image;


  matchCard({
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    required this.team1image,
    required this.team2image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: GAppColors.orange),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10, right: 10, bottom: 0, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: 70,
                      width: 75,
                      child: Image.asset(team1image,fit: BoxFit.cover,), //
                    ),
                    SizedBox(height: 5),
                    Text(
                      team1,
                      style: TextStyle(
                          color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '$score1',
                          style: TextStyle(
                              color: GAppColors.orange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ), // score 1
                        SizedBox(width: 20),
                        Text(
                          '-',
                          style: TextStyle(
                              color: GAppColors.orange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          '$score2',
                          style: TextStyle(
                              color: GAppColors.orange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: 70,
                      width: 75,
                      child: Image.asset(team2image,fit: BoxFit.cover,), // Image can be added here
                    ),
                    SizedBox(height: 5),
                    Text(
                      team2,
                      style: TextStyle(
                          color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 2, color: GAppColors.orange),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: 24, September 2024',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
                Text(
                  'Venue:            ',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

