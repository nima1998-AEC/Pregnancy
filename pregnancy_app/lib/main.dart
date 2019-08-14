import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_app/Design/LoadPageDesign.dart';

import 'package:pregnancy_app/Design/MainPageDesign.dart';
import 'package:pregnancy_app/Design/ProfilePageDesign.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }


//   firstOpenChecker() async {
//     DateTime now, secondNow;
//     String time;
//     final isFirstOpen = await SharedPreferences.getInstance();
//     if (isFirstOpen.getString('deadline') != null) {
//       print("still time to deadline");
//       time = isFirstOpen.getString('deadline');
// //      parsingFirstDate = DateTime(time);
//       secondNow = DateTime.now();
//       print(secondNow.toString());
//       if (secondNow.difference(now) >= Duration(days: 1)) {}
//     } else {
//       now = DateTime.now();
//       isFirstOpen.setString('deadline', now.toString());
//       print(now.toString());
//     }
//   }

  @override
  Widget build(BuildContext context) {
//    firstOpenChecker();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
//    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/MainPageDesign': (BuildContext context) => new MainPage(),
        '/ProfilePage': (BuildContext context) => new ProfilePage(),
      },
      home: Scaffold(
        backgroundColor: Color.fromRGBO(250, 246, 244, 10),
        body: LoadPage(),
      ),
    );
  }
}
