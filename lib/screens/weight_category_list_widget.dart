import 'package:flutter/material.dart';

class WeightCategoryListWidget extends StatefulWidget {
  final Function(String) onCategorySelected;

  const WeightCategoryListWidget({super.key, required this.onCategorySelected});

  @override
  _WeightCategoryListWidgetState createState() =>
      _WeightCategoryListWidgetState();
}

class _WeightCategoryListWidgetState extends State<WeightCategoryListWidget> {
  final List<Map<String, dynamic>> buttonData = [
    {'text': 'DogeWeight - 8Kg', 'category': 'DogeWeight'},
    {'text': 'FeatherWeight - 15Kg', 'category': 'FeatherWeight'},
    {'text': 'MidWeight - 60Kg', 'category': 'MidWeight'},
  ];

  // Initialize with DogeWeight selected by default.
  int? _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE04C11),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(0xFFE04C11),
              width: 3.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Weight Category',
                style: TextStyle(
                  color: Color(0xFFE04C11),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  height: 3,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: buttonData.length,
              itemBuilder: (context, index) {
                final item = buttonData[index];
                final isSelected = _selectedIndex == index;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      const Divider(
                        color: Color(0xFFE04C11),
                        thickness: 3.0,
                        height: 1,
                      ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      tileColor: isSelected
                          ? const Color(0xFF2E1308)
                          : Colors.transparent,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 0),
                        child: Text(
                          item['text'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 0.1,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        widget.onCategorySelected(item['category']);
                      },
                    ),
                    if (isSelected)
                      const Divider(
                        color: Color(0xFFE04C11),
                        thickness: 3.0,
                        height: 1,
                      ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
