import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pregnancy_app/Design/AddWeightPageDesign.dart';
import 'package:pregnancy_app/Design/HistoryPageDesign.dart';
import 'package:pregnancy_app/Design/ProfilePageDesign.dart';

class FoodPageDrawer extends StatefulWidget {
  State<StatefulWidget> createState() => _FoodPageDrawer();
}

class _FoodPageDrawer extends State<FoodPageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / (1.4),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/DrawerHeader.png",
                    ),
                    fit: BoxFit.fill),
              ),
              height: MediaQuery.of(context).size.height * 0.32,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ProfilePage()));
                                },
                                title: Text("مشخصات مادر",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.idBadge,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                        height: 45,
                      ),

                      Container(
                        child: new Directionality(
                          textDirection: TextDirection.rtl,
                          child: Theme(
                            data: ThemeData(
                              highlightColor: Color.fromARGB(255, 221, 85, 153),
                            ),
                            child: ListTile(
                              title: Text(
                                "ثبت وزن هفتگی",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontFamily: "Terafik",
                                    color: Color.fromARGB(255, 84, 31, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Icon(
                                FontAwesomeIcons.weight,
                                color: Color.fromARGB(255, 84, 31, 49),
                                textDirection: TextDirection.rtl,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddWeightPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        height: 45,
                      ),

                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text("نکات آموزشی ویژه",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.chalkboardTeacher,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                        height: 45,
                      ),

                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text("مشاهده روند رشد",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.chartArea,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HistoryPage()));
                                },
                              ),
                            )),
                        height: 45,
                      ),

                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text(
                                  "پرسش های متداول",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Icon(
                                  FontAwesomeIcons.questionCircle,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                        height: 45,
                      ),

                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text("بارداری و ورزش",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.running,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                        height: 45,
                      ),

                      //
                      Container(
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text("عوارض شایع بارداری",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.userTag,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                        height: 45,
                      ),

                      Container(
                        height: 45,
                        child: new Directionality(
                            textDirection: TextDirection.rtl,
                            child: Theme(
                              data: ThemeData(
                                highlightColor:
                                    Color.fromARGB(255, 221, 85, 153),
                              ),
                              child: ListTile(
                                title: Text("مراکز بهداشتی",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: "Terafik",
                                        color: Color.fromARGB(255, 84, 31, 49),
                                        fontWeight: FontWeight.bold)),
                                leading: Icon(
                                  FontAwesomeIcons.building,
                                  color: Color.fromARGB(255, 84, 31, 49),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            )),
                      ),

                      new Directionality(
                          textDirection: TextDirection.rtl,
                          child: Theme(
                            data: ThemeData(
                              highlightColor: Color.fromARGB(255, 221, 85, 153),
                            ),
                            child: ListTile(
                              title: Text("درباره",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: "Terafik",
                                      color: Color.fromARGB(255, 84, 31, 49),
                                      fontWeight: FontWeight.bold)),
                              leading: Icon(
                                FontAwesomeIcons.info,
                                color: Color.fromARGB(255, 84, 31, 49),
                                textDirection: TextDirection.rtl,
                              ),
                              onTap: () {},
                            ),
                          )),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 7.0, bottom: 4.0),
                        child: Text(
                          "نگارش اول_۱۳۹۸",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
