import 'package:flutter/material.dart';
import 'package:pregnancy_app/Source/Other.dart';

class FoodSuggestionForFat extends StatefulWidget {
  FoodSuggestionStateForFat createState() => FoodSuggestionStateForFat();
}

class FoodSuggestionStateForFat extends State<FoodSuggestionForFat> {
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
                        'وزن من در ابتدای بارداری بیشتر از حد طبیعی بود و الان نیز وزن گیری زیادتر از مقدار توصیه شده دارم چه کار باید بکنم؟',
                        Colors.red,
                        14),
                    foodText(
                        'شما باید علاوه بر اصلاح عادات و رفتارهای تغذیه‌ای، تحرک کافی از طریق پیاده روی منظم روزانه داشته باشید. این توصیه ها میتواند به کنترل وزن گیری شما کمک کند:',
                        Colors.brown,
                        14),
                    foodText(
                        '- اجتناب از سرخ کردن غذاها و حتی الامکان طبخ غذاها به شکل آب پز، بخارپز و کبابی',
                        Colors.green,
                        14),
                    foodText(
                        '- حذف چربی‌ها شامل کره حیوانی، مارگارین، خامه، سرشیر، دنبه، پیه و جدا کردن چربی‌های قابل رویت گوشت قرمز و پوست مرغ قبل از طبخ آنها',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از شیر و لبنیات کم چرب (کمتر از 5/2 درصد چربی) به جای شیر و لبنیات پرچرب',
                        Colors.green,
                        14),
                    foodText(
                        '- محدود کردن مصرف شیرینی‌ها، کیک‌های خامه‌ای و دسرهای پرچرب یا شیرین و استفاده نکردن از تنقلات پرچرب نظیر چیپس، پیراشکی، شکلات و امثال آن',
                        Colors.green,
                        14),
                    foodText(
                        '- خودداری از مصرف سس‌های چرب مانند مایونز و سس‌های مخصوص سالاد و استفاده از سس سالم (ماست کم چرب، کمی نمک، روغن زیتون، آب لیمو یا آب نارنج) به جای سس مایونز',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از میوه‌های تازه به جای شیرینی و شکلات به عنوان میان وعده',
                        Colors.green,
                        14),
                    foodText(
                        '- محدود کردن مصرف نان‌های شیرین (نان قندی، نان شیر مال، شیرینی، کیک و....) و انواع شکلات و آب نبات',
                        Colors.green,
                        14),
                    foodText(
                        '- مصرف دوغ کم نمک وبدون گاز، آب و آب میوه‌های طبیعی به جای نوشابه‌های گازدار',
                        Colors.green,
                        14),
                    foodText('- کم کردن مصرف قند و شکر همراه با چای',
                        Colors.green, 14),
                    foodText(
                        '- محدود کردن مصرف نان، برنج و ماکارونی (به 7 واحد در روز)',
                        Colors.green,
                        14),
                    foodText('- خودداری از مصرف برنج و ماکارونی در وعده شام.',
                        Colors.green, 14),
                    foodText(
                        '- خودداری از مصرف نان همراه با برنج در هنگام صرف غذا',
                        Colors.green,
                        14),
                    foodText(
                        '- استفاده از میوه به جای نان و پنیر، بیسکوئیت یا کیک در میان وعده‌ها',
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
