import 'package:flutter/material.dart';
import 'package:funiture_list/data/furniture_list.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: <Widget>[
                  Image.asset("${furnitureList[index].furnitureImage}"),
                  SizedBox(height: 50.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${furnitureList[index].toString()}",
                        style: GoogleFonts.questrial(
                            fontSize: 35.0, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "${furnitureList[index].furnitureName}",
                        style: GoogleFonts.questrial(
                            fontSize: 27.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "${furnitureList[index].furnitureDescription}",
                        style: GoogleFonts.questrial(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  FloatingActionButton(
                    elevation: 0.0,
                    child: RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black,
                        )),
                    onPressed: () {},
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
