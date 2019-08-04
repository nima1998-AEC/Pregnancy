import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddWeight.dart';
import 'LoadPage.dart';
import 'MotherPropoerties.dart';
import 'DrawerDesign.dart';
import 'Chart.dart';

var scaffoldKey1 = GlobalKey<ScaffoldState>();

class MainPage extends StatefulWidget {
  final String intent;

  const MainPage({Key key, this.intent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPage(intent);
}

class _MainPage extends State<MainPage> {
  final String intetn;

  String week = '';
  String weight = '';
  String growing = '';
  String status = '';

  _MainPage(this.intetn);

  @override
  void initState() {
    setState(() {
      getData();
      setWeek();
      setWeight();
      setGrowing();
      setStatus();
      Chart();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> setWeek() async {
    final pref = await SharedPreferences.getInstance();

    String lastW = pref.getString('lastWeek');
    print('Last $lastW');
    List<String> weeks = [
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
    setState(() {
      week = weeks[int.parse(lastW) - 1];
    });
  }

  Future<void> setWeight() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      double w = pref.getDouble('lastWeight');
      weight = w.toStringAsFixed(2).toString();
    });
  }

  Future<void> setGrowing() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      double lastWeight = pref.getDouble('lastWeight');
      double firstWeight = pref.getDouble('weight');
      double diff = (firstWeight - lastWeight).abs();
      growing = diff.toStringAsFixed(2).toString();
    });
  }

  Future<void> setStatus() async {
    final pref = await SharedPreferences.getInstance();
    // String lastDate = pref.getString('date');
    // print('Last date $lastDate');
    // PersianDateTime lastDates = PersianDateTime(jalaaliDateTime: lastDate);
    // PersianDateTime nowDates = PersianDateTime();
    // int numberWeek = (nowDates.difference(lastDates).inDays / 7).toInt();
    // if (numberWeek % 7 != 0 || numberWeek == 0) numberWeek++;
    // String w = 'week' + numberWeek.toString();

    String lastW = pref.getString('lastWeek');
    List<String> list = pref.getStringList('week' + lastW);
    MotherProperties motherProperties = await loadProfileData();
    int number = motherProperties.number;
    setState(() {
      if (number == 1) {
        if (double.parse(growing) >= double.parse(list[0]) &&
            double.parse(growing) <= double.parse(list[1]))
          status = 'کم وزن';
        else if (double.parse(growing) >= double.parse(list[2]) &&
            double.parse(growing) <= double.parse(list[3]))
          status = 'طبیعی';
        else if (double.parse(growing) >= double.parse(list[4]) &&
            double.parse(growing) <= double.parse(list[5]))
          status = 'اضافه وزن';
        else
          status = 'چاق';
      } else if (number == 2) {
        if (double.parse(growing) >= double.parse(list[8]) &&
            double.parse(growing) <= double.parse(list[9]))
          status = 'طبیعی';
        else if (double.parse(growing) >= double.parse(list[10]) &&
            double.parse(growing) <= double.parse(list[11]))
          status = 'اضافه وزن';
        else
          status = 'چاق';
      }
    });
  }

  Container chart() {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32, top: 24.0, bottom: 12.0),
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
          )),
    );
  }

  Row appBar() {
    return Row(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(right: 8.0, left: 8.0),
            child: new IconButton(
              highlightColor: Color.fromARGB(255, 45, 34, 22),
              onPressed: () {
                scaffoldKey1.currentState.openEndDrawer();
              },
              icon: new Icon(
                FontAwesomeIcons.alignRight,
                color: Colors.white,
              ),
            )),
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
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        key: scaffoldKey1,
        endDrawer: DrawerDesign(),
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
                  appBar(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        chart(),
                        Container(
                          margin: EdgeInsets.only(right: 32, left: 32, top: 8),
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
                                  width: 110,
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
                                    week,
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
                          margin: EdgeInsets.only(right: 32, left: 32, top: 8),
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
                                    width: 110,
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
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 32, left: 32, top: 8),
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
                                  width: 110,
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
                          margin: EdgeInsets.only(right: 32, left: 32, top: 8),
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
                                  child: Icon(FontAwesomeIcons.userClock,
                                      color:
                                          Color.fromARGB(255, 153, 153, 153)),
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
                                  width: 110,
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
                          margin: EdgeInsets.only(right: 32, left: 32, top: 8),
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
                                                AddWeight()));
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
}
