import 'package:flutter/material.dart';
import 'package:robowars/screens/robowars_about_screen.dart';
import 'package:robowars/screens/viewmorescreen.dart';
import 'package:robowars/database/teamData.dart';
import 'package:robowars/constants/constants.dart';
import 'package:robowars/database/showmatch.dart';

import '../database/socialbutton.dart';

class Homescreen extends StatefulWidget {
  static String id = "home_screen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  int _showMatch = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Keep labels visible
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xffBC4E24), // Color for selected item
        unselectedItemColor: Colors.white, // Color for unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle icon tap
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Updates',
          ),
        ],
        backgroundColor: Colors.black, // Set the background color
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Automatonist!',
                        style: TextStyle(
                            color: Color(0xffBC4E24),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ), //Welcome,Robowars
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Robowars 2024',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RobowarsAboutScreen.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffBC4E24),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/robowars_sponsors.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //Sponsors
                ShowMatch(
                  ShowMatchInfo: 'Live Now',
                  ShowMatchNo: TeamMatchDetails[_showMatch].MatchNo,
                  ShowMatchPhotoOne:
                      TeamMatchDetails[_showMatch].imageLocation1,
                  ShowMatchPhotoTwo:
                      TeamMatchDetails[_showMatch].imageLocation2,
                  ShowMatchIcon: kLiveNowIcon,
                ), //Live Now
                ShowMatch(
                  ShowMatchInfo: 'Upcoming',
                  ShowMatchNo: TeamMatchDetails[_showMatch + 1].MatchNo,
                  ShowMatchPhotoOne:
                      TeamMatchDetails[_showMatch + 1].imageLocation1,
                  ShowMatchPhotoTwo:
                      TeamMatchDetails[_showMatch + 1].imageLocation2,
                  ShowMatchIcon: null,
                ), //Live Now
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Teams',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2, // Adjust the count as per your need
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount:
                            teamdata.length, // Replace with actual item count
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(color: Color(0xffBC4E24),width: 2)
                                  ),
                                  // shape: Border.all(width: 2,color: Color(0xffBC4E24),),
                                  backgroundColor: Colors.black,
                                  title: Text(
                                    '${teamdata[index].name}',
                                    style: TextStyle(color: Color(0xffBC4E24),fontWeight: FontWeight.bold,fontSize: 30.0),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image(image: AssetImage('${teamdata[index].imageLocation}'),),
                                      Text(
                                        '${teamdata[index].about}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Close',
                                          style: TextStyle(
                                              color: Color(0xffBC4E24),fontSize: 18.0,fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0x00),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Color(0xffBC4E24), width: 3)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text('${teamdata[index].name}',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white)),
                                  ),
                                  Expanded(
                                      child: Image(
                                    image: AssetImage(
                                        '${teamdata[index].imageLocation}'),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ), //Teams
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Photo Gallery',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            120, // Set the height for the horizontal scroll area
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(6, (index) {
                              if (index == 5) {
                                // "View More" button at the last position
                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to another page when "View More" is tapped
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewMoreScreen()),
                                    );
                                  },
                                  child: Container(
                                    width: 120, // Set width for each grid item
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.remove_red_eye,
                                              color: Colors.white),
                                          SizedBox(height: 8),
                                          Text('View More',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // Other photo items
                                return Container(
                                  width: 120, // Set width for each grid item
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child:
                                        Icon(Icons.photo, color: Colors.white),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //Photo
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social Media',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialButton(),
                            SocialButton(),
                            SocialButton(),
                            SocialButton(),
                            SocialButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ), //Social Media
              ],
            ),
          ),
        ),
      ),
    );
  }
}
