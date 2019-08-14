import 'package:pregnancy_app/Model/MotherPropoerties.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> loadTable(String week) async {
  List<String> data;
  final sp = await SharedPreferences.getInstance();
  data = sp.getStringList(week);
  return data;
}

Future<MotherProperties> loadProfileData() async {
  MotherProperties _motherProperties;
  final sp = await SharedPreferences.getInstance();

  String name = sp.getString('name');
  int age = sp.getInt('age');
  double weight = sp.getDouble('weight');
  double height = sp.getDouble('height');
  int number = sp.getInt('number');
  String date = sp.getString('date');
  double bmi = sp.getDouble('bmi');
  String status = sp.getString('bmiStatus');
  _motherProperties = new MotherProperties(
    name: name,
    age: age,
    weight: weight,
    height: height,
    number: number,
    date: date,
    bmi: bmi,
    status: status,
  );
  return _motherProperties;
}
