import 'package:flutter/material.dart';
import 'package:pregnancy_app/Source/Other.dart';

class FoodSupplement extends StatefulWidget {
  FoodSupplementState createState() => FoodSupplementState();
}

class FoodSupplementState extends State<FoodSupplement> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            appBarWithoutDrawer(),
            Expanded(
              child: Container(
                // padding: EdgeInsets.only(bottom: 20),
                margin:
                    EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
                decoration: BoxDecoration(
                   border: Border.all(
                      color: Color.fromARGB(255, 221, 85, 153),
                      width: 2,
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView(
                  children: <Widget>[
                    foodText(
                        'اگر تغذیه مناسبی داشته باشم باز هم لازم است در دوران بارداری از مکمل های غذایی استفاده کنم؟',
                        Colors.red,
                        14),
                    foodText(
                        'بله با توجه به تغییراتی که در دوران بارداری در بدن اتفاق می افتد ضروری است که از مکملهایی که در سیستم بهداشت به رایگان به شما داده میشود استفاده کنید. این مکملها شامل:',
                        Colors.brown,
                        14),
                    foodText(
                        'آهن:',
                        Colors.black,
                        14),
                    foodText(
                        ' در دوران بارداری نیاز به آهن تا دو برابر قبل از بارداری افزایش می‌یابد. این میزان افزایش نیاز به آهن برای رشد جفت و جنین به حدی است که به هیچ وجه از طریق مصرف مواد غذایی به تنهایی تأمین نمی‌شود',
                        Colors.green,
                        14),
                    foodText(
                        'خانم‌های باردار باید از شروع هفته 16 بارداری یک عدد قرص سولفات فرو يا فومارات فرو (حاوي 55 تا 60 ميلي گرم آهن المنتال ) در روز مصرف کرده و تا سه ماه پس از زایمان ادامه دهند. مصرف قرص آهن ممکن است عوارضی مانند تهوع، درد معده، اسهال و یا یبوست به دنبال داشته باشد به همین دلیل توصیه می‌شود قرص آهن بعد از غذا میل شود تا عوارض جانبی به حداقل برسد. بهترین زمان برای مصرف مکمل آهن شب قبل از خواب می‌باشد.',
                        Colors.green,
                        14),
                    foodText(
                        'در هر حال خانم باردار باید بداند هیچگاه نباید مصرف قرص آهن را قطع کند زیرا بعد از گذشت چند روز معمولاً این عوارض قابل تحمل شده و یا به طور کلی برطرف خواهند شد.',
                        Colors.green,
                        14),
                    foodText(
                        'توصیه می‌شود از مصرف همزمان شیر و فرآورده‌های لبنی، چای و قهوه و قرص آهن خودداری شود زیرا کلسیم موجود در لبنیات و تانن موجود در چای و قهوه در جذب آهن اختلال ایجاد می‌کند.',
                        Colors.green,
                        14),
                    foodText('مولتی ویتامین مینرال:',
                        Colors.black, 14),
                    foodText(
                        ' در دوران بارداری نیاز به ویتامین‌ها و مواد معدنی معدنی افزایش می‌یابد به همین علت کلیه خانم‌های باردار از شروع هفته 16 بارداری تا سه ماه بعد از زایمان باید روزانه یک عدد کپسول مولتی ویتامین مینرال مصرف نمایند. توصیه می‌شود از مولتی‌ویتامین مینرال که دارای 150 میکروگرم یُد است استفاده شود.', Colors.green, 14),
                    foodText(
                        'اسید فولیک:',
                        Colors.black,
                        14),
                    foodText(
                        ' نیاز به اسید فولیک در دوران بارداری افزایش می‌یابد به دلیل نقش اسید فولیک در پیشگیری از نقص مادرزادی لوله عصبی، بهتر است مصرف این مکمل از زمان تصمیم به بارداری شروع شود و برای خانم‌های بارداری که از قبل تصمیم به بارداری نداشته اند، به محض اطلاع از بارداری مصرف روزانه 400 میکروگرم از این مکمل توصیه می‌شود. در صورتی که مکمل مولتی ویتامین مینرال مصرف شده دارای 400 میکروگرم اسید فولیک باشد، نیاز به ادامه تجویز قرص اسید فولیک به صورت جداگانه از شروع هفته 16 تا پایان بارداری نیست',
                        Colors.green,
                        14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
