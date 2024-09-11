import 'package:flutter/material.dart';
import 'package:robowars3/database/teamData.dart';
class TeamsScreen extends StatelessWidget {
  static String id = 'team_screen';
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TEAMS',style: TextStyle(fontSize: 20.0,color: Colors.white),
        ),
      ),
      body: Container(
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
      ), //Teams,
    );
  }
}
