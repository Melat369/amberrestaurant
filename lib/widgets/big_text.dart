

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  //pass color variable it is optional
  final String text;
  //pass in the text to be written
  double size;
  //for the dynamic text size
  double height;
   
  TextOverflow overFlow;
  //to tolerate long food names
  BigText({super.key,
  this.color = const Color(0xff89dad0) ,
  //setting default size
  this.size=20,
  required this.text,
  this.height = 1.2,
  this.overFlow = TextOverflow.ellipsis
  //this is saying that if the text is overflowing show the too big
  //default 3 dots to exemplify that there is an overflow
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      ),

    );
  }
}