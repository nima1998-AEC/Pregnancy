import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pregnancy_app/Source/WeekInformationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

String weight = '';
String growing = '';
List<String> min = ['0.0', ' 1.5', '7.5', '14.0'];
List<String> max = ['0.0', '2.5', '12.0', '23.0'];
List<int> weekIndex = [];
List<String> table = new List<String>();
List<WeekInformationBar> data;
List<WeekInformationBar> data1;
List<String> weeks = [
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
];

Future<void> getData() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  // int number = sp.getInt('number');
  // double bmi = sp.getDouble('bmi');
  double weight = sp.getDouble('weight');
  data = new List<WeekInformationBar>();
  data1 = new List<WeekInformationBar>();
  // min = new List<String>();
  // max = new List<String>();
  weekIndex = new List<int>();
  int i = 0;
  while (i < 41) {
    List<String> list = sp.getStringList((i + 1).toString());
    if (list != null) {
      WeekInformationBar wib = new WeekInformationBar(
        weekNumber: weeks[i],
        weight: double.parse(list[1]).toStringAsFixed(1),
      );
      data.add(wib);
      weekIndex.add(int.parse(list[0]));
    }
    i++;
  }

  // for (int i = 0; i < 41; i++) {
  //   if (i == 0 || i == 12 || i == 25 || i == 40) {
  //     List<String> row = sp.getStringList("week" + (i + 1).toString());
  //     if (number == 1) {
  //       if (bmi < 20) {
  //         min.add(row[0]);
  //         max.add(row[1]);
  //       } else if (bmi >= 20 && bmi < 25) {
  //         min.add(row[2]);
  //         max.add(row[3]);
  //       } else if (bmi >= 25 && bmi < 27) {
  //         min.add(row[4]);
  //         max.add(row[5]);
  //       } else if (bmi >= 27) {
  //         min.add(row[6]);
  //         max.add(row[7]);
  //       }
  //     } else if (number == 2) {
  //       if (bmi >= 20 && bmi < 25) {
  //         min.add(row[8]);
  //         max.add(row[9]);
  //       } else if (bmi >= 25 && bmi < 27) {
  //         min.add(row[10]);
  //         max.add(row[11]);
  //       } else if (bmi >= 27) {
  //         min.add(row[12]);
  //         max.add(row[13]);
  //       }
  //     }
  //   }
  // }

  for (int i = 0; i < data.length; i++) {
    if (i == 0) {
      WeekInformationBar wib = new WeekInformationBar(
        weekNumber: weeks[0],
        weight: data[0].weight.toString() + 'کیلوگرم',
        difference: '0.0',
      );

      data1.add(wib);
    } else {
      double diff = double.parse(data[i].weight) - weight;
      WeekInformationBar wib = new WeekInformationBar(
        weekNumber: data[i].weekNumber,
        weight: data[i].weight + 'کیلوگرم',
        difference: diff.toStringAsFixed(2).toString(),
      );
      data1.add(wib);
    }
  }
  // print('Week Index : $weekIndex');
}

class Chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Chart();
}

class _Chart extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      _createSampleData();
      getData();
    });
    return NumericComboLinePointChart.withSampleData();
  }
}

List<charts.Series<WeekWeight, double>> _createSampleData() {
  List<WeekWeight> downLine = new List<WeekWeight>();
  List<WeekWeight> midLine = new List<WeekWeight>();
  List<WeekWeight> upLine = new List<WeekWeight>();

  downLine.add(new WeekWeight(0.0, double.parse(min[0])));
  upLine.add(new WeekWeight(0.0, double.parse(max[0])));

  downLine.add(new WeekWeight(13.0, double.parse(min[1])));
  upLine.add(new WeekWeight(13.0, double.parse(max[1])));

  downLine.add(new WeekWeight(26.0, double.parse(min[2])));
  upLine.add(new WeekWeight(26.0, double.parse(max[2])));

  downLine.add(new WeekWeight(40.0, double.parse(min[3])));
  upLine.add(new WeekWeight(40.0, double.parse(max[3])));

  for (int i = 0; i < weekIndex.length; i++) {
    WeekWeight w1 = new WeekWeight(
      weekIndex[i].toDouble() - 1,
      double.parse(
        data1[i].difference.toString(),
      ),
    );
    midLine.add(w1);
  }

  return [
    new charts.Series<WeekWeight, double>(
      id: 'Down',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (WeekWeight weekWeight, _) => weekWeight.week,
      measureFn: (WeekWeight weekWeight, _) => weekWeight.weight,
      data: downLine,
    ),
    new charts.Series<WeekWeight, double>(
      id: 'Mid',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
      domainFn: (WeekWeight weekWeight, _) => weekWeight.week,
      measureFn: (WeekWeight weekWeight, _) => weekWeight.weight,
      data: midLine,
    ),
    new charts.Series<WeekWeight, double>(
      id: 'Up',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (WeekWeight weekWeight, _) => weekWeight.week,
      measureFn: (WeekWeight weekWeight, _) => weekWeight.weight,
      data: upLine,
    ),
  ];
}

class NumericComboLinePointChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NumericComboLinePointChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory NumericComboLinePointChart.withSampleData() {
    return new NumericComboLinePointChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.NumericComboChart(
      seriesList,
      animate: animate,
      // Configure the default renderer as a line renderer. This will be used
      // for any series that does not define a rendererIdKey.
      defaultRenderer: new charts.LineRendererConfig(),
      // Custom renderer configuration for the point series.
      customSeriesRenderers: [
        new charts.PointRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customPoint'),
      ],
    );
  }
}

class WeekWeight {
  final double week;
  final double weight;

  WeekWeight(this.week, this.weight);
}
