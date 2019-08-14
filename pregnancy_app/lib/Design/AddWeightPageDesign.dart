import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

import 'package:pregnancy_app/Drawer/AddWeightPageDrawer.dart';
import 'package:pregnancy_app/Source/AddWeightPageSource.dart';
import 'package:pregnancy_app/Source/Other.dart';

class AddWeightPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddWeightPage();
}

class _AddWeightPage extends State<AddWeightPage> {
  var scaffoldKey2 = GlobalKey<ScaffoldState>();

  PersianDatePickerWidget persianDatePicker;
  final dateController = TextEditingController();
  final weightController = TextEditingController();

  String weekController = '';
  String field1 = '';
  String field2 = '';
  String field3 = '';

  @override
  void initState() {
    super.initState();
    persianDatePickerWidget();
    callFunctions();
    debugPrint('call Functions in AddWeigth ...');
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          appBar(scaffoldKey2),
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
                              items: weeksList()
                                  .map<DropdownMenuItem>((String value) {
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
                              bool _valid = calucateValidation(
                                  weekController, weightController.text);
                              if (_valid) {
                                callCalucateFunction();
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'اطلاعات را بصورت کامل وارد نمایید',
                                  backgroundColor:
                                      Color.fromARGB(255, 218, 86, 152)
                                          .withOpacity(0.8),
                                );
                              }
                            }),
                        margin: EdgeInsets.all(16.0),
                      ),
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
                                  fontFamily: 'Yekan',
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            validation(context, weekController,
                                weightController.text, dateController.text);
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
      debugShowCheckedModeBanner: debugBanner(),
      home: Scaffold(
        key: scaffoldKey2,
        body: widget,
        endDrawer: AddWeightDrawer(),
      ),
    );
  }

  void persianDatePickerWidget() {
    persianDatePicker = PersianDatePicker(
      headerTodayBackgroundColor: Colors.pink[100],
      currentDayBackgroundColor: Colors.pink[100],
      headerTodayIcon: Icon(
        Icons.calendar_today,
        color: Colors.black,
        size: 18,
      ),
      showGregorianDays: true,
      monthSelectionAnimationCurve: Curves.fastOutSlowIn,
      farsiDigits: false,
      gregorianDaysLocation: GregorianDaysLocation.topLeft,
      weekCaptionsBackgroundColor: Color.fromARGB(255, 218, 86, 152),
      selectedDayBackgroundColor: Color.fromARGB(255, 218, 86, 152),
      controller: dateController,
    ).init();
  }

  Future<void> callFunctions() async {
    String _setWeightChangeFromScratch,
        _setweightChangeFromLastWeek,
        _setStatus;
    _setWeightChangeFromScratch = await setWeightChangeFromScratch();
    _setweightChangeFromLastWeek = await setWeightChangeFromLastWeek();
    _setStatus = await setStatus();
    setState(() {
      field1 = _setWeightChangeFromScratch;
      field2 = _setweightChangeFromLastWeek;
      field3 = _setStatus;
    });
  }

  void callCalucateFunction() {
    setState(() {
      calucate(weightController.text, weekController).then((onValue) {
        field1 = onValue[0];
        field2 = onValue[1];
        field3 = onValue[2];
      });
    });
  }
}
