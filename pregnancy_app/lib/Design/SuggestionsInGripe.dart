import 'package:flutter/material.dart';
import 'package:pregnancy_app/Source/Other.dart';

class SuggestionsInGripe extends StatefulWidget {
  SuggestionsInGripeState createState() => SuggestionsInGripeState();
}

class SuggestionsInGripeState extends State<SuggestionsInGripe> {

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
                        'ترش کردن و سوزش معده',
                        Colors.black,
                        14),
                    foodText(
                        'تازگیها دچار سوزش سر دل و ترش کردن معده شده ام ',
                        Colors.red,
                        14),
                    foodText(
                        'این حالت یک رخداد معمول در اواخر بارداری است و معمولاً در شب‌ها روی می‌دهد. بازگشت اسید معده به مری موجب سوزش انتهای مری می‌شود. در بیشتر موارد، این مسئله به دلیل بزرگ شدن رحم و فشار آن بر روده‌ها و معده و نيز شل شدن اسفنکتر مری و بازگشت محتویات معده به داخل مری ايجاد شده و باعث احساس سوزش می‌شود. اين عارضه با خوردن غذای زیاد و تشکیل گاز شدت مي‌يابد. برای کنترل این وضعیت باید:',
                        Colors.brown,
                        14),
                    foodText(
                        ' غذا در وعده‌های کوچک و متعدد (هر 2 تا 3 ساعت) مصرف شود',
                        Colors.green,
                        14),
                    foodText(
                        'به جای استفاده از مواد غذایی سرخ کرده، از غذاهای آب پز و بخار پز ویا کبابی استفاده کنند',
                        Colors.green,
                        14),
                    foodText(
                        'غذا به آرامی و در محیطی با آرامش میل شود',
                        Colors.green,
                        14),
                    foodText(
                        'از خوردن غذاهای حجیم قبل از خواب اجتناب شود',
                        Colors.green,
                        14),
                    foodText('از نوشیدن آب و مایعات در حین غذا و یا بلافاصله پس از اتمام غذا خودداری شود',
                        Colors.green, 14),
                    foodText(
                        'رژیم غذایی باید کم‌چرب باشد', Colors.green, 14),
                    foodText(
                        'از غذاهای ادویه‌دار، بخصوص ادویه تند کمتر استفاده کنند',
                        Colors.green,
                        14),
                    foodText(
                        'مصرف غذاهای نظیر نعناع، پیاز، سیر، چاشنی‌ها، شکلات، قهوه، چای، نوشابه‌های گازدار را قطع کرده از چای پررنگ اجتناب کنید',
                        Colors.green,
                        14),
                        foodText('بعد از صرف غذا یا آشامیدن، از دراز کشیدن یا خم شدن به جلو پرهیز کنند', Colors.green, 14),
                        foodText('تهوع و استفراغ', Colors.black, 14),
                        foodText('از وقتی باردار شده ام حالت تهوع و استفراغ دارم', Colors.red, 14),
                        foodText('شيوع اين عارضه بين 50 تا 70 درصد است و اغلب در سه ماهه اول بارداری رخ می‌دهد و تا هفته 16 بارداری بهبود می‌یابد. از آنجایی که این مشکل در صبح‌ها تشدید می‌شود، بیماری صبحگاهی نامیده می‌شود؛ گرچه ممکن است در هر ساعتی از شبانه روز اتفاق بیفتد', Colors.brown, 14),
                        foodText('معده را خالی نگه ندارند اما در عین حال از پری و سنگيني معده هم خودداری کنند', Colors.green, 14),
                        foodText('مصرف مقدار غذای کمتر در هر وعده', Colors.green, 14),
                        foodText('افزایش تعداد وعده‌های غذایی که ممکن است برحسب تحمل مادر تا 9 وعده در روز هم برسد', Colors.green, 14),
                        foodText('بیسکوئیت یا نان خشک قبل از برخاستن از رختخواب مصرف كرده و پس از 15 دقیقه از رختخواب برخاسته و صبحانه سبک و زود هضم بخورند', Colors.green, 14),
                        foodText('از مصرف همزمان غذا و مایعات خودداری شود', Colors.green, 14),
                        foodText('از خوردن غذاهای پر ادویه، سرخ شده، نفّاخ، حجیم و دیرهضم اجتناب شود', Colors.green, 14),
                        foodText('از آنجایی که غذاها و مایعات سرد بیش از نوع گرم آنها قابل تحمل‌اند از غذاهای سرد با دمای یخچال استفاده شود و نيز از غذاهایي كه بوی محرک دارند اجتناب شود', Colors.green, 14),
                        foodText('در زمان آشپزی، پنجره آشپزخانه را باز بگذارند تا بوی شدید و تند غذا آزار دهنده نباشد و در صورت عدم تحمل توصيه می‌شود غذا بوسیله سایر افراد خانواده تهیه گردد', Colors.green, 14),
                        foodText('در صورت بروز ناراحتی معده همراه با تهوع می‌توان یک تکه نان یا بیسکوئیت مصرف کرد', Colors.green, 14),
                        foodText('به آرامی غذا بخورند به مدت طولانی گرسنه نمانند', Colors.green, 14),
                        foodText('از رایحه‌های آزار دهنده و بوی تند برخی غذاها و سایر بوهای آزاردهنده اجتناب کنند', Colors.green, 14),
                        foodText('در صورتي كه تهوع و استفراغ بارداري خفيف باشد ویتامین B6 مي‌تواند موجب تخفیف علایم می‌شود.', Colors.green, 14),
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
