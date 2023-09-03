import 'package:amberrestaurant/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;
  double textHeight = Dimensions.screenHeight/5.3;

  @override
  void initState(){
    super.initState();
    if (widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);

   
    }else{
      firstHalf == widget.text;
      secondHalf = "";
    }
  } 
    https://www.udemy.com/course/build-backend-api-node-js-and-react-frontend/learn/lecture/33028170#overview


  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text:hiddenText?(firstHalf+"..."):(firstHalf+secondHalf))
          InkWell(autofocus: onTap:(){

,
child: ROw(
  children:[ [SmallTExt(text:"Show more", color: AppColors.mainColor)
  Icon(Icons.arrow drop down);
  
  ]]
)          },)
        
        ],
      ),
    );
  }
}