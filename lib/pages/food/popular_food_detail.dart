import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../utils/colors.dart';


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
            top:Dimensions.height45,
            left:Dimensions.width20,
            right:Dimensions.width20,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined),

              ],

            )
          ,),
          Positioned(
            left:0,
            right:0,
            top:Dimensions.popularFoodImgSize,
            child:Container(
               padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,top: Dimensions.height20),
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color:AppColors.iconColor2,
               ),
            )

          )
        ],
      )
      
    );
  }
}