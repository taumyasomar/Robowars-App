import 'package:flutter/material.dart';

class ShowMatch extends StatelessWidget {
  final String ShowMatchInfo;
  final int ShowMatchNo;
  final String? ShowMatchPhotoOne;
  final String? ShowMatchPhotoTwo;
  final Icon? ShowMatchIcon;
  const ShowMatch({
    super.key,
    required this.ShowMatchInfo,
    required this.ShowMatchNo,
    required this.ShowMatchPhotoOne,
    required this.ShowMatchPhotoTwo,
    required this.ShowMatchIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${ShowMatchInfo} ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
            ),
            if (ShowMatchIcon != null) ShowMatchIcon!,
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Color(0xffBC4E24),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Match ${ShowMatchNo}',
                            style: TextStyle(
                                color: Color(0xffBC4E24),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Image(
                                image: AssetImage('${ShowMatchPhotoOne}'),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(5.0),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(' VS ',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                              child: Image(
                                image: AssetImage('${ShowMatchPhotoTwo}'),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(5.0),
                            ),
                            flex: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TeamMatches {
  final String imageLocation1;
  final String imageLocation2;
  final int MatchNo;

  TeamMatches(
      {required this.imageLocation1,
      required this.imageLocation2,
      required this.MatchNo});
}

List<TeamMatches> TeamMatchDetails = [
  TeamMatches(
      imageLocation1: 'assets/orcuslogo.jpeg',
      imageLocation2: 'assets/WhatsApp Image 2024-09-07 at 22.26.04.jpeg',
      MatchNo: 1),
  TeamMatches(
      imageLocation1: 'assets/WhatsApp Image 2024-09-07 at 22.26.04.jpeg',
      imageLocation2: 'assets/WhatsApp Image 2024-09-07 at 22.27.01.jpeg',
      MatchNo: 2)
];
//Last match should be updated and show that last match
