import 'package:flutter/material.dart';

import '../utils/colors.dart';

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
           Container(
     //the child basically represents the header section
      child: Container(
        margin: EdgeInsets.only(top: 45, bottom :15),
        padding: EdgeInsets.only(left:20, bottom:20 ),
       child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:[
                Text('Country'),
                Text('City')
              ]
            ) , 
           Center( 
            child: Container(
              width: 45,
              height:45,
              child: Icon(Icons.search, color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.mainColor, 
              )
              
            ),)
          ], 
  
        )
      )
    ),
  
        ]
      )
    );}
}