import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
import 'package:pregnancy_app/LoadPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Chart.dart';
import 'MainPage.dart';
import 'MotherPropoerties.dart';
import 'package:persian_datepicker/persian_datetime.dart';

class AddWeight extends StatefulWidget {
  _AddWeight createState() => _AddWeight();
}

class _AddWeight extends State<AddWeight> {
  String weekController = '';
  final dateController = TextEditingController();
  final weightController = TextEditingController();

  PersianDatePickerWidget persianDatePicker;
  String field1 = '0.0';
  String field2 = '0.0';
  String field3 = 'نامعلوم';
  double firstWeight = 0.0;
  double lastWeight = 0.0;
  String weekKey;

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

  Future<void> loadLastWeight(BuildContext context) async {
    status();
    final pref = await SharedPreferences.getInstance();
    double lastChange = pref.getDouble('lastChange');

    setState(() {
      lastWeight = pref.getDouble('lastWeight');
      firstWeight = pref.getDouble('weight');
      field1 = (firstWeight - lastWeight).abs().toStringAsFixed(2).toString();
      field2 = lastChange.toStringAsFixed(2).toString();
    });
    weightController.text = '';
  }

  Future<void> status() async {
    final pref = await SharedPreferences.getInstance();

    String lastDate = pref.getString('date');
    PersianDateTime lastDates = PersianDateTime(jalaaliDateTime: lastDate);
    PersianDateTime nowDates = PersianDateTime();
    int numberWeek = (nowDates.difference(lastDates).inDays / 7).toInt();
    if (numberWeek % 7 != 0 || numberWeek == 0) numberWeek++;
    String w = 'week' + numberWeek.toString();
    List<String> list = pref.getStringList(w);
    MotherProperties motherProperties = await loadProfileData();
    int number = motherProperties.number;

    setState(() {
      if (number == 1) {
        if (double.parse(field2) < double.parse(list[0]))
          field3 = 'ثابت';
        else if (double.parse(field2) >= double.parse(list[0]) &&
            double.parse(field2) <= double.parse(list[1]))
          field3 = 'کم وزن';
        else if (double.parse(field2) >= double.parse(list[2]) &&
            double.parse(field2) <= double.parse(list[3]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(list[4]) &&
            double.parse(field2) <= double.parse(list[5]))
          field3 = 'اضافه وزن';
        else if (double.parse(field2) >= double.parse(list[6]) &&
            double.parse(field2) <= double.parse(list[7]))
          field3 = 'چاق';
        else
          field3 = 'رشد نامتعارف';
      } else if (number == 2) {
        if (double.parse(field2) >= double.parse(list[8]) &&
            double.parse(field2) <= double.parse(list[9]))
          field3 = 'طبیعی';
        else if (double.parse(field2) >= double.parse(list[10]) &&
            double.parse(field2) <= double.parse(list[11]))
          field3 = 'اضافه وزن';
        else if (double.parse(field2) >= double.parse(list[12]) &&
            double.parse(field2) <= double.parse(list[13]))
          field3 = 'چاق';
        else
          field3 = 'رشد نامتعارف';
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

  @override
  Widget build(BuildContext context) {
    Widget got = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Expanded(
                child: Text(
                  "راهنمای آموزشی و مراقبتی مادران باردار",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Terafik',
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Container(
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                  ),
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
//                      Container(
//                        width: 140.0,
//                        child: RaisedButton(
//                          color: Colors.white,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(14.0),
//                            side: BorderSide(
//                                color: Color.fromARGB(255, 221, 85, 153),
//                                width: 2.0),
//                          ),
//                          child: Row(
//                            textDirection: TextDirection.rtl,
//                            children: <Widget>[
//                              Icon(
//                                FontAwesomeIcons.solidCalendarCheck,
//                                color: Color.fromARGB(255, 221, 85, 153),
//                              ),
//                              Text(
//                                'BMI محاسبه',
//                                textAlign: TextAlign.center,
//                                style: TextStyle(
//                                    color: Color.fromARGB(255, 221, 85, 153),
//                                    fontSize: 16,
//                                    fontFamily: "Yekan"),
//                              ),
//                            ],
//                          ),
//                          onPressed: () {
//                            calculateBmi();
////                            Navigator.pop(context);
//                          },
//                        ),
//                        margin: EdgeInsets.all(16.0),
//                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16, top: 12),
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
                          child: Text(
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
                  margin: EdgeInsets.only(right: 16, left: 16, top: 12),
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
                          child: Text(
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
                  margin: EdgeInsets.only(right: 16, left: 16, top: 12),
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
                          child: Text(
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
                  margin: EdgeInsets.all(10.0),
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
    return Scaffold(
      body: got,
    );
  }
}
