import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:pregnancy_app/Drawer/HistoryPageDrawer.dart';
import 'package:pregnancy_app/Source/HistoryPageSource.dart';
import 'package:pregnancy_app/Source/Other.dart';

Widget row(String weekNumber, String weight, String deference) {
  return Container(
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
                '$weekNumber',
                maxLines: 1,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Terafik',
                  color: Color.fromARGB(255, 221, 85, 153),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: 90,
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(top: 4.0, bottom: 4.0, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 85, 153),
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: EdgeInsets.only(
              left: 10.0,
            ),
            child: AutoSizeText(
              '$weight کیلوگرم ',
              maxLines: 1,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Sans',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 60,
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10, left: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 85, 153),
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: EdgeInsets.only(
              left: 10.0,
            ),
            child: AutoSizeText(
              deference,
              maxLines: 1,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Sans',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget list;

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  var scaffoldKey3 = GlobalKey<ScaffoldState>();

  String week = '';
  String weight = '';
  String growing = '';

  bool listFlag = false;
  @override
  void initState() {
    super.initState();

    debugPrint('call Functions in History Page ...');
    callFunctions();
    getWeeks().then((onValue) {
      if (onValue.length > 0) {
        setState(() {
          list = ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                child: row(
                  onValue[index].weekNumber.toString(),
                  onValue[index].weight.toString(),
                  onValue[index].difference.toString(),
                ),
              );
            },
            itemCount: onValue.length,
          );

          listFlag = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugBanner(),
      home: Scaffold(
        key: scaffoldKey3,
        endDrawer: HistoryPageDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              appBar(scaffoldKey3),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 32),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 244, 244, 244),
                              borderRadius: BorderRadius.circular(9.0)),
                          margin: EdgeInsets.only(
                              left: 16.0, top: 8.0, right: 16.0),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            "مشاهده روند رشد",
                            style: TextStyle(
                              color: Color.fromARGB(255, 218, 86, 152),
                            ),
                          ),
                          alignment: Alignment.topRight,
                        ),
                      ],
                      textDirection: TextDirection.rtl,
                    ),
                    Directionality(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromARGB(255, 243, 243, 243),
                        ),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(right: 10, top: 8, bottom: 8),
                              child: Text(
                                'هفته بارداری',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                week,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            )
                          ],
                        )),
                        margin: EdgeInsets.only(right: 25, top: 10, left: 30),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Directionality(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromARGB(255, 243, 243, 243),
                        ),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10, bottom: 8.0, top: 8.0),
                              child: Text(
                                'وزن قبل از بارداری',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                weight + ' کیلوگرم',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            )
                          ],
                        )),
                        margin: EdgeInsets.only(right: 25, top: 10, left: 30),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Directionality(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromARGB(255, 243, 243, 243),
                        ),
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10, top: 8.0, bottom: 8.0),
                              child: Text(
                                'مقدار تغییر وزن',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                growing + ' کیلوگرم',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                            )
                          ],
                        )),
                        margin: EdgeInsets.only(
                            right: 25, top: 10, bottom: 10, left: 30),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: listFlag ? list : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void callFunctions() async {
    String _week, _weight, _growing;

    _week = await setWeek();
    _weight = await setWeight();
    _growing = await setGrowing();

    setState(() {
      week = _week;
      weight = _weight;
      growing = _growing;
    });
  }
}
