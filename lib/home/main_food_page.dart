import 'package:amberrestaurant/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:[
          //showing the header
           Container(
     //the child basically represents the header section
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height45, bottom :Dimensions.height15, right: Dimensions.width10),
        padding: EdgeInsets.only(left:Dimensions.width20, bottom:Dimensions.height20),
       child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:[
                 BigText( text:"Ethiopia", color: AppColors.mainColor),
                Row(children: [
                  SmallText(text: "Addis Ababa", color:AppColors.titleColor,),
                  Icon(Icons.arrow_drop_down_rounded)
                ],)
                
              ]
            ) , 
           Center( 
            child: Container(
              
              width: Dimensions.width45,
              height:Dimensions.height45,
              child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconsize24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor, 
              )
              
            ),)
          ], 
  
        )
      )
    ),
  //showing the body
          Expanded(child:SingleChildScrollView(
            child:FoodPageBody(),
          )),
        ]
      )
     );}
}