import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddWeight.dart';
import 'HistoryPage.dart';
import 'package:pregnancy_app/Model/MotherPropoerties.dart';
import 'LoadPage.dart';

MotherProperties motherProperties;
MotherProperties mom;

bool notNull = false;

final nameController = TextEditingController();
final ageController = TextEditingController();
final heightController = TextEditingController();
final weightController = TextEditingController();
final dateController = TextEditingController();
final numberController = TextEditingController();

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  PersianDatePickerWidget persianDatePicker;
  double bmi;
  String status = '';

  Future<void> _saveProfileData(String name, int age, double height,
      double weight, String date, int number) async {
    final pref = await SharedPreferences.getInstance();
    double bmi = weight / (height * height);
    pref.setString('name', name);
    pref.setInt('age', age);
    pref.setDouble('height', height);
    pref.setDouble('weight', weight);
    pref.setString('date', date);
    pref.setInt('number', number);
    pref.setDouble('bmi', bmi);
    pref.setDouble('1', weight);
    pref.setDouble('lastWeight', weight);
    pref.setString('lastWeek', '1');
    List<String> list = ['1', weight.toString(), date];
    pref.setStringList('1', list);
    pref.setDouble('lastChange', 0.0);
  }

  void _loadBmiStatus() async {
    loadProfileData().then((mom) {
      if (mom.height != null && mom.weight != null) {
        setState(() {
          bmi = mom.bmi;
          if (bmi < 20)
            status = 'کسر وزن';
          else if (bmi >= 20 && bmi < 25)
            status = 'وزن نرمال';
          else if (bmi >= 25 && bmi < 27)
            status = 'اضافه وزن';
          else if (bmi >= 27) status = 'چاق';
        });
      }
    });
  }

  void _calculateBmiStatus() {
    double weight, height;
    bool weightFlag = false, heightFlag = false;
    if (weightController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'وزن خود را وارد نمایید',
        backgroundColor: Color.fromARGB(255, 218, 86, 152).withOpacity(0.8),
      );
    } else {
      weight = double.parse((weightController.text));
      weightFlag = true;
    }
    if (heightController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'قد خود را وارد نمایید',
        backgroundColor: Color.fromARGB(255, 218, 86, 152).withOpacity(0.8),
      );
    } else {
      height = (double.parse(heightController.text));
      heightFlag = true;
    }
    setState(() {
      if (weightFlag && heightFlag) {
        bmi = weight / (height * height);
        if (bmi < 20)
          status = 'کسر وزن';
        else if (bmi >= 20 && bmi < 25)
          status = 'وزن نرمال';
        else if (bmi >= 25 && bmi < 27)
          status = 'اضافه وزن';
        else if (bmi >= 27) status = 'چاق';
      }
    });
  }

  void _validation(BuildContext context) async {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        dateController.text.isEmpty ||
        numberController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'اطلاعات را بصورت کامل وارد نمایید',
        backgroundColor: Color.fromARGB(255, 218, 86, 152).withOpacity(0.8),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/MainPage');
      _saveProfileData(
        nameController.text,
        int.parse(ageController.text),
        double.parse(heightController.text),
        double.parse(weightController.text),
        dateController.text,
        int.parse(numberController.text),
      );
    }
  }

  void _setMotherData() async {
    mom = await loadProfileData();
    setState(() {
      if (mom.name != null &&
          mom.height != null &&
          mom.weight != null &&
          mom.number != null &&
          mom.date != null &&
          mom.age != null) notNull = true;
    });
  }

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
    _setMotherData();
    _loadBmiStatus();
  }

  @override
  Widget build(BuildContext context) {
    Widget got = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 32, right: 32, top: 20),
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
                                      hintText: notNull ? mom.name : null,
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
                                      hintText:
                                          notNull ? mom.age.toString() : null,
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
                                          ? mom.height
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
                                          ? mom.weight.toString()
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
                                      hintText:
                                          notNull ? mom.date.toString() : null,
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
                                          ? mom.number.toString()
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
                                  _calculateBmiStatus();
//                                  Navigator.pop(context);
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
                                              bmi.toStringAsFixed(2).toString(),
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
                            _validation(context);
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
                  margin: EdgeInsets.only(left: 32, right: 32, top: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
                                                  builder:
                                                      (BuildContext context) =>
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
        body: got,
      ),
    );
  }
}
