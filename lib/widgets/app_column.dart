import 'package:amberrestaurant/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: text, size: Dimensions.font26),
                          SizedBox(height: Dimensions.height10),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(Icons.star,
                                        size: 18, color: AppColors.mainColor)),
                              ),
                              SizedBox(width: 10),
                              SmallText(text: "4.5"),
                              SizedBox(width: 10),
                              SmallText(text: "1287"),
                              SizedBox(width: Dimensions.height10),
                              SmallText(text: "Comments"),
                            ],
                          )
                          ,
                          SizedBox(height:Dimensions.height20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[

                            IconAndTextWidget(
                               icon:Icons.circle_sharp,

                               text:"Normal",
                             
                               iconColor:AppColors.iconColor1 ),

                             IconAndTextWidget(
                               icon:Icons.location_on,

                               text:"1.7km",
                             
                               iconColor:AppColors.mainColor ),

                             IconAndTextWidget(
                               icon:Icons.timer_sharp,

                               text:"32min",
                             
                               iconColor:AppColors.iconColor2 )
                         
                                                  
                          ],)

                        ]);
  }
}