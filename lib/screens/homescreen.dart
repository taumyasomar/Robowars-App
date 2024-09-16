import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:robowars3/constants/constants.dart';
import 'package:robowars3/database/showmatch.dart';
import 'package:robowars3/screens/robosoccer.dart';
import 'package:robowars3/screens/robowars_about_page.dart';
import 'package:robowars3/screens/schedule_page.dart';
import 'package:robowars3/screens/teams_screen.dart';
import 'package:robowars3/screens/update_screen.dart';
import 'package:robowars3/screens/viewmorescreen.dart';

import '../database/eventcard.dart';
import '../database/socialbutton.dart';

class Homescreen extends StatefulWidget {
  static String id = "home_screen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  int _currentCarouselIndex = 0; // To track the currently visible card index

  // Handles the change of tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of screens corresponding to the bottom navigation items
  final List<Widget> _screens = [
    HomePageContent(),
    TeamsScreen(),
    MatchScheduleScreen(),
    UpdatesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Keeps labels visible
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xffBC4E24), // Color for selected item
        unselectedItemColor: Colors.white, // Color for unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle icon tap
        items: const [
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
        child: IndexedStack(
          index: _selectedIndex, // Show the current tab's content
          children: _screens, // Display the appropriate screen
        ),
      ),
    );
  }
}

// Home page content
class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int _currentCarouselIndex = 0;

  // List of Event Cards to display
  final List<Map<String, dynamic>> eventCards = [
    {
      'eventName': 'Robowars',
      'navigation': (context) {
        Navigator.pushNamed(context, RobowarsAboutPage.id);
      },
      'color': Color(0xFFE04C11),
    },
    {
      'eventName': 'Robosoccer',
      'navigation': (context) {
        Navigator.pushNamed(context, Robosoccer.id);
      },
      'color': Color(0xFFE04C11),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
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
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselIndex = index;
                      });
                    },
                  ),
                  items: eventCards.map((event) {
                    return EventCard(
                      EventName: event['eventName'],
                      navigation: () => event['navigation'](context),
                    );
                  }).toList(),
                ),
                // Add the dots for carousel indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: eventCards.map((event) {
                    int index = eventCards.indexOf(event);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentCarouselIndex == index
                            ? event[
                                'color'] // Color changes based on visible card
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            ShowMatch(
              ShowMatchInfo: 'Live Now',
              ShowMatchNo: TeamMatchDetails[0].MatchNo,
              ShowMatchPhotoOne: TeamMatchDetails[0].imageLocation1,
              ShowMatchPhotoTwo: TeamMatchDetails[0].imageLocation2,
              ShowMatchIcon: kLiveNowIcon,
            ), // Live Now
            ShowMatch(
              ShowMatchInfo: 'Upcoming',
              ShowMatchNo: TeamMatchDetails[1].MatchNo,
              ShowMatchPhotoOne: TeamMatchDetails[1].imageLocation1,
              ShowMatchPhotoTwo: TeamMatchDetails[1].imageLocation2,
              ShowMatchIcon: null,
            ), // Upcoming
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
                                      builder: (context) => ViewMoreScreen()),
                                );
                              },
                              child: Container(
                                width: 120, // Set width for each grid item
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.remove_red_eye,
                                          color: Colors.white),
                                      SizedBox(height: 8),
                                      Text('View More',
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                child: Icon(Icons.photo, color: Colors.white),
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ), // Photo Gallery
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
                  ),
                ],
              ),
            ), // Social Media
          ],
        ),
      ),
    );
  }
}
