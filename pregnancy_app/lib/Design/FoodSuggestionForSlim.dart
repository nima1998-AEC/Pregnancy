import 'package:flutter/material.dart';
import 'package:pregnancy_app/Source/Other.dart';

class FoodSuggestionForSlim extends StatefulWidget {
  FoodSuggestionStateForSlim createState() => FoodSuggestionStateForSlim();
}

class FoodSuggestionStateForSlim extends State<FoodSuggestionForSlim> {
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
                        'من در ابتدای بارداری کم وزن بودم و الان نیز وزن گیری کافی ندارم چه کار باید بکنم؟',
                        Colors.red,
                        14),
                    foodText(
                        'شما باید از غذاهای مقوی و مغذی و به اندازه مناسب استفاده کنید. برای مقوی کردن غذای خود یعنی افزایش انرژی آن و مغذی کردن یعنی افزایش پروتئین، ویتامین و املاح غذای خود می توانید:',
                        Colors.brown,
                        14),
                    foodText(
                        '- همراه با صبحانه از مربا، عسل، خرما، شیره انگور و شیره خرما و سرشیر، خامه وکره استفاده کنید',
                        Colors.green,
                        14),
                    foodText(
                        '- حداقل از دو میان وعده شامل بیسکوئیت (ترجیحاً سبوس‌دار) کیک، کلوچه، نان و پنیر، نان و سیب‌زمینی، نان و تخم مرغ، نان و خرما، نان روغنی، نان شیر مال همراه با یک لیوان شیر و انواع میوه در فواصل وعده‌های غذایی اصلی استفاده کنید.',
                        Colors.green,
                        14),
                    foodText(
                        '- مقدار بیشتری از گروه نان و غلات مثل نان، برنج و ماکارونی مصرف نمایید. همچنین از  سیب‌زمینی در انواع غذاها و یا در میان وعده‌ها استفاده کنید.',
                        Colors.green,
                        14),
                    foodText(
                        '-مصرف نان همراه با سایر مواد غذایی مانند برنج در وعده ناهار و شام',
                        Colors.green,
                        14),
                    foodText(
                        '-استفاده از بستنی و میوه‌های شیرین (انگور، خربزه، انجیر، توت، خرما) شیرینی و انواع خشکبار به عنوان میان وعده ',
                        Colors.green,
                        14),
                    foodText('- اضافه نمودن مقداری کره به غذا در هر وعده غذایی',
                        Colors.green, 14),
                    foodText(
                        '- استفاده از روغن زیتون داخل سالاد', Colors.green, 14),
                    foodText(
                        '- استفاده از شیر، ماست، پنیر، و بستنی به عنوان میان وعده (بیسکوئیت و شیر، نان و ماست، نان و پنیر، شیربرنج، فرنی و امثال آن)',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده بیشتر از غذاهای تهیه شده با انواع گوشت‌ها (کتلت، کباب، انواع خورش و...)',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از تخم مرغ در صبحانه یا میان وعده (آب پز، نیمرو، املت) يا همراه با غذا (عدس پلو یا رشته پلو همراه با خاگینه و انواع کوکو، کتلت و...)',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از غذاهای تهیه شده با انواع حبوبات (برخی از خورش‌ها، آش‌ها، خوراک‌ها، آبگوشت، عدسی، خوراک لوبیا و...)',
                        Colors.green,
                        14),
                    foodText(
                        '- مصرف انواع خشکبار و مغزها (گردو، پسته، بادام، و...) به عنوان میان وعده.',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از سبزی‌هایی نظیر گوجه فرنگی، هویج، خیار، ساقه کرفس و ميوه‌ها به عنوان میان وعده',
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
