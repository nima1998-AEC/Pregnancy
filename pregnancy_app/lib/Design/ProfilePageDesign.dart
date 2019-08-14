import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
import 'package:pregnancy_app/Design/AddWeightPageDesign.dart';

import 'package:pregnancy_app/Design/HistoryPageDesign.dart';
import 'package:pregnancy_app/Design/MainPageDesign.dart';
import 'package:pregnancy_app/Model/MotherPropoerties.dart';
import 'package:pregnancy_app/Source/LoadingFunctions.dart';
import 'package:pregnancy_app/Source/Other.dart';
import 'package:pregnancy_app/Source/ProfilePageSource.dart';
import 'package:pregnancy_app/Source/savingFunctions.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  MotherProperties motherProperties;

  PersianDatePickerWidget persianDatePicker;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final dateController = TextEditingController();
  final numberController = TextEditingController();

  String bmi = '';
  String status = '';
  bool notNull = false;

  persianDatePickerWidget() {
    persianDatePicker = PersianDatePicker(
      headerTodayBackgroundColor: Colors.pink[100],
      currentDayBackgroundColor: Colors.pink[100],
      headerTodayIcon: Icon(
        Icons.calendar_today,
        color: Colors.black,
        size: 18,
      ),
      monthSelectionAnimationCurve: Curves.fastOutSlowIn,
      farsiDigits: false,
      gregorianDaysLocation: GregorianDaysLocation.topLeft,
      weekCaptionsBackgroundColor: Color.fromARGB(255, 218, 86, 152),
      selectedDayBackgroundColor: Color.fromARGB(255, 218, 86, 152),
      controller: dateController,
    ).init();
  }

  @override
  void initState() {
    super.initState();
    persianDatePickerWidget();

    loadProfileData().then((onValue) {
      debugPrint('On Value : ${onValue.name}');
      debugPrint('On Value : ${onValue.age}');
      debugPrint('On Value : ${onValue.bmi}');
      debugPrint('On Value : ${onValue.date}');
      debugPrint('On Value : ${onValue.height}');
      debugPrint('On Value : ${onValue.weight}');
      debugPrint('On Value : ${onValue.status}');

      if (onValue.name != null &&
          onValue.age != null &&
          onValue.bmi != null &&
          onValue.date != null &&
          onValue.height != null &&
          onValue.weight != null &&
          onValue.status != null) {
        setState(() {
          motherProperties = onValue;
          bmi = motherProperties.bmi.toStringAsFixed(2).toString();
          status = motherProperties.status;
          notNull = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget form = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          appBarWithoutDrawer(),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 244, 244),
                                borderRadius: BorderRadius.circular(9.0)),
                            margin: EdgeInsets.only(
                                left: 150.0, top: 8.0, right: 8.0),
                            child: Text(
                              "ثبت اطلاعات شخصی",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 218, 86, 152)),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                        textDirection: TextDirection.rtl,
                      ),
                      Form(
                        child: Column(
                          children: <Widget>[
                            Directionality(
                              child: Container(
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      helperText:
                                          notNull ? "نام و نام خانوادگی" : null,
                                      hintText: notNull
                                          ? motherProperties.name
                                          : null,
                                      labelText: notNull
                                          ? null
                                          : "نام و نام خانوادگی"),
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Container(
                                child: TextFormField(
                                  controller: ageController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                      helperText:
                                          notNull ? "سن(بر حسب سال)" : null,
                                      hintText: notNull
                                          ? motherProperties.age.toString()
                                          : null,
                                      labelText:
                                          notNull ? null : "سن(بر حسب سال)"),
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Container(
                                child: TextFormField(
                                  controller: heightController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: InputDecoration(
                                      helperText: notNull
                                          ? "قد قبل از بارداری(برحسب متر)"
                                          : null,
                                      hintText: notNull
                                          ? motherProperties.height
                                              .toStringAsFixed(2)
                                              .toString()
                                          : null,
                                      labelText: notNull
                                          ? null
                                          : "قد قبل از بارداری(برحسب متر)"),
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Container(
                                child: TextFormField(
                                  controller: weightController,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: InputDecoration(
                                      helperText: notNull
                                          ? "وزن قبل از بارداری(برحسب کیلوگرم)"
                                          : null,
                                      hintText: notNull
                                          ? motherProperties.weight.toString()
                                          : null,
                                      labelText: notNull
                                          ? null
                                          : "وزن قبل از بارداری(برحسب کیلوگرم)"),
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      helperText:
                                          notNull ? "وزن قبل از بارداری" : null,
                                      hintText: notNull
                                          ? motherProperties.date.toString()
                                          : null,
                                      labelText: notNull
                                          ? null
                                          : "تاریخ شروع بارداری"),
                                  enableInteractiveSelection: true,
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(
                                      new FocusNode(),
                                    ); // to prevent opening default keyboard
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return persianDatePicker;
                                      },
                                    );
                                  },
                                  controller: dateController,
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Container(
                                child: TextFormField(
                                  controller: numberController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                      helperText:
                                          notNull ? "تعداد جنین(قل)" : null,
                                      hintText: notNull
                                          ? motherProperties.number.toString()
                                          : null,
                                      labelText:
                                          notNull ? null : "تعداد جنین(قل)"),
                                ),
                                margin: EdgeInsets.all(8.0),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Container(
                              width: 140.0,
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(14.0),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 221, 85, 153),
                                      width: 2.0),
                                ),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.solidCalendarCheck,
                                      color: Color.fromARGB(255, 221, 85, 153),
                                    ),
                                    Text(
                                      'BMI محاسبه',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 221, 85, 153),
                                          fontSize: 16,
                                          fontFamily: "Yekan"),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  bool _heightValid, _weightValid;
                                  setState(() {
                                    _heightValid =
                                        heightValidation(heightController.text);
                                    _weightValid =
                                        weightValidation(weightController.text);

                                    if (!_heightValid) {
                                      Fluttertoast.showToast(
                                        msg: 'قد خود را وارد نمایید',
                                        backgroundColor:
                                            Color.fromARGB(255, 218, 86, 152)
                                                .withOpacity(0.8),
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                    }
                                    if (!_weightValid) {
                                      Fluttertoast.showToast(
                                        msg: 'وزن خود را وارد نمایید',
                                        backgroundColor:
                                            Color.fromARGB(255, 218, 86, 152)
                                                .withOpacity(0.8),
                                        toastLength: Toast.LENGTH_SHORT,
                                      );
                                    } else if (_heightValid && _weightValid) {
                                      bmi = calculationBmi(
                                          heightController.text,
                                          weightController.text)[0];

                                      status = calculationBmi(
                                          heightController.text,
                                          weightController.text)[1];
                                    }
                                  });
                                },
                              ),
                              margin: EdgeInsets.all(16.0),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: 16, left: 16, top: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
//                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(color: Colors.black12)),
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
                                        FontAwesomeIcons.calendarMinus,
                                        color:
                                            Color.fromARGB(255, 153, 153, 153),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 18.0),
                                        child: Text(
                                          'توده بدنی',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: "Terafik",
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 221, 85, 153),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 4.0),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      margin: EdgeInsets.only(
                                        left: 16.0,
                                      ),
                                      child: bmi != null
                                          ? Text(
                                              bmi,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontFamily: "Sans",
                                                  color: Colors.white),
                                            )
                                          : Text(''),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 16, left: 16, top: 12, bottom: 12.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
