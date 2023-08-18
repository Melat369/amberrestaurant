import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(
            left:0,
            right:0,
            child:Container(
              width: double.maxFinite,
              height:Dimensions.popularFoodImgSize,
              decoration:BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage(
                      "assets/images/food9.jpg"
                    )
                  )
                   
              ),
            )
          ),
          Positioned(
            left:Dimensions.width20,
            right:Dimensions.width20,
            
            child: Row(
              children: [

              ],

            )
          ,)
        ],
      )
      
    );
  }
}