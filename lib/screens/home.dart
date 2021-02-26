import 'package:flutter/material.dart';
import 'package:funiture_list/data/furniture_list.dart';
import 'package:funiture_list/models/furniture_model.dart';
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
  final int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    colors = [];
    _updatePalettes();
  }

//TODO: Images not being referenced
  _updatePalettes() async {
    for (Furniture furnitureImg in furnitureList) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(
        AssetImage(furnitureImg.toString()),
      );

      colors.add(
        generator.lightMutedColor != null
            ? generator.lightMutedColor
            : PaletteColor(Colors.blue, 2),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 20.0),
        color: colors.isNotEmpty
            ? colors[_currentIndex].color
            : Colors.yellow[400],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 700,
              child: PageView(
                controller: _pageController,
                children: furnitureList
                    .map((furniture) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(furniture.furnitureImage),
                            SizedBox(height: 60),
                            Text(
                              furniture.furnitureNumber,
                              style: GoogleFonts.questrial(
                                  fontSize: 40.0, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              furniture.furnitureName,
                              style: GoogleFonts.questrial(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                              ),
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
      ),
    );
  }
}
