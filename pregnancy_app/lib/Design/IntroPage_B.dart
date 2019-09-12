import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pregnancy_app/Design/ProfilePageDesign.dart';
import 'package:pregnancy_app/Source/Other.dart';

class IntroPageB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroPageB();
}

class _IntroPageB extends State<IntroPageB> {
  Color playColor = Color.fromARGB(255, 221, 85, 153);
  Color pauseColor = Colors.green;
  bool flag = true;
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
            SizedBox(height: 25),
            appBarWithoutDrawer(),
            Container(
              margin: EdgeInsets.only(left: 128.0, right: 4.0, top: 90),
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
                  "سلام من باردار هستم میخواهم بدانم در طول دوره بارداری باید چه مقدار وزن اضافه کنم و اینکه آیا سرعت اضافه کردن وزن در طول بارداری مهم است یا نه؟ ",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Sans",
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4.0, right: 128.0, top: 16),
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
                child: GestureDetector(
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: "Sans",
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      text:
                          "تبریک میگویم، وزن و نمایه توده توده بدنی شما در ابتدای بارداری تعیین میکند که در طول بارداری چقدر باید وزن اضافه کنید. این افزایش وزن حتما باید تدریجی و با توجه به وضعیت رشد جنین باید باشد. افزایش وزن مناسب تاثیر زیادی بر سلامت شما و جنین دارد.  ابتدا با وارد کردن قد و وزن خود",
                      children: <TextSpan>[
                        TextSpan(
                          text: ' لینک به صفحه نمایه توده بدنی‌ ُ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                              fontSize: 16.0),
                        ),
                        TextSpan(
                          text:
                              'نمایه توده بدنی خود را محاسبه کنید. با توجه به نمایه توده بدنی شما در ابتدای بارداری نمودار وزن گیری شما در طول دوره بارداری تعیین شده و میزان مطلوب وزن گیری برای دوران بارداری مشخص میشود',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (cnx) => ProfilePage(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: flag
                    ? Icon(FontAwesomeIcons.playCircle)
                    : Icon(FontAwesomeIcons.pauseCircle),
                iconSize: 40.0,
                color: flag ? playColor : pauseColor,
                onPressed: () {
                  setState(() {
                    flag = !flag;
                  });
                },
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Container(
      //     child: Icon(
      //       Icons.arrow_forward,
      //       size: 40.0,
      //       color: Color.fromARGB(255, 221, 85, 153),
      //     ),
      //   ),
      //   backgroundColor: Colors.white.withOpacity(0.6),
      //   elevation: 6.0,
      //   onPressed: () {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (cnx) => ProfilePage(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
