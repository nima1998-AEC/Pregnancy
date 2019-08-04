import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
import 'package:pregnancy_app/HistoryPage.dart';
import 'package:pregnancy_app/LoadPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Chart.dart';
import 'MotherPropoerties.dart';
import 'ProfilePage.dart';

class AddWeight extends StatefulWidget {
  _AddWeight createState() => _AddWeight();
}

class _AddWeight extends State<AddWeight> {
  String weekController = '';
  final dateController = TextEditingController();
  final weightController = TextEditingController();

  PersianDatePickerWidget persianDatePicker;
  String field1 = '';
  String field2 = '';
  String field3 = '';
  double firstWeight = 0.0;
  double lastWeight = 0.0;
  String weekKey;
  var scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
    loadLastWeight(context);
  }

  Future<void> saveWeeklyWeight(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    if (weekController == 'هفته اول')
      weekKey = '1';
    else if (weekController == 'هفته دوم')
      weekKey = '2';
    else if (weekController == 'هفته سوم')
      weekKey = '3';
    else if (weekController == 'هفته چهارم')
      weekKey = '4';
    else if (weekController == 'هفته پنجم')
      weekKey = '5';
    else if (weekController == 'هفته ششم')
      weekKey = '6';
    else if (weekController == 'هفته هفتم')
      weekKey = '7';
    else if (weekController == 'هفته هشتم')
      weekKey = '8';
    else if (weekController == 'هفته نهم')
      weekKey = '9';
    else if (weekController == 'هفته دهم')
      weekKey = '10';
    else if (weekController == 'هفته یازدهم')
      weekKey = '11';
    else if (weekController == 'هفته دوازدهم')
      weekKey = '12';
    else if (weekController == 'هفته سیزدهم')
      weekKey = '13';
    else if (weekController == 'هفته چهاردهم')
      weekKey = '14';
    else if (weekController == 'هفته پانزدهم')
      weekKey = '15';
    else if (weekController == 'هفته شانزدهم')
      weekKey = '16';
    else if (weekController == 'هفته هفدهم')
      weekKey = '17';
    else if (weekController == 'هفته هجدهم')
      weekKey = '18';
    else if (weekController == 'هفته نوزدهم')
      weekKey = '19';
    else if (weekController == 'هفته بیستم')
      weekKey = '20';
    else if (weekController == 'هفته بیست و یکم')
      weekKey = '21';
    else if (weekController == 'هفته بیست و دوم')
      weekKey = '22';
    else if (weekController == 'هفته بیست و سوم')
      weekKey = '23';
    else if (weekController == 'هفته بیست و چهارم')
      weekKey = '24';
    else if (weekController == 'هفته بیست پنجم')
      weekKey = '25';
    else if (weekController == 'هفته بیست و ششم')
      weekKey = '26';
    else if (weekController == 'هفته بیست و هفتم')
      weekKey = '27';
    else if (weekController == 'هفته بیست و هشتم')
      weekKey = '28';
    else if (weekController == 'هفته بیست و نهم')
      weekKey = '29';
    else if (weekController == 'هفته سی ام')
      weekKey = '30';
    else if (weekController == 'هفته سی و یکم')
      weekKey = '31';
    else if (weekController == 'هفته سی و دوم')
      weekKey = '32';
    else if (weekController == 'هفته سی و سوم')
      weekKey = '33';
    else if (weekController == 'هفته سی و چهارم')
      weekKey = '34';
    else if (weekController == 'هفته سی و پنجم')
      weekKey = '35';
    else if (weekController == 'هفته سی و ششم')
      weekKey = '36';
    else if (weekController == 'هفته سی و هفتم')
      weekKey = '37';
    else if (weekController == 'هفته سی و هشتتم')
      weekKey = '38';
    else if (weekController == 'هفته سی و نهم')
      weekKey = '39';
    else if (weekController == 'هفته چهلم')
      weekKey = '40';
    else if (weekController == 'هفته چهل و یکم') weekKey = '41';

    List<String> weeklyWeight = [
      weekKey,
      weightController.text,
      dateController.text,
    ];
    String s = pref.getString('lastWeek');
    List<String> c = pref.getStringList(s);
    double l = double.parse(c[1]);
    pref.setDouble(
        'lastChange', (l - double.parse(weightController.text)).abs());
    pref.setStringList(weekKey, weeklyWeight);
    pref.setDouble('lastWeight', double.parse(weightController.text));
    pref.setString('lastWeek', weekKey);
  }

  Future<void> calucate(BuildContext context) async {
    if (weekController == 'هفته اول')
      weekKey = '1';
    else if (weekController == 'هفته دوم')
      weekKey = '2';
    else if (weekController == 'هفته سوم')
      weekKey = '3';
    else if (weekController == 'هفته چهارم')
      weekKey = '4';
    else if (weekController == 'هفته پنجم')
      weekKey = '5';
    else if (weekController == 'هفته ششم')
      weekKey = '6';
    else if (weekController == 'هفته هفتم')
      weekKey = '7';
    else if (weekController == 'هفته هشتم')
      weekKey = '8';
    else if (weekController == 'هفته نهم')
      weekKey = '9';
    else if (weekController == 'هفته دهم')
      weekKey = '10';
    else if (weekController == 'هفته یازدهم')
      weekKey = '11';
    else if (weekController == 'هفته دوازدهم')
      weekKey = '12';
    else if (weekController == 'هفته سیزدهم')
      weekKey = '13';
    else if (weekController == 'هفته چهاردهم')
      weekKey = '14';
    else if (weekController == 'هفته پانزدهم')
      weekKey = '15';
    else if (weekController == 'هفته شانزدهم')
      weekKey = '16';
    else if (weekController == 'هفته هفدهم')
      weekKey = '17';
    else if (weekController == 'هفته هجدهم')
      weekKey = '18';
    else if (weekController == 'هفته نوزدهم')
      weekKey = '19';
    else if (weekController == 'هفته بیستم')
      weekKey = '20';
    else if (weekController == 'هفته بیست و یکم')
      weekKey = '21';
    else if (weekController == 'هفته بیست و دوم')
      weekKey = '22';
    else if (weekController == 'هفته بیست و سوم')
      weekKey = '23';
    else if (weekController == 'هفته بیست و چهارم')
      weekKey = '24';
    else if (weekController == 'هفته بیست پنجم')
      weekKey = '25';
    else if (weekController == 'هفته بیست و ششم')
      weekKey = '26';
    else if (weekController == 'هفته بیست و هفتم')
      weekKey = '27';
    else if (weekController == 'هفته بیست و هشتم')
      weekKey = '28';
    else if (weekController == 'هفته بیست و نهم')
      weekKey = '29';
    else if (weekController == 'هفته سی ام')
      weekKey = '30';
    else if (weekController == 'هفته سی و یکم')
      weekKey = '31';
    else if (weekController == 'هفته سی و دوم')
      weekKey = '32';
    else if (weekController == 'هفته سی و سوم')
      weekKey = '33';
    else if (weekController == 'هفته سی و چهارم')
      weekKey = '34';
    else if (weekController == 'هفته سی و پنجم')
      weekKey = '35';
    else if (weekController == 'هفته سی و ششم')
      weekKey = '36';
    else if (weekController == 'هفته سی و هفتم')
      weekKey = '37';
    else if (weekController == 'هفته سی و هشتتم')
      weekKey = '38';
    else if (weekController == 'هفته سی و نهم')
      weekKey = '39';
    else if (weekController == 'هفته چهلم')
      weekKey = '40';
    else if (weekController == 'هفته چهل و یکم') weekKey = '41';

    final sp = await SharedPreferences.getInstance();
    String numberWeek;
    int childNumber;
    List<String> normalWeeklyWeight;

    MotherProperties motherProperties = await loadProfileData();

    firstWeight = sp.getDouble('weight');
    lastWeight = sp.getDouble('lastWeight');
    numberWeek = numberWeek = 'week' + weekKey;
    childNumber = motherProperties.number;
    normalWeeklyWeight = sp.getStringList(numberWeek);
    // print('firstWeight : $firstWeight');
    // print('lastWeight : $lastWeight');
    // print('Normal Weekly Weight : $normalWeeklyWeight');
    setState(() {
      field1 = (firstWeight - double.parse(weightController.text))
          .abs()
          .toStringAsFixed(2)
          .toString();
      field2 = (lastWeight - double.parse(weightController.text))
          .abs()
          .toStringAsFixed(2)
          .toString();

      if (childNumber == 1) {
        if (double.parse(field2) >= double.parse(normalWeeklyWeight[0]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[1]))
          field3 = 'کم وزن';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[2]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[3]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[4]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[5]))
          field3 = 'اضافه وزن';
        else
          field3 = 'چاق';
      } else if (childNumber == 2) {
        if (double.parse(field2) >= double.parse(normalWeeklyWeight[8]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[9]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[10]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[11]))
          field3 = 'اضافه وزن';
        else
          field3 = 'چاق';
      }
    });

    // print('field1 $field1');
    // print('field2 $field2');
    // print('field3 $field3');
  }

  Future<void> loadLastWeight(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    double lastChange = pref.getDouble('lastChange');
    setState(() {
      lastWeight = pref.getDouble('lastWeight');
      firstWeight = pref.getDouble('weight');
      field1 = (firstWeight - lastWeight).abs().toStringAsFixed(2).toString();
      field2 = lastChange.toStringAsFixed(2).toString();
    });
    status();
    weightController.text = '';
  }

  Future<void> status() async {
    final sp = await SharedPreferences.getInstance();
    String numberWeek;
    int childNumber;
    List<String> normalWeeklyWeight;

    MotherProperties motherProperties = await loadProfileData();
    numberWeek = sp.getString('lastWeek');
    print('Number Week : $numberWeek');
    numberWeek = 'week' + numberWeek;
    childNumber = motherProperties.number;
    normalWeeklyWeight = sp.getStringList(numberWeek);

    setState(() {
      if (childNumber == 1) {
        if (double.parse(field2) >= double.parse(normalWeeklyWeight[0]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[1]))
          field3 = 'کم وزن';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[2]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[3]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[4]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[5]))
          field3 = 'اضافه وزن';
        else
          field3 = 'چاق';
      } else if (childNumber == 2) {
        if (double.parse(field2) >= double.parse(normalWeeklyWeight[8]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[9]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(normalWeeklyWeight[10]) &&
            double.parse(field2) <= double.parse(normalWeeklyWeight[11]))
          field3 = 'اضافه وزن';
        else
          field3 = 'چاق';
      }
    });
  }

  void validation(BuildContext context) {
    if (weekController.isEmpty ||
        weightController.text.isEmpty ||
        dateController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'اطلاعات را بصورت کامل وارد نمایید',
        backgroundColor: Color.fromARGB(255, 218, 86, 152).withOpacity(0.8),
      );
    } else {
      saveWeeklyWeight(context);
      loadLastWeight(context);
      getData();
      Navigator.pushReplacementNamed(context, "/MainPage");

//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>MainPage(intent:'addweight')));
//    Navigator.pop(context);

    }
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
                scaffoldKey2.currentState.openEndDrawer();
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
    Widget got = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          appBar(),
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
                                left: 2.0, top: 8.0, right: 8.0),
                            padding: EdgeInsets.only(right: 5, left: 5),
                            child: Text(
                              "ثبت وزن هفتگی",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 218, 86, 152)),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                        textDirection: TextDirection.rtl,
                      ),
                      Directionality(
                        child: Container(
                          child: DropdownButton(
                              hint: weekController.isEmpty
                                  ? Text(
                                      "هفته بارداری",
                                    )
                                  : Text(
                                      weekController,
                                    ),
                              isExpanded: true,
                              items: <String>[
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
                              ].map<DropdownMenuItem>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  weekController = value;
                                });
                              }),
                          margin: EdgeInsets.all(10.0),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Directionality(
                        child: Container(
                          child: TextFormField(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration:
                                InputDecoration(hintText: "وزن(کیلوگرم)"),
                            controller: weightController,
                          ),
                          margin: EdgeInsets.all(10.0),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Directionality(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: 'تاریخ ثبت'),
                            enableInteractiveSelection: true,
                            onTap: () {
                              FocusScope.of(context).requestFocus(
                                  new FocusNode()); // to prevent opening default keyboard
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return persianDatePicker;
                                  });
                            },
                            controller: dateController,
                          ),
                          margin: EdgeInsets.all(10.0),
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
                                  'محاسبه',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 221, 85, 153),
                                      fontSize: 16,
                                      fontFamily: "Yekan"),
                                ),
                              ],
                            ),
                            onPressed: () {
                              if (weekController.isEmpty ||
                                  weightController.text.isEmpty ||
                                  dateController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'اطلاعات را بصورت کامل وارد نمایید',
                                  backgroundColor:
                                      Color.fromARGB(255, 218, 86, 152)
                                          .withOpacity(0.8),
                                );
                              } else {
                                calucate(context);
                                // saveWeeklyWeight(context);
                                // loadLastWeight(context);
                                // getData();
                                // Navigator.pushReplacementNamed(context, "/MainPage");
                              }
                              //  calculateBmi();
