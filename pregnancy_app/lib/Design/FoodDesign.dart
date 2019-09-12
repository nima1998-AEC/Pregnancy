import 'package:flutter/material.dart';
import 'package:pregnancy_app/Drawer/FoodPageDrawer.dart';

import 'package:pregnancy_app/Source/Other.dart';

class FoodDesign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FoodDesign();
}

class _FoodDesign extends State<FoodDesign> {
  var scaffoldKey4 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugBanner(),
      home: Scaffold(
        key: scaffoldKey4,
        endDrawer: FoodPageDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              appBar(scaffoldKey4),
              SizedBox(
                height: 8.0,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 221, 85, 153),
                    width: 2,
                  ),
                ),
                child: Text(
                  "مواد غذایی که که از نظر ارزش غذایی خواص مشابهی دارند در هرم غذایی در یک گروه قرار می گیرند. شکل هرم به این معنی است که غذاهایی که به سمت کف هرم هستند باید بیشتر و غذاهایی که به سمت نوک هرم هستند باید کمتر مصرف شوند",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  child: Image.asset(
                    "assets/Food1.png",
                    height: 100,
                  ),
                ),
                onTap: () {
                  showAlertDialog(
                      context,
                      "متفرقه",
                      "این گروه که در راس هرم غذایی قراردارند شامل روغن ها و چربی ها، شیرینی ها و قندهای ساده، ترشی ها و شورها و نوشیدنی ها هستند مصرف این غذاها باید تا حد امکان کمتر باشد",
                      "assets/Food1.png");
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 4.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/Food2.png",
                          height: 100,
                        ),
                      ),
                      onTap: () {
                        showAlertDialog(
                            context,
                            "شیر و فرآورده ها",
                            "این گروه شامل شیر، پنیر، ماست، دوغ و بستنی می باشد و نامین کننده عمده پروتئین، کلسیم و فسفر می باشد. روزانه باید دو تا سه واحد از این گروه مصرف شود\nهر واحد از این گروه معادل: یک لیوان شیر یا ماست ، 60 گرم پنیر یا دو لیوان دوغ میباشد",
                            "assets/Food2.png");
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.0),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/Food3.png",
                        height: 100,
                      ),
                    ),
                    onTap: () {
                      showAlertDialog(
                          context,
                          "حبوبات و مغزها",
                          "این گروه شامل انواع حبوبات مثل نخود، لوبیا، باقلا، لپه و عدس و انواع مغزها مثل گردو، فندق، پسته و بادام می باشد. این گروه تامین کننده پروتئین و املاح برای بدن می باشد. روزانه باید یک واحد از این گروه مصرف شود\nهر واحد از این گروه معادل: نصف لیوان حبوبات پخته یا یک سوم لیوان انواع مغزهااست",
                          "assets/Food3.png");
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 4.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/Food4.png",
                          height: 100,
                        ),
                      ),
                      onTap: () {
                        showAlertDialog(
                            context,
                            "گوشت و تخم مرغ",
                            "این گروه شامل انواع گوشت سفید و قرمز و تخم مرغ می باشد و تامین کننده مهم پروتئین، آهن، روی و بعضی از انواع ویتامین‌های گروه ب میباشد. روزانه باید یک تا دو واحد از این گروه مصرف شود\nهر واحد از این گروه معادل: شصت گرم گوشت پخته شده یا دو قطعه خورشتی ، یک تکه ماهی به اندازه یک کف دست بدون انگشت ، نصف ران متوسط یا نصف سینه متوسط مرغ یا دو عدد تخم مرغ است",
                            "assets/Food4.png");
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.0, right: 4.0),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/Food5.png",
                        height: 100,
                      ),
                    ),
                    onTap: () {
                      showAlertDialog(
                          context,
                          "سبزی ها",
                          "این گروه شامل انواع سبزی، خیار، گوجه فرنگی، پیاز، لوبیا سبز، انواع کلم و کدو می باشد. این گروه تامین کننده عمده ویتامینها و املاحی مثل پتاسیم، منیزیم و آهن و همچنین فیبر می باشد. روزانه باید سه تا پنج واحد از این گروه مصرف شود\nهر واحد از این گروه معادل: یک لیوان سبزی برگی ، نصف لیوان سبزی پخته یا سبزی خام خورد شده یا یک عدد خیار یا گوجه فرنگی متوسط می باشد",
                          "assets/Food5.png");
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 4.0, left: 4.0),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/Food6.png",
                        height: 100,
                      ),
                    ),
                    onTap: () {
                      showAlertDialog(
                          context,
                          "میوه ها",
                          "این گروه شامل انواع میوه، آب میوه طبیعی و میوه های خشک می باشد. این گروه تامین کننده عمده ویتامینها و املاحی مثل پتاسیم و منیزیم می باشد. روزانه باید دو تا چهار واحد از این گروه مصرف شود\nهر واحد از این گروه معادل: یک عدد میوه متوسط، نصف لیوان آب میوه طبیعی ، نصف لیوان میوه های ریز مثل توت یا یک چهارم لیوان میوه خشک می باشد",
                          "assets/Food6.png");
                    },
                  ),
                ],
              ),
              GestureDetector(
                child: Container(
                  child: Image.asset(
                    "assets/Food7.png",
                    height: 100,
                  ),
                ),
                onTap: () {
                  showAlertDialog(
                      context,
                      "نان و غلات",
                      "این گروه شامل انواع نان، برنج و ماکارونی می باشد. این گروه تامین کننده عمده انرژی، کربوهیدرات پیچیده، فیبر و برخی ویتامینهای گروه ب می باشد. روزانه باید 7 تا 11 واحد از این گروه مصرف شود\n هر واحد از این گروه معادل: یک کف دست بدون انگشت انواع نان ، سه کف دست با انگشت نان لواش ، نصف لیوان برنج پخته یا نصف لیوان ماکارونی پخته یا سه عدد بیسکئویت متوسط می باشد",
                      "assets/Food7.png");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String msg, String file) {
    // set up the button
    // Widget cancelButton = FlatButton(
    //   child: Text("خروج"),
    //   onPressed: () {
    //     Navigator.of(context).pop();
    //   },
    // );

    // Widget okButton = Container(
    //   child: Row(
    //     children: <Widget>[
    //       Expanded(
    //         child: Icon(Icons.person),
    //       )
    //     ],
    //   ),
    // );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: 8.0,
      title: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                file,
                height: 60,
              ),
            ),
          ),
          Container(
            child: Text(
              title,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      )),
      content: Container(
        color: Colors.white,
        child: Text(
          msg,
          textAlign: TextAlign.right,
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
