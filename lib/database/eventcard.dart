import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String EventName;
  final Function() navigation;
  const EventCard({
    super.key,
    required this.EventName, required this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              '${EventName} 2024',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: navigation,
            child: Container(
              height: 145,
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
    );
  }
}
