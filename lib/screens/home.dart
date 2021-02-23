import 'package:flutter/material.dart';
import 'package:funiture_list/data/furniture_list.dart';
import 'package:funiture_list/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PaletteColor> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 20.0),
            width: double.infinity,
            height: 700,
            child: PageView(
              children: furnitureList
                  .map((furniture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(furniture.furnitureImage),
                          SizedBox(height: 80),
                          Text(
                            //TODO: Generate List Numbers
                            ".01",
                            style: GoogleFonts.questrial(
                                fontSize: 35.0, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            furniture.furnitureName,
                            style: GoogleFonts.questrial(
                                fontSize: 28.0, fontWeight: FontWeight.w500,),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            furniture.furnitureDescription,
                            style: GoogleFonts.questrial(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ))
                  .toList(),
            ),
          ),
          CustomButton(),
        ],
      ),
    );
  }
}
