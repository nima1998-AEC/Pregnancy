import 'dart:async';
import 'MotherPropoerties.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget sik;

Future<void> _saveTable(
    BuildContext context, String week, List<String> data) async {
  final pref = await SharedPreferences.getInstance();
  pref.setStringList(week, data);
}

Future<List<String>> loadTable(String week) async {
  List<String> data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getStringList(week);
  return data;
}

Future<MotherProperties> loadProfileData() async {
  MotherProperties motherProperties;
  final prefs = await SharedPreferences.getInstance();
  String date = prefs.getString('date');
  String name = prefs.getString('name');

  int age = prefs.getInt('age');
  int number = prefs.getInt('number');

  double height = prefs.getDouble('height');
  double weight = prefs.getDouble('weight');
  double bmi = prefs.getDouble('bmi');
  motherProperties = new MotherProperties(
    name: name,
    age: age,
    weight: weight,
    height: height,
    number: number,
    date: date,
    bmi: bmi,
  );

//  print(name);
//  print(age);
//  print(height);
//  print(weight);
//  print(date);
//  print(number);
  return motherProperties;
}

void main() => runApp(LoadPage());

class LoadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadPage();
}

class _LoadPage extends State<LoadPage> {
  startTime() async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    await setDatas();

    MotherProperties motherProperties = await loadProfileData();
    if (motherProperties.date != null &&
        motherProperties.number != null &&
        motherProperties.height != null &&
        motherProperties.weight != null &&
        motherProperties.age != null &&
        motherProperties.name != null) {
      print("user already saved");
      Navigator.of(context).pushReplacementNamed('/MainPage');
    } else {
      print("user not saved");
      Navigator.of(context).pushReplacementNamed('/ProfilePage');
    }
  }

  Future setDatas() async {
    await tableData([
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
      '0.0',
    ], 'week1');
    await tableData([
      '0.04',
      '0.25',
      '0.04',
      '0.25',
      '0.04',
      '0.25',
      '0.04',
      '0.25',
      '0.16',
      '0.2',
      '0.16',
      '0.2',
      '0.16',
      '0.2',
    ], 'week2');
    await tableData([
      '0.08',
      '0.5',
      '0.08',
      '0.5',
      '0.08',
      '0.5',
      '0.08',
      '0.5',
      '0.32',
      '0.4',
      '0.32',
      '0.4',
      '0.32',
      '0.4',
    ], 'week3');

    await tableData([
      '0.12',
      '0.7',
      '0.12',
      '0.7',
      '0.12',
      '0.7',
      '0.12',
      '0.7',
      '0.48',
      '0.6',
      '0.48',
      '0.6',
      '0.48',
      '0.6',
    ], 'week4');
    await tableData([
      '0.16',
      '0.9',
      '0.16',
      '0.9',
      '0.16',
      '0.9',
      '0.16',
      '0.9',
      '0.60',
      '0.8',
      '0.60',
      '0.8',
      '0.60',
      '0.8',
    ], 'week5');
    await tableData([
      '0.2',
      '1.0',
      '0.2',
      '1.0',
      '0.2',
      '1.0',
      '0.2',
      '1.0',
      '0.72',
      '1.0',
      '0.72',
      '1.0',
      '0.72',
      '1.0',
    ], 'week6');
    await tableData([
      '0.24',
      '1.12',
      '0.24',
      '1.12',
      '0.24',
      '1.12',
      '0.24',
      '1.12',
      '0.85',
      '1.25',
      '0.85',
      '1.25',
      '0.85',
      '1.25',
    ], 'week7');

    await tableData([
      '0.28',
      '1.25',
      '0.28',
      '1.25',
      '0.28',
      '1.25',
      '0.28',
      '1.25',
      '1.0',
      '1.50',
      '1.0',
      '1.50',
      '1.0',
      '1.50',
    ], 'week8');

    await tableData([
      '0.32',
      '1.37',
      '0.32',
      '1.37',
      '0.32',
      '1.37',
      '0.32',
      '1.37',
      '1.1',
      '1.7',
      '1.1',
      '1.7',
      '1.1',
      '1.7',
    ], 'week9');
    await tableData([
      '0.36',
      '1.5',
      '0.36',
      '1.5',
      '0.36',
      '1.5',
      '0.36',
      '1.5',
      '1.2',
      '1.9',
      '1.2',
      '1.9',
      '1.2',
      '1.9',
    ], 'week10');

    await tableData([
      '0.4',
      '1.68',
      '0.4',
      '1.68',
      '0.4',
      '1.68',
      '0.4',
      '1.68',
      '1.3',
      '2.1',
      '1.3',
      '2.1',
      '1.3',
      '2.1',
    ], 'week11');
    await tableData([
      '0.44',
      '1.85',
      '0.44',
      '1.85',
      '0.44',
      '1.85',
      '0.44',
      '1.85',
      '1.4',
      '2.3',
      '1.4',
      '2.3',
      '1.4',
      '2.3',
    ], 'week12');
    await tableData([
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '1.5',
      '2.5',
      '1.5',
      '2.5',
      '1.5',
      '2.5',
    ], 'week13');

    await tableData([
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '0.5',
      '2.0',
      '1.5',
      '2.5',
      '1.5',
      '2.5',
      '1.5',
      '2.5',
    ], 'week14');

    await tableData([
      '1.3',
      '3.0',
      '1.3',
      '3.0',
      '0.9',
      '2.6',
      '0.8',
      '2.5',
      '2.6',
      '4.1',
      '2.4',
      '3.9',
      '2.2',
      '3.6',
    ], 'week15');

    await tableData([
      '1.7',
      '3.5',
      '1.7',
      '3.5',
      '1.1',
      '2.9',
      '0.95',
      '2.75',
      '3.15',
      '4.9',
      '2.85',
      '4.6',
      '2.55',
      '4.15',
    ], 'week16');

    await tableData([
      '2.1',
      '4.0',
      '2.1',
      '4.0',
      '1.3',
      '3.1',
      '1.1',
      '3.0',
      '3.7',
      '5.7',
      '3.3',
      '5.3',
      '2.9',
      '4.9',
    ], 'week17');
    await tableData([
      '2.5',
      '5.0',
      '2.5',
      '4.5',
      '1.5',
      '3.4',
      '1.3',
      '3.25',
      '4.25',
      '6.5',
      '3.75',
      '6.0',
      '3.25',
      '5.25',
    ], 'week18');
    await tableData([
      '2.9',
      '5.5',
      '2.9',
      '5.0',
      '1.7',
      '3.6',
      '1.5',
      '3.5',
      '4.8',
      '7.3',
      '4.2',
      '6.7',
      '3.6',
      '5.8',
    ], 'week19');
    await tableData([
      '3.3',
      '6.0',
      '3.3',
      '5.5',
      '1.9',
      '3.8',
      '1.65',
      '3.75',
      '5.35',
      '8.1',
      '4.65',
      '7.4',
      '4.0',
      '6.5',
    ], 'week20');
    await tableData([
      '3.7',
      '6.5',
      '3.7',
      '6.0',
      '2.0',
      '4.0',
      '1.8',
      '4.0',
      '6.0',
      '9.0',
      '5.1',
      '8.1',
      '4.35',
      '7.1',
    ], 'week21');
    await tableData([
      '4.1',
      '7.0',
      '4.0',
      '6.5',
      '2.3',
      '4.5',
      '1.95',
      '4.25',
      '6.55',
      '9.8',
      '5.5',
      '9.0',
      '4.7',
      '7.7',
    ], 'week22');
    await tableData([
      '4.5',
      '7.5',
      '4.4',
      '7.0',
      '2.6',
      '5.0',
      '2.1',
      '4.5',
      '7.1',
      '10.6',
      '6.0',
      '9.75',
      '5.05',
      '8.3',
    ], 'week23');
    await tableData([
      '5.0',
      '8.0',
      '4.8',
      '7.5',
      '2.9',
      '5.5',
      '2.25',
      '4.75',
      '7.65',
      '11.5',
      '6.5',
      '10.5',
      '5.4',
      '8.9',
    ], 'week24');
    await tableData([
      '5.5',
      '9.0',
      '5.2',
      '8.0',
      '3.2',
      '6.0',
      '2.4',
      '5.0',
      '8.25',
      '12.3',
      '7.0',
      '11.25',
      '5.7',
      '9.5',
    ], 'week25');
    await tableData([
      '6.0',
      '9.5',
      '5.5',
      '8.5',
      '3.5',
      '6.5',
      '2.5',
      '5.25',
      '8.8',
      '13.0',
      '7.5',
      '12.0',
      '6.0',
      '10.0',
    ], 'week26');
    await tableData([
      '6.4',
      '10.0',
      '5.9',
      '9.0',
      '3.7',
      '6.8',
      '2.67',
      '5.37',
      '9.35',
      '13.8',
      '7.95',
      '12.8',
      '6.35',
      '10.6',
    ], 'week27');
    await tableData([
      '6.8',
      '10.5',
      '6.3',
      '9.5',
      '3.9',
      '7.1',
      '2.84',
      '5.5',
      '10.0',
      '14.5',
      '8.4',
      '13.6',
      '6.7',
      '11.2',
    ], 'week28');
    await tableData([
      '7.2',
      '11.0',
      '6.7',
      '10.0',
      '4.1',
      '7.4',
      '3.0',
      '5.67',
      '10.5',
      '15.2',
      '8.85',
      '14.4',
      '7.05',
      '11.8',
    ], 'week29');
    await tableData([
      '7.6',
      '12.0',
      '7.1',
      '10.5',
      '4.4',
      '7.7',
      '3.17',
      '5.48',
      '11.0',
      '15.9',
      '9.3',
      '15.2',
      '7.4',
      '12.4',
    ], 'week30');
    await tableData([
      '8.0',
      '13.5',
      '7.5',
      '11.0',
      '4.7',
      '8.1',
      '3.34',
      '6.0',
      '11.5',
      '16.6',
      '9.75',
      '16.0',
      '7.75',
      '13.0',
    ], 'week31');
    await tableData([
      '8.4',
      '13.0',
      '7.9',
      '11.5',
      '5.0',
      '8.4',
      '3.5',
      '6.25',
      '12.0',
      '17.3',
      '10.2',
      '16.8',
      '8.1',
      '13.6',
    ], 'week32');
    await tableData([
      '8.8',
      '13.5',
      '8.3',
      '12.0',
      '5.3',
      '8.7',
      '3.67',
      '6.5',
      '12.5',
      '18.0',
      '10.6',
      '17.6',
      '8.4',
      '14.2',
    ], 'week33');

    await tableData([
      '9.2',
      '14.5',
      '8.7',
      '12.5',
      '5.5',
      '9.0',
      '3.84',
      '6.75',
      '13',
      '18.7',
      '11.0',
      '18.4',
      '8.7',
      '14.8',
    ], 'week34');
    await tableData([
      '9.6',
      '14.5',
      '9.1',
      '13',
      '5.7',
      '9.4',
      '4.0',
      '7.5',
      '13.5',
      '19.5',
      '11.4',
      '19.2',
      '9.0',
      '15.5',
    ], 'week35');
    await tableData([
      '10.0',
      '15.5',
      '9.5',
      '13.5',
      '5.9',
      '9.8',
      '4.17',
      '7.75',
      '14.1',
      '21.0',
      '11.8',
      '19.6',
      '9.35',
      '16.1',
    ], 'week36');
    await tableData([
      '10.5',
      '16.0',
      '9.9',
      '14.0',
      '6.1',
      '10.2',
      '4.34',
      '8.0',
      '14.7',
      '21.8',
      '12.2',
      '20.5',
      '9.7',
      '16.7',
    ], 'week37');
    await tableData([
      '11.0',
      '16.5',
      '10.3',
      '14.5',
      '6.3',
      '10.6',
      '4.5',
      '8.25',
      '15.3',
      '22.6',
      '12.6',
      '21.1',
      '10.0',
      '17.3',
    ], 'week38');
    await tableData([
      '11.5',
      '17.0',
      '10.7',
      '15.0',
      '6.5',
      '10.9',
      '4.67',
      '8.5',
      '15.9',
      '23.4',
      '13.0',
      '22.7',
      '10.35',
      '17.9',
    ], 'week39');
    await tableData([
      '12.0',
      '17.5',
      '11.1',
      '15.5',
      '6.7',
      '11.2',
      '4.84',
      '8.75',
      '16.5',
      '24.4',
      '13.5',
      '22.3',
      '10.7',
      '187',
    ], 'week40');
    await tableData([
      '12.5',
      '18.0',
      '11.5',
      '16.0',
      '7.0',
      '11.5',
      '5.0',
      '9.0',
      '17.0',
      '25.0',
      '14.0',
      '23.0',
      '11.0',
      '19.0',
    ], 'week41');
  }

  Future tableData(List<String> dataSet, String week) async {
    List<String> data = await loadTable(week);
    if (data != null) {
      print(week + ' : ' + data.toString());
    } else {
      _saveTable(context, week, dataSet);
      print(week + ' : ' + dataSet.toString() + 'Saved');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  bool runAnimation = false;

  @override
  Widget build(BuildContext context) {
    loadProfileData();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        runAnimation = true;
      });
    });

    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: GestureDetector(
          child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/LoadPage.png",
                  ),
                  fit: BoxFit.fill,
                )),
//          width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/header.png'))),
                      curve: Curves.fastOutSlowIn,
                      height: runAnimation ? 120 : 0,
                    ),
                    AnimatedContainer(
                      duration: Duration(
                        seconds: 1,
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/footer.png'))),
                      curve: Curves.fastOutSlowIn,
                      height: runAnimation ? 60 : 0,
                    ),
                  ],
                )),
          ),
        ));
  }
}
