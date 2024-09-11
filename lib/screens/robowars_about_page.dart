import 'package:flutter/material.dart';
import 'package:robowars3/screens/weight_category_list_widget.dart';

class RobowarsAboutPage extends StatefulWidget {
  static String id = 'robowars_about_page';
  const RobowarsAboutPage({super.key});

  @override
  State<RobowarsAboutPage> createState() => _RobowarsAboutPageState();
}

class _RobowarsAboutPageState extends State<RobowarsAboutPage> {
  String _selectedCategory = 'DogeWeight';
  String _categoryInfo =
      'Massive and destructive, these robots deliver crushing blows with unstoppable force.';

  // Single participant data, same info across categories
  final Map<String, Map<String, String>> _teamDetails = {
    'Orcus': {
      'image': 'lib/assets/orcus.jpeg',
      'description':
          'Orcus delivers fierce blows and is a powerhouse in every category.',
    },
    'Shadow Robotics': {
      'image': 'assets/shadow.png',
      'description':
          'Shadow Robotics excels in speed and agility, dominating all categories.',
    },
    'DS Robotics': {
      'image': 'assets/ds_robotics.png',
      'description':
          'DS Robotics is a blend of precision and force, known for consistency across all categories.',
    },
    'Vision Bots': {
      'image': 'assets/vision_bots.png',
      'description':
          'Vision Bots uses cutting-edge technology to outsmart opponents in every weight class.',
    },
  };

  final Map<String, List<String>> _participantsData = {
    'DogeWeight': ['Orcus', 'Shadow Robotics', 'DS Robotics', 'Vision Bots'],
    'FeatherWeight': ['Orcus', 'DS Robotics', 'Vision Bots'],
    'MidWeight': ['Orcus', 'DS Robotics', 'Vision Bots'],
  };

  List<String> _participants = [];

  @override
  void initState() {
    super.initState();
    _participants = _participantsData['DogeWeight']!;
  }

  // Method to show participant details in a dialog box
  void _showParticipantDetails(String teamName) {
    final team = _teamDetails[teamName]!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0B0B0B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
            side: const BorderSide(color: Color(0xFFE04C11), width: 2),
          ),
          title: Text(
            teamName,
            style: const TextStyle(
              color: Color(0xFFE04C11),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  team['image']!,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  team['description']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Color(0xFFE04C11)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateCategoryDetails(String category) {
    setState(() {
      _selectedCategory = category;
      _participants = _participantsData[category]!;
      if (category == 'DogeWeight') {
        _categoryInfo =
            'Massive and destructive, these robots deliver crushing blows with unstoppable force.';
      } else if (category == 'FeatherWeight') {
        _categoryInfo =
            'A perfect balance of power and speed, offering thrilling, well-rounded battles.';
      } else if (category == 'MidWeight') {
        _categoryInfo =
            'Massive and destructive, these robots deliver crushing blows with unstoppable force.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Robowars',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0B0B0B),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFE04C11),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xFFE04C11),
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0, right: 12, top: 20, bottom: 0),
                          child: Text(
                            'About',
                            style: TextStyle(
                              color: Color(0xFFE04C11),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: Text(
                            'Prepare to be astonished by the mesmerizing clash of innovation and tactics at Robowars, an adrenaline-fueled spectacle where bots engage in a captivating fusion of technology and combat.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              WeightCategoryListWidget(
                onCategorySelected: _updateCategoryDetails,
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedCategory,
                      style: const TextStyle(
                        color: Color(0xFFE04C11),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _categoryInfo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Participants',
                      style: TextStyle(
                        color: Color(0xFFE04C11),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 12.0,
                      children: _participants
                          .map((participant) => GestureDetector(
                                onTap: () =>
                                    _showParticipantDetails(participant),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFE04C11),
                                      width: 2.0,
                                    ),
                                    color: const Color(0xFF0B0B0B),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    participant,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
