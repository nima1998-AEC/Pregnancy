import 'package:pregnancy_app/Source/LoadingFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pregnancy_app/Model/MotherPropoerties.dart';
import 'package:pregnancy_app/Source/Other.dart';

Future<String> getWeek() async {
  final sp = await SharedPreferences.getInstance();

  String lastWeek, week;
  List<String> weeks = new List<String>();

  weeks = weeksList();
  lastWeek = sp.getString('lastWeek');
  print("lastWeek =======> $lastWeek");
  week = weeks[int.parse(lastWeek)];

  return week;
}

Future<String> getWeight() async {
  final sp = await SharedPreferences.getInstance();

  double lastWeight;
  String weight;

  lastWeight = sp.getDouble('lastWeight');
  weight = lastWeight.toStringAsFixed(2).toString();

  return weight;
}

Future<String> getGrowing() async {
  final sp = await SharedPreferences.getInstance();

  double firstWeight, lastWeight, difference;
  String growing;

  firstWeight = sp.getDouble('weight');
  lastWeight = sp.getDouble('lastWeight');
  difference = (lastWeight - firstWeight);
  growing = difference.toStringAsFixed(2).toString();

  return growing;
}

Future<String> getStatus() async {
  final sp = await SharedPreferences.getInstance();
  MotherProperties motherProperties;
  String lastWeek, status, growing;
  int fetusNumber;
  List<String> normalGrowingList;

  motherProperties = await loadProfileData();
  growing = await getGrowing();

  fetusNumber = motherProperties.number;
  lastWeek = sp.getString('lastWeek');
  normalGrowingList = sp.getStringList('week' + lastWeek);

  if (fetusNumber == 1) {
    if (double.parse(growing) >= double.parse(normalGrowingList[0]) &&
        double.parse(growing) <= double.parse(normalGrowingList[1]))
      status = 'کم وزن';
    else if (double.parse(growing) >= double.parse(normalGrowingList[2]) &&
        double.parse(growing) <= double.parse(normalGrowingList[3]))
      status = 'طبیعی';
    else if (double.parse(growing) >= double.parse(normalGrowingList[4]) &&
        double.parse(growing) <= double.parse(normalGrowingList[5]))
      status = 'اضافه وزن';
    else
      status = 'چاق';
  } else if (fetusNumber == 2) {
    if (double.parse(growing) >= double.parse(normalGrowingList[8]) &&
        double.parse(growing) <= double.parse(normalGrowingList[9]))
      status = 'طبیعی';
    else if (double.parse(growing) >= double.parse(normalGrowingList[10]) &&
        double.parse(growing) <= double.parse(normalGrowingList[11]))
      status = 'اضافه وزن';
    else
      status = 'چاق';
  }

  print("status : $status");
  return status;
}
