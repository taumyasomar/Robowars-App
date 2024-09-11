import 'package:flutter/material.dart';
import 'package:robowars3/screens/homescreen.dart';

class UpdatesScreen extends StatelessWidget {
  static String id = "update_screen";

  final List<Update> updates = [
    Update(
        date: '27th September',
        time: '9:00 AM',
        message:
        'Battle delayed by 15 minutes due to technical checks. Stay tuned!'),
    Update(
        date: '27th September',
        time: '9:15 AM',
        message: 'Technical checks completed. The battle will start shortly.'),
    Update(
        date: '27th September',
        time: '9:30 AM',
        message: 'The battle has begun! May the best team win.'),
    Update(
        date: '27th September',
        time: '10:00 AM',
        message: 'First round results are out. Stay tuned for the next round.'),
    Update(
        date: '27th September',
        time: '10:30 AM',
        message:
        'The next round will start in 10 minutes. Prepare yourselves!'),
    Update(
        date: '20th September',
        time: '10:30 AM',
        message:
        'The next round will start in 10 minutes. Prepare yourselves!'),
    Update(
        date: '27th September',
        time: '10:30 AM',
        message:
        'The next round will start in 10 minutes. Prepare yourselves!'),
    Update(
        date: '20th September',
        time: '10:30 AM',
        message:
        'The next round will start in 10 minutes. Prepare yourselves!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Updates",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: updates.length,
          itemBuilder: (context, index) {
            final update = updates[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Aligns children to the left
                children: [
                  Text(
                    '${update.date}\n${update.time}',
                    textAlign: TextAlign.center, // Left-align the text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    update.message,
                    textAlign: TextAlign.center, // Center-align the message
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: Colors.red,
                    thickness: 3,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Update {
  final String date;
  final String time;
  final String message;

  Update({required this.date, required this.time, required this.message});
}