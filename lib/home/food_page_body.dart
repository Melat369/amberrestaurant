//creating a stateful class

import 'package:amberrestaurant/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/big_text.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
 //adding controller in order for the sliding images to make
 //images on the side appear partially
 PageController pageController = PageController(viewportFraction:0.85);
 
  @override
  Widget build(BuildContext context) {
    return Container(

      //specifying the height is mandatory in order for the 
      //horizontal scrolling to work
      height:320,
      color: Colors.amber,
      child: PageView.builder(
        controller: pageController,
        //this will count the number of items that
        //will be scrolling sideways in the resturant app
        itemCount:5,
        //from 0-4 refering to indexes
        itemBuilder: (context,position){
        //here we have a space bn the items and in order to achieve
        //that the item builder should return a function not a container

        return _buildPageItem(position);
      })
    );
  }
  Widget _buildPageItem(int index){
    return Stack(
      children: [
         Container(
      height:220,
      margin:EdgeInsets.only(left:5, right:5),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven?AppColors.mainColor: AppColors.iconColor2,
        image: DecorationImage(
          fit:BoxFit.cover,
          image: AssetImage(
            "assets/images/food1.jpg"
          )
        )
      )
    ),
        Align(
          alignment: Alignment.bottomCenter,
           child: Container(
      height:140,
      margin:EdgeInsets.only(left:30, right:30, bottom:10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        
      ),
     child:Container(
      padding:EdgeInsets.only(top:10,left:15, right:15),

      child:Column(
        children:[
          BigText(text: "Beye-Aynet"),
          SizedBox(height:10),
          Row(
            children:[
              Wrap(
                
              )
            ]
          )
        ]
      )
     )
    )
        )
  
      ], 
    );
    }
}