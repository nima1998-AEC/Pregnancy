import 'package:pregnancy_app/Source/Other.dart';
import 'package:pregnancy_app/Source/WeekInformationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> setWeek() async {
  final sp = await SharedPreferences.getInstance();
  String lastWeek = sp.getString('lastWeek');
  return weeksList()[int.parse(lastWeek) - 1];
}

Future<String> setWeight() async {
  final sp = await SharedPreferences.getInstance();
  double _weight = sp.getDouble('weight');
  return _weight.toString();
}

Future<String> setGrowing() async {
  final sp = await SharedPreferences.getInstance();
  double firstWeight = sp.getDouble('weight');
  double lastWeight = sp.getDouble('lastWeight');
  return (lastWeight - firstWeight).toStringAsFixed(2).toString();
}

Future<dynamic> getWeeks() async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  List<WeekInformationBar> data = new List<WeekInformationBar>();
  List<WeekInformationBar> data1 = new List<WeekInformationBar>();
  int i = 0;
  while (i < 41) {
    List<String> list = new List<String>();
    list = sp.getStringList((i + 1).toString());
    if (list != null) {
      data.add(
        new WeekInformationBar(
          weekNumber: weeksList()[i],
          weight: double.parse(list[1]).toStringAsFixed(1),
        ),
      );
    }
    i++;
  }
  for (int i = 0; i < data.length; i++) {
    if (i == 0) {
      WeekInformationBar wib = new WeekInformationBar(
        weekNumber: weeksList()[0],
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
  return data1;
}
