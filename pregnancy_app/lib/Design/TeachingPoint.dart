import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pregnancy_app/Design/FoodSuggestionForSlim.dart';
import 'package:pregnancy_app/Design/FoodSupplement.dart';
import 'package:pregnancy_app/Source/Other.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'FoodSuggestionForFat.dart';
import 'SuggestionsInGripe.dart';

class Point extends StatefulWidget {
  PointState createState() => PointState();
}

class PointState extends State<Point> {
  var key1 = GlobalKey<ScaffoldState>();

  Widget pointListTile(String title, int selection) {
    return GestureDetector(
      onTap: () {
        switch (selection) {
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => FoodSuggestionForSlim()
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => FoodSuggestionForFat(),
              ),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => FoodSupplement(),
              ),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SuggestionsInGripe(),
              ),
            );
            break;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 16, left: 16, top: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white.withOpacity(0.5),
            border: Border.all(color: Colors.black12)),
        child: Container(
          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  right: 10.0,
                ),
                child: Icon(
                  FontAwesomeIcons.chevronCircleLeft,
                  color: Color.fromARGB(255, 153, 153, 153),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: AutoSizeText(
                    title,
                    maxLines: 2,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'Terafik',
                      color: Color.fromARGB(255, 221, 85, 153),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key1,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            appBar(key1),
            SizedBox(
              height: 80.0,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 30),
                children: <Widget>[
                  pointListTile(
                      'توصیه های تغذیه ای برای مادران لاغر یا با وزن گیری کمتر از حد انتظار در بارداری ',
                      1),
                  pointListTile(
                      'توصیه های تغذیه ای برای مادران با اضافه وزن یا چاق یا با وزن گیری بیشتر از حد انتظار در بارداری ',
                      2),
                  pointListTile('مکمل های غذایی مورد نیاز در دوران بارداری', 3),
                  pointListTile('توصیه های تغذیه ای در شکایات شایع بارداری', 4),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