//                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(color: Colors.black12)),
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
                                        color:
                                            Color.fromARGB(255, 153, 153, 153),
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
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 221, 85, 153),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 4.0),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 221, 85, 153),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(14.0),
                            side: BorderSide(color: Colors.green, width: 2.0),
                          ),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.green,
                              ),
                              Text(
                                'ثبت اطلاعات',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontFamily: "Yekan"),
                              ),
                            ],
                          ),
                          onPressed: () {
                            bool _valid = validation(
                                nameController.text,
                                ageController.text,
                                heightController.text,
                                weightController.text,
                                dateController.text,
                                numberController.text);

                            if (_valid) {
                              saveProfileData(
                                nameController.text,
                                int.parse(ageController.text),
                                double.parse(heightController.text),
                                double.parse(weightController.text),
                                dateController.text,
                                int.parse(numberController.text),
                              );
                              Navigator.pushReplacementNamed(
                                  context, '/MainPage');
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => MainPage(),
                              //   ),
                              // );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'اطلاعات را بصورت کامل وارد نمایید',
                                backgroundColor:
                                    Color.fromARGB(255, 218, 86, 152)
                                        .withOpacity(0.8),
                              );
                            }
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
                            borderRadius: new BorderRadius.circular(14.0),
                            side: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                color: Colors.blue,
                              ),
                              Text(
                                'انصراف',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontFamily: "Yekan"),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (notNull) Navigator.pop(context);
                          },
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
    );
    return MaterialApp(
      debugShowCheckedModeBanner: debugBanner(),
      routes: <String, WidgetBuilder>{
        '/MainPage': (BuildContext context) => new MainPage(),
        '/ProfilePage': (BuildContext context) => new ProfilePage(),
      },
      home: Scaffold(
        endDrawer: notNull
            ? Container(
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
                          padding: EdgeInsets.only(top: 0.0),
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
                                        title: Text(
                                          "ثبت وزن هفتگی",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontFamily: "Terafik",
                                              color: Color.fromARGB(
                                                  255, 84, 31, 49),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        leading: Icon(
                                          FontAwesomeIcons.weight,
                                          color:
                                              Color.fromARGB(255, 84, 31, 49),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        onTap: () {
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
                                          title: Text("مشاهده روند رشد",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontFamily: "Terafik",
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.solidFolderOpen,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HistoryPage()));
                                          },
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
                                          title: Text("توصیه های آموزشی",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontFamily: "Terafik",
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.chalkboardTeacher,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.chartArea,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                color: Color.fromARGB(
                                                    255, 84, 31, 49),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          leading: Icon(
                                            FontAwesomeIcons.questionCircle,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.running,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ),
                                      )),
                                  height: 45,
                                ),
                                //
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
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.universalAccess,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.userTag,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                  color: Color.fromARGB(
                                                      255, 84, 31, 49),
                                                  fontWeight: FontWeight.bold)),
                                          leading: Icon(
                                            FontAwesomeIcons.building,
                                            color:
                                                Color.fromARGB(255, 84, 31, 49),
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
                                                color: Color.fromARGB(
                                                    255, 84, 31, 49),
                                                fontWeight: FontWeight.bold)),
                                        leading: Icon(
                                          FontAwesomeIcons.info,
                                          color:
                                              Color.fromARGB(255, 84, 31, 49),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin:
                                      EdgeInsets.only(left: 7.0, bottom: 4.0),
                                  child: Text(
                                    "نگارش اول_۱۳۹۸",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null,
        body: form,
      ),
    );
  }
}