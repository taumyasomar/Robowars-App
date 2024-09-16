import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchScheduleScreen extends StatelessWidget {
  static String id = "match_schedule_screen";

  const MatchScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of match titles
    final List<String> matchTitles = [
      'Match 01',
      'Match 02',
      'Match 03',
      'Match 04',
      'Match 05', // Add more as needed
    ];

    return Scaffold(
      backgroundColor: Color(0xFF0B0B0B),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0B0B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Schedule',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: matchTitles.map((matchTitle) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _buildMatchCard(matchTitle),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchCard(String matchTitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE04C11), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              matchTitle, // Display match title here
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTeamContainer(),
                Text(
                  'VS',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildTeamContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamContainer() {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
