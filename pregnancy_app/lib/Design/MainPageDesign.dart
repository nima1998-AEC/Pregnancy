import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pregnancy_app/Design/AddWeightPageDesign.dart';

import 'package:pregnancy_app/Drawer/MainPageDrawer.dart';
import 'package:pregnancy_app/Source/MainPageSource.dart';
import 'package:pregnancy_app/Source/Other.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  var scaffoldKey1 = GlobalKey<ScaffoldState>();

  String week = '', weight = '', growing = '', status = '';

  @override
  void initState() {
    super.initState();
    callFunctions();
    debugPrint('call Functions in MainPage ...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugBanner(),
      home: Scaffold(
        key: scaffoldKey1,
        endDrawer: MainPageDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  appBar(scaffoldKey1),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        chart(),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.black45)),
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16.0,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.calendarWeek,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      'هفته بارداری',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: "Terafik",
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(top: 4.0, bottom: 4.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 85, 153),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  child: AutoSizeText(
                                    week,
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: "Sans",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.black45)),
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16.0,
                                  ),
                                  child: Icon(FontAwesomeIcons.weight,
                                      color:
                                          Color.fromARGB(255, 153, 153, 153)),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      'وزن ثبت شده',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: "Terafik",
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(top: 4.0, bottom: 4.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 85, 153),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  child: Align(
                                    child: Text(
                                      weight,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Sans",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.black45)),
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16.0,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.crop,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      'میزان رشد',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: "Terafik",
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(top: 4.0, bottom: 4.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 85, 153),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  child: Text(
                                    growing,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Sans",
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.black54)),
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 16.0,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.userClock,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      'وضعیت',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontFamily: "Terafik",
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  padding:
                                      EdgeInsets.only(top: 4.0, bottom: 4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 85, 153),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  child: Text(
                                    status,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Sans",
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 8),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(14.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 68, 204, 51),
                                        width: 2.0),
                                  ),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Color.fromARGB(255, 68, 204, 51),
                                      ),
                                      Text(
                                        'ثبت وزن',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 68, 204, 51),
                                          fontSize: 16,
                                          fontFamily: "Yekan",
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddWeightPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(14.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 17, 204, 221),
                                        width: 2.0),
                                  ),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      Icon(
                                        Icons.book,
                                        color:
                                            Color.fromARGB(255, 17, 204, 221),
                                      ),
                                      Text(
                                        'نکات آموزشی',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 17, 204, 221),
                                          fontSize: 16,
                                          fontFamily: "Yekan",
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> callFunctions() async {
    String _getWeek, _getWeight, _getGrowing, _getStatus;
    _getWeek = await getWeek();
    _getWeight = await getWeight();
    _getGrowing = await getGrowing();
    _getStatus = await getStatus();
    setState(() {
      week = _getWeek;
      weight = _getWeight;
      growing = _getGrowing;
      status = _getStatus;
    });
  }
}
