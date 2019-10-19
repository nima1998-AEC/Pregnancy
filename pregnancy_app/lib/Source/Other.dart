import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pregnancy_app/Source/Chart.dart';

// Set Debug Banner Show
bool debugBanner() {
  return false;
}

// Return Week Lists
List<String> weeksList() {
  List<String> weeksList = [
    'هفته اول',
    'هفته دوم',
    'هفته سوم',
    'هفته چهارم',
    'هفته پنجم',
    'هفته ششم',
    'هفته هفتم',
    'هفته هشتم',
    'هفته نهم',
    'هفته دهم',
    'هفته یازدهم',
    'هفته دوازدهم',
    'هفته سیزدهم',
    'هفته چهاردهم',
    'هفته پانزدهم',
    'هفته شانزدهم',
    'هفته هفدهم',
    'هفته هجدهم',
    'هفته نوزدهم',
    'هفته بیستم',
    'هفته بیست و یکم',
    'هفته بیست و دوم',
    'هفته بیست و سوم',
    'هفته بیست و چهارم',
    'هفته بیست و پنجم',
    'هفته بیست و ششم',
    'هفته بیست و هفتم',
    'هفته بیست و هشتم',
    'هفته بیست و نهم',
    'هفته سی ام',
    'هفته سی و یکم',
    'هفته سی و دوم',
    'هفته سی و سوم',
    'هفته سی و چهارم',
    'هفته سی و پنجم',
    'هفته سی و ششم',
    'هفته سی و هفتم',
    'هفته سی و هشتم',
    'هفته سی و نهم',
    'هفته چهلم',
    'هفته چهل و یکم',
  ];

  return weeksList;
}

// Return Week Key as List
String weekKey(String weekName) {
  String weekKey;
  if (weekName == 'هفته اول')
    weekKey = '1';
  else if (weekName == 'هفته دوم')
    weekKey = '2';
  else if (weekName == 'هفته سوم')
    weekKey = '3';
  else if (weekName == 'هفته چهارم')
    weekKey = '4';
  else if (weekName == 'هفته پنجم')
    weekKey = '5';
  else if (weekName == 'هفته ششم')
    weekKey = '6';
  else if (weekName == 'هفته هفتم')
    weekKey = '7';
  else if (weekName == 'هفته هشتم')
    weekKey = '8';
  else if (weekName == 'هفته نهم')
    weekKey = '9';
  else if (weekName == 'هفته دهم')
    weekKey = '10';
  else if (weekName == 'هفته یازدهم')
    weekKey = '11';
  else if (weekName == 'هفته دوازدهم')
    weekKey = '12';
  else if (weekName == 'هفته سیزدهم')
    weekKey = '13';
  else if (weekName == 'هفته چهاردهم')
    weekKey = '14';
  else if (weekName == 'هفته پانزدهم')
    weekKey = '15';
  else if (weekName == 'هفته شانزدهم')
    weekKey = '16';
  else if (weekName == 'هفته هفدهم')
    weekKey = '17';
  else if (weekName == 'هفته هجدهم')
    weekKey = '18';
  else if (weekName == 'هفته نوزدهم')
    weekKey = '19';
  else if (weekName == 'هفته بیستم')
    weekKey = '20';
  else if (weekName == 'هفته بیست و یکم')
    weekKey = '21';
  else if (weekName == 'هفته بیست و دوم')
    weekKey = '22';
  else if (weekName == 'هفته بیست و سوم')
    weekKey = '23';
  else if (weekName == 'هفته بیست و چهارم')
    weekKey = '24';
  else if (weekName == 'هفته بیست پنجم')
    weekKey = '25';
  else if (weekName == 'هفته بیست و ششم')
    weekKey = '26';
  else if (weekName == 'هفته بیست و هفتم')
    weekKey = '27';
  else if (weekName == 'هفته بیست و هشتم')
    weekKey = '28';
  else if (weekName == 'هفته بیست و نهم')
    weekKey = '29';
  else if (weekName == 'هفته سی ام')
    weekKey = '30';
  else if (weekName == 'هفته سی و یکم')
    weekKey = '31';
  else if (weekName == 'هفته سی و دوم')
    weekKey = '32';
  else if (weekName == 'هفته سی و سوم')
    weekKey = '33';
  else if (weekName == 'هفته سی و چهارم')
    weekKey = '34';
  else if (weekName == 'هفته سی و پنجم')
    weekKey = '35';
  else if (weekName == 'هفته سی و ششم')
    weekKey = '36';
  else if (weekName == 'هفته سی و هفتم')
    weekKey = '37';
  else if (weekName == 'هفته سی و هشتتم')
    weekKey = '38';
  else if (weekName == 'هفته سی و نهم')
    weekKey = '39';
  else if (weekName == 'هفته چهلم')
    weekKey = '40';
  else if (weekName == 'هفته چهل و یکم') weekKey = '41';

  return weekKey;
}


// AppBar Widget
Row appBar(var scaffolKey) {
  return Row(
    textDirection: TextDirection.rtl,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 8.0, left: 8.0),
        child: new IconButton(
          highlightColor: Color.fromARGB(255, 45, 34, 22),
          onPressed: () {
            scaffolKey.currentState.openEndDrawer();
          },
          icon: new Icon(
            FontAwesomeIcons.alignRight,
            color: Colors.white,
          ),
        ),
      ),
      Expanded(
        child: Text(
          "راهنمای آموزشی و \n\nمراقبتی مادران باردار",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Terafik",
              color: Colors.white),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 8.0, left: 16.0),
        child: Container(
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.fill,
          ),
          width: 30,
          height: 30,
        ),
      ),
    ],
  );
}

// AppBar Without Drawer
Row appBarWithoutDrawer() {
  return Row(
    textDirection: TextDirection.rtl,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 8.0),
        child: new IconButton(
          iconSize: 30.0,
          highlightColor: Color.fromARGB(255, 45, 34, 22),
          onPressed: (){},
          icon: new Icon(
            FontAwesomeIcons.alignRight,
            color: Colors.transparent,
          ),
        ),
      ),
      Expanded(
        child: Text(
          "راهنمای آموزشی و \n\nمراقبتی مادران باردار",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Terafik",
              color: Colors.white),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 16.0,right: 26.0),
        child: Container(
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.fill,
          ),
          width: 30,
          height: 30,
        ),
      ),
    ],
  );
}

// Chart
Container chart() {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16, top: 24.0, bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 270.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 8.0,
                      top: 8.0,
                    ),
                    child: Text('وزن (کیلوگرم)'),
                  ),
                ),
                Expanded(
                  child: Chart(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: Text('هفته بارداری'),
          )
        ],
      ),
    ),
  );
}

Widget foodText(String text, Color color, double fontSize) {
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(color: color, fontSize: fontSize),
        ));
  }