//                            Navigator.pop(context);
                            }),
                        margin: EdgeInsets.all(16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 32, left: 32, top: 12),
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
                            FontAwesomeIcons.weight,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 18.0),
                            child: Text(
                              "تغییر از ابتدای بارداری",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Terafik',
                                color: Color.fromARGB(255, 221, 85, 153),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 221, 85, 153),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          margin: EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: field1 == ''
                              ? Text('')
                              : Text(
                                  field1,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Sans'),
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
                          child: Icon(
                            FontAwesomeIcons.audible,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 18.0),
                            child: Text(
                              'تغییر نسبت به هفته قبل',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Terafik',
                                color: Color.fromARGB(255, 221, 85, 153),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 221, 85, 153),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          margin: EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: field2 == ''
                              ? Text('')
                              : Text(
                                  field2,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Sans', color: Colors.white),
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
                          child: Icon(
                            FontAwesomeIcons.userClock,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 18.0),
                            child: Text(
                              'وضعیت رشد وزن',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Terafik',
                                color: Color.fromARGB(255, 221, 85, 153),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 221, 85, 153),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          margin: EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: field3 == ''
                              ? Text('')
                              : Text(
                                  field3,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Sans', color: Colors.white),
                                ),
                        ),
                      ],
                    ),
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
                                  fontFamily: 'Yekan',
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            validation(context);
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
                                  fontFamily: 'Yekan',
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey2,
        body: got,
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
                                    "مشاهده روند رشد",
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
                                                HistoryPage()));
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
      ),
    );
  }
}
