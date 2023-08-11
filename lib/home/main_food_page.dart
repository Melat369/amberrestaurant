import 'package:flutter/material.dart';

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
       child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:[
                Text('Country'),
                Text('City')
              ]
            ) , 
            Container(
              width: 45,
              height:45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.pink, 
              )
              
            )
          ], 
  
        )
      )
    ),
  
        ]
      )
    );}
}