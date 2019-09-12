import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pregnancy_app/Design/IntroPage_B.dart';

class IntroPageA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroPageA();
}

class _IntroPageA extends State<IntroPageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 81.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Color.fromARGB(255, 221, 85, 153),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "سلامت مادر و جنین در دوران بارداری تا حد زیادی وابسته به نوع تغذیه و مقدار وزنگیری مادر در طول دوران بارداری است. شما میتوانید با استفاده از امکانات این نرم افزار ضمن اطلاع از روند وزنگیری خود در طول بارداری، از راهنمایی‌های ارایه شده برای اصلاح الگوی تغذیه خود استفاده کنید",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.0, fontFamily: "Yekan ", wordSpacing: 3),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          child: Icon(
            Icons.arrow_forward,
            size: 40.0,
            color: Color.fromARGB(255, 221, 85, 153),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.6),
        elevation: 6.0,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (cnx) => IntroPageB(),
            ),
          );
        },
      ),
    );

    // Icon(
    //       FontAwesomeIcons.arrowAltCircleRight,
    //       size: 50,
    //       color: Color.fromARGB(255, 221, 85, 153),
    //     ),
  }
}
