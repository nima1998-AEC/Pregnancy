import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'AddWeight.dart';
import 'ProfilePage.dart';

var scaffoldKey3 = GlobalKey<ScaffoldState>();

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
  List<WeekInformationBar> data = new List<WeekInformationBar>();
  List<WeekInformationBar> data1 = new List<WeekInformationBar>();
  String week = '';
  String weight = '';
  String growing = '';
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
  Future<void> setWeek() async {
    final pref = await SharedPreferences.getInstance();
    String lastWeek = pref.getString('lastWeek');
    print(lastWeek);
    setState(() {
      week = weeks[int.parse(lastWeek) - 1];
    });
  }

  Future<void> setWeight() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      double w = pref.getDouble('weight');
      weight = w.toString();
    });
  }

  Future<void> setGrowing() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      double lastWeight = pref.getDouble('lastWeight');
      double firstWeight = pref.getDouble('weight');
      double diff = (firstWeight - lastWeight).abs();
//      print('diff : $diff');
      growing = diff.toStringAsFixed(2).toString();
    });
  }

  Future<void> getWeeks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int i = 0;
    while (i < 41) {
      List<String> list = sp.getStringList((i + 1).toString());
//      print('$i . $list');
      if (list != null) {
        WeekInformationBar wib = new WeekInformationBar(
          weekNumber: weeks[i],
          weight: double.parse(list[1]).toStringAsFixed(1),
        );
        data.add(wib);
      }
      i++;
    }

    for (int i = 0; i < data.length; i++) {
      if (i == 0) {
        WeekInformationBar wib = new WeekInformationBar(
          weekNumber: weeks[0],
          weight: data[0].weight.toString() + 'کیلوگرم',
          difference: '0.00',
        );
        data1.add(wib);
      } else {
        double diff =
            double.parse(data[i].weight) - double.parse(data[i - 1].weight);
        WeekInformationBar wib = new WeekInformationBar(
          weekNumber: data[i].weekNumber,
          weight: data[i].weight + 'کیلوگرم',
          difference: diff.toStringAsFixed(2).toString(),
        );
        data1.add(wib);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setWeek();
    setWeight();
    setGrowing();
    setState(() {
      getWeeks().whenComplete(() {
        list = ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16.0),
              child: row(
                data[index].weekNumber.toString(),
                data1[index].weight.toString(),
                data1[index].difference.toString(),
              ),
            );
          },
          itemCount: data1.length,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        key: scaffoldKey3,
        endDrawer: Container(
          width: MediaQuery.of(context).size.width / (1.4),
          child: Drawer(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/DrawerHeader.png",
                          ),
                          fit: BoxFit.fill)),
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(top: 0),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ProfilePage()));
                                    },
                                    title: Text("مشخصات مادر",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.idBadge,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: Theme(
                                data: ThemeData(
                                  highlightColor:
                                      Color.fromARGB(255, 221, 85, 153),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "ثبت وزن هفتگی",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(
                                    FontAwesomeIcons.weight,
                                    color: Color.fromARGB(255, 84, 31, 49),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AddWeight()));
                                  },
                                ),
                              ),
                            ),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("توصیه های آموزشی",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.chalkboardTeacher,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("سوابق ثبت وزن",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.chartArea,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      "پرسش و پاسخ",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 31, 49),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: Icon(
                                      FontAwesomeIcons.questionCircle,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("نکات ورزشی ماهانه",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.running,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ), //
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("توصیه های روانی",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.universalAccess,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("ویژه پدران",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.userTag,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                            height: 45,
                          ),
                          Container(
                            height: 45,
                            child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: Theme(
                                  data: ThemeData(
                                    highlightColor:
                                        Color.fromARGB(255, 221, 85, 153),
                                  ),
                                  child: ListTile(
                                    title: Text("مراکز بهداشتی",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: "Terafik",
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            fontWeight: FontWeight.bold)),
                                    leading: Icon(
                                      FontAwesomeIcons.building,
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                )),
                          ),
                          new Directionality(
                              textDirection: TextDirection.rtl,
                              child: Theme(
                                data: ThemeData(
                                  highlightColor:
                                      Color.fromARGB(255, 221, 85, 153),
                                ),
                                child: ListTile(
                                  title: Text("درباره",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontFamily: "Terafik",
                                          color:
                                              Color.fromARGB(255, 84, 31, 49),
                                          fontWeight: FontWeight.bold)),
                                  leading: Icon(
                                    FontAwesomeIcons.info,
                                    color: Color.fromARGB(255, 84, 31, 49),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 7.0, bottom: 4.0),
                            child: Text(
                              "نگارش اول_۱۳۹۸",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
              appBar(),
              Container(
                margin: EdgeInsets.only(left: 32, right: 32, top: 32),
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
                child: list,
              ),
            ],
          ),
        ),
      ),
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
                scaffoldKey3.currentState.openEndDrawer();
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
}

class WeekInformationBar extends StatefulWidget {
  final String weekNumber;
  final String weight;
  final String difference;

  const WeekInformationBar(
      {Key key, this.weekNumber, this.weight, this.difference})
      : super(key: key);

  WeekInformationBarState createState() =>
      WeekInformationBarState(weekNumber, weight, difference);
}

class WeekInformationBarState extends State<WeekInformationBar> {
  final String weekNumber;
  final String weight;
  final String deference;

  WeekInformationBarState(this.weekNumber, this.weight, this.deference);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32, left: 32, top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.black12)),
      child: Container(
        margin: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
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
                    //  fontSize: 17,

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
                '$weight',
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
}
