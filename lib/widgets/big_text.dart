

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  //pass color variable it is optional
  final String text;
  //pass in the text to be written
  double size;
  //for the dynamic text size
  TextOverflow overFlow;
  //to tolerate long food names
  BigText({super.key,
  this.color,
  //setting default size
  this.size=20,
  required this.text,
  this.overFlow = TextOverflow.ellipsis
  //this is saying that if the text is overflowing show the too big
  //default 3 dots to examplify that there is an overflow
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400
      ),

    );
  }
}