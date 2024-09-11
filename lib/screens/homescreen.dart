import 'package:flutter/material.dart';
import 'package:robowars3/screens/Robosoccer.dart';
import 'package:robowars3/screens/robowars_about_page.dart';
import 'package:robowars3/screens/schedule_page.dart';
import 'package:robowars3/screens/teams_screen.dart';
import 'package:robowars3/screens/update_screen.dart';
import 'package:robowars3/screens/viewmorescreen.dart';
import 'package:robowars3/constants/constants.dart';
import 'package:robowars3/database/showmatch.dart';
import '../database/eventcard.dart';
import '../database/socialbutton.dart';
import 'package:carousel_slider/carousel_slider.dart';


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
    if (_selectedIndex == 0) {
      Navigator.popAndPushNamed(context, Homescreen.id);
    }
    if (_selectedIndex == 1) {
      Navigator.pushNamed(context, TeamsScreen.id);
    }
    if (_selectedIndex == 2) {
      Navigator.pushNamed(context, MatchScheduleScreen.id);
    }
    if (_selectedIndex == 3) {
      Navigator.pushNamed(context, UpdatesScreen.id);
    }
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
            icon: Icon(Icons.live_tv),
            label: 'Teams',
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
                CarouselSlider(
                  options: CarouselOptions(
                    height: 260.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 5),
                    viewportFraction: 1,
                  ),
                  items: [
                    EventCard(EventName: "Robowars",navigation: (){Navigator.pushNamed(context, RobowarsAboutPage.id);},),
                    EventCard(EventName: "Robosoccer",navigation: (){Navigator.pushNamed(context, Robosoccer.id);},),
                  ],
                ),
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
                ), //Upcoming
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
