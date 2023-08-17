

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SmallText extends StatelessWidget {
  Color? color;
  //pass color variable it is optional
  final String text;
  //pass in the text to be written
  double size;
  //for the dynamic text size
  double height;
  //the constructor
  SmallText({super.key,
  this.color, //= const Color(0xffcc7c5) ,
  //setting default size
  this.size=10,
  this.height=1.2,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //taking care of the over flow
    
      style: TextStyle(
        fontFamily: 'poppins',
        fontSize: size,
        color: color,
        height: height
      ),

    );
  }
}