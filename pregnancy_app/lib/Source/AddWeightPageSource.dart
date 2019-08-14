import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pregnancy_app/Source/Other.dart';

Future<void> saveWeeklyWeight(
    String weekValue, String weightValue, String dateValue) async {
  final sp = await SharedPreferences.getInstance();

  List<String> weeklyWeight;
  String _weekKey;

  _weekKey = weekKey(weekValue);
  weeklyWeight = [_weekKey, weightValue, dateValue];
  sp.setStringList(_weekKey, weeklyWeight);

  String lastWeek = sp.getString('lastWeek');
  if (int.parse(_weekKey) > int.parse(lastWeek)) {
    List<String> lastWeeklyData = sp.getStringList(lastWeek);
    double lastWeeklyWeight = double.parse(lastWeeklyData[1]);

    sp.setDouble(
        'lastChange', (lastWeeklyWeight - double.parse(weightValue)).abs());
    sp.setDouble('lastWeight', double.parse(weightValue));
    sp.setString('lastWeek', _weekKey);

    debugPrint('Update Last Week,Weight,Change Wight ...');
  } else {
    debugPrint('Update Week$_weekKey Data');
  }
}

Future<String> setWeightChangeFromScratch() async {
  final sp = await SharedPreferences.getInstance();

  String _weightChangeFromScratch;
  double firstWeight, lastWeight;
  firstWeight = sp.getDouble('weight');
  lastWeight = sp.getDouble('lastWeight');
  _weightChangeFromScratch =
      (lastWeight - firstWeight).toStringAsFixed(2).toString();

  return _weightChangeFromScratch;
}

Future<String> setWeightChangeFromLastWeek() async {
  final sp = await SharedPreferences.getInstance();

  String _weightChangeFromLastWeek;
  double lastChange;

  lastChange = sp.getDouble('lastChange');
  _weightChangeFromLastWeek = lastChange.toStringAsFixed(2).toString();

  return _weightChangeFromLastWeek;
}

Future<String> setStatus() async {
  final sp = await SharedPreferences.getInstance();

  String _status = '';
  String _weightChangeFromLastWeek;
  String week;
  int fetusNumber;
  List<String> normalWeeklyWeight;

  fetusNumber = sp.getInt('number');

  week = 'week' + sp.getString('lastWeek');
  normalWeeklyWeight = sp.getStringList(week);

  _weightChangeFromLastWeek = await setWeightChangeFromLastWeek();

  if (fetusNumber == 1) {
    if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(normalWeeklyWeight[0]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(normalWeeklyWeight[1]))
      _status = 'کم وزن';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(normalWeeklyWeight[2]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(normalWeeklyWeight[3]))
      _status = 'طبیعی';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(normalWeeklyWeight[4]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(normalWeeklyWeight[5]))
      _status = 'اضافه وزن';
    else
      _status = 'چاق';
  } else if (fetusNumber == 2) {
    if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(normalWeeklyWeight[8]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(normalWeeklyWeight[9]))
      _status = 'طبیعی';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(normalWeeklyWeight[10]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(normalWeeklyWeight[11]))
      _status = 'اضافه وزن';
    else
      _status = 'چاق';
  }

  return _status;
}

void validation(BuildContext context, String weekValue, String weightValue,
    String dateValue) {
  if (weekValue.isEmpty || weightValue.isEmpty || dateValue.isEmpty) {
    Fluttertoast.showToast(
      msg: 'اطلاعات را بصورت کامل وارد نمایید',
      backgroundColor: Color.fromARGB(255, 218, 86, 152).withOpacity(0.8),
    );
  } else {
    saveWeeklyWeight(weekValue, weightValue, dateValue);
    // loadLastWeight(context);
    // getData();
    Navigator.pushReplacementNamed(context, "/MainPage");
  }
}

bool calucateValidation(String weekValue, String weightValue) {
  bool _valid;
  if (weekValue.isEmpty || weightValue.isEmpty) {
    _valid = false;
  } else {
    _valid = true;
  }
  return _valid;
}

Future<List<String>> calucate(String weightValue, String weekValue) async {
  final sp = await SharedPreferences.getInstance();

  List<String> _normalWeeklyWeight;
  String _weightChangeFromScratch,
      _weightChangeFromLastWeek,
      _status,
      _weekNumber;
  double _firstWeight, _lastWeight;
  int fetusNumber;

  // Weight Change From Scratch
  _firstWeight = sp.getDouble('weight');
  _weightChangeFromScratch =
      (double.parse(weightValue) - _firstWeight).toStringAsFixed(2).toString();

  // Weight Change From Last Week
  _lastWeight = sp.getDouble('lastWeight');
  _weightChangeFromLastWeek =
      (double.parse(weightValue) - _lastWeight).toStringAsFixed(2).toString();

  // Status
  fetusNumber = sp.getInt('number');
  _weekNumber = weekKey(weekValue);
  _normalWeeklyWeight = sp.getStringList('week' + _weekNumber);

  if (fetusNumber == 1) {
    if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(_normalWeeklyWeight[0]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(_normalWeeklyWeight[1]))
      _status = 'کم وزن';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(_normalWeeklyWeight[2]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(_normalWeeklyWeight[3]))
      _status = 'طبیعی';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(_normalWeeklyWeight[4]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(_normalWeeklyWeight[5]))
      _status = 'اضافه وزن';
    else
      _status = 'چاق';
  } else if (fetusNumber == 2) {
    if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(_normalWeeklyWeight[8]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(_normalWeeklyWeight[9]))
      _status = 'طبیعی';
    else if (double.parse(_weightChangeFromLastWeek) >=
            double.parse(_normalWeeklyWeight[10]) &&
        double.parse(_weightChangeFromLastWeek) <=
            double.parse(_normalWeeklyWeight[11]))
      _status = 'اضافه وزن';
    else
      _status = 'چاق';
  }

  return [_weightChangeFromScratch, _weightChangeFromLastWeek, _status];
}
