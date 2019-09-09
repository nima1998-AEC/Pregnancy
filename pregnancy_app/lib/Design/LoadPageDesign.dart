import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pregnancy_app/Source/LoadingFunctions.dart';
import 'package:pregnancy_app/Source/Other.dart';
import 'package:pregnancy_app/Source/SavingFunctions.dart';

class LoadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadPage();
}

class _LoadPage extends State<LoadPage> {
  bool runAnimation = false;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        runAnimation = true;
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: debugBanner(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/header.png'))),
                    curve: Curves.fastOutSlowIn,
                    height: runAnimation ? 120 : 0,
                  ),
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds: 1000,
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
      ),
    );
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    loadProfileData().then((motherProperties) {
      if (motherProperties.date != null &&
          motherProperties.number != null &&
          motherProperties.height != null &&
          motherProperties.weight != null &&
          motherProperties.age != null &&
          motherProperties.name != null) {
        debugPrint("User information is saved, Navigation to Main Page ... ");
        Navigator.of(context).pushReplacementNamed('/MainPage');
      } else {
        debugPrint(
            "User information is`t saved, Navigation to Profile Page ... ");
        Navigator.of(context).pushReplacementNamed('/ProfilePage');
        normalWeekWeightDataList();
      }
    });

    // SharedPreferences sp = await SharedPreferences.getInstance();
    // int tableSize = sp.getInt('tableSize');
    // if (tableSize < 41) await normalWeekWeightDataList();
  }
}
