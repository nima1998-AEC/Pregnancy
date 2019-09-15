import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TableDesign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TableDesignState();
}

class TableDesignState extends State<TableDesign> {

  Container containerBuilder(Color containerColor , String textData , double height){
    return Container(
      height: height ,
      width: MediaQuery.of(context).size.width *0.25,
        color: containerColor,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: AutoSizeText(textData , textAlign: TextAlign.center,),
        ),),
      );
  }

  TableRow buildTableRow(
      String status,
      String beforePregnancy,
      String increaseWeightFreeRange,
      String weightDeference,
      Color containerColor,
      double height
      ) {
    return TableRow(
      children: [
      containerBuilder(containerColor, weightDeference , height),
      containerBuilder(containerColor, increaseWeightFreeRange , height),
      containerBuilder(containerColor, beforePregnancy , height),
      containerBuilder(containerColor, status , height)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(color: Colors.black, width: 1.0),
        // defaultColumnWidth: FixedColumnWidth(150.0),
        children: [
          buildTableRow('وضعیت تغذیه', 'توده بدنی قبل از بارداری\n (kg/m²)', 'محدوده مجاز افزایش \n وزن (کیلوگرم)', 'افزایش وزن از ابتدای هفته 13 بارداری به  بعد(کیلوگرم/هفته)', Colors.white , 100),
          buildTableRow('کم وزن', 'کمتر از 5.18', '5.12 - 18', '5.0', Colors.yellow , 40),
          buildTableRow('طبیعی', '5.18 - 9.24', '5.11 - 16', '4.0', Colors.green , 40),
          buildTableRow('اضافه وزن', '9.29 - 25', '5.11 - 7', '3.0', Colors.orange , 40),
          buildTableRow('چاق', 'بیشتر از 30', '5 - 9', '2.0', Colors.red , 40),
        ],
      );
  }
}
