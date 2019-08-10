import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WeekInformationBar extends StatefulWidget {
  final String weekNumber;
  final String weight;
  final String difference;

  const WeekInformationBar(
      {Key key, this.weekNumber, this.weight, this.difference})
      : super(key: key);

  WeekInformationBarState createState() =>
      WeekInformationBarState(weekNumber, weight, difference);
}

class WeekInformationBarState extends State<WeekInformationBar> {
  final String weekNumber;
  final String weight;
  final String deference;

  WeekInformationBarState(this.weekNumber, this.weight, this.deference);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32, left: 32, top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.black12)),
      child: Container(
        margin: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 10.0,
              ),
              child: Icon(
                FontAwesomeIcons.chevronCircleLeft,
                color: Color.fromARGB(255, 153, 153, 153),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: AutoSizeText(
                  '$weekNumber',
                  maxLines: 1,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Terafik',
                    color: Color.fromARGB(255, 221, 85, 153),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 90,
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(top: 4.0, bottom: 4.0, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 85, 153),
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.only(
                left: 10.0,
              ),
              child: AutoSizeText(
                '$weight',
                maxLines: 1,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Sans',
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 60,
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10, left: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 85, 153),
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.only(
                left: 10.0,
              ),
              child: AutoSizeText(
                deference,
                maxLines: 1,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Sans',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
