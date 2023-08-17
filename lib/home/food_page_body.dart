//creating a stateful class

import 'package:amberrestaurant/utils/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_and_text.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //adding controller in order for the sliding images to make
  //images on the side appear partially
  PageController pageController = PageController(viewportFraction: 0.85);
  
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  int dotsCount = 5;
  int? position ;
  double? size;
  double? activeSize;
  double? activeShape;



  @override
  void initState(){
    super.initState();
    //attaching a listener for this page controller
    pageController.addListener((){
      setState(() {
        _currPageValue=pageController.page!;
        

      });
    });
  }

  @override

  //when we leave the page we dont want it to be active and 
  //thus we use the despose method and is also efficient in 
  //memory management

  void dispose() {
     pageController.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
      Container(


        //specifying the height is mandatory in order for the
        //horizontal scrolling to work
        height: Dimensions.pageView,
       // color: Colors.amber,
        child: PageView.builder(
            controller: pageController,
            //this will count the number of items that
            //will be scrolling sideways in the resturant app
            itemCount: 5,
            //from 0-4 refering to indexes
            itemBuilder: (context, position) {
              //here we have a space bn the items and in order to achieve
              //that the item builder should return a function not a container

              return _buildPageItem(position);
            })),
      //dots
      DotsIndicator(
  dotsCount: 5,
  position: _currPageValue,
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeColor: AppColors.mainColor,
    
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
      //popular text
,
      SizedBox(height:Dimensions.height30),
      Container(
        margin: EdgeInsets.only(left:Dimensions.width30),
        child: Row(
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [
            BigText(text:'Popular'),
            SizedBox(width:Dimensions.width10),
            Container(
              margin: const EdgeInsets.only(bottom:3),
              child: BigText(text:".", color:Colors.black26),
            ),
            SizedBox(width:Dimensions.width10),
           Container(
            margin: EdgeInsets.only(bottom:3),
            child: SmallText(text: "Food Pairning", color: AppColors.signColor),
           )
          ],
        ),
      )
   ,
      //list of food and images
      Container(
        height: 700,
        child:ListView.builder(
        physics:BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount:10,
        itemBuilder:(context,index){
          return Container(
            margin: EdgeInsets.only(left:Dimensions.width20, right:Dimensions.width20),
            child:Row(
              children:[
                Container(
                  width:120,
                  height:120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30
                    ),
                    color: Colors.white38,
                    image:DecorationImage(
                      image: AssetImage(
                        "assets/images/food5.jpeg"
                      )
                    )

                  )
                ),
              ]
            ),
          );
        }
      )



      )

          ],);}

  Widget _buildPageItem(int index) {
     Matrix4 matrix = new Matrix4.identity(); 
     if (index == _currPageValue.floor()){
      var currScale = 1 -(_currPageValue - index) * (1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
     }
     else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor + (_currPageValue - index+1)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);



     } 
      else if(index == _currPageValue.floor()-1){
      var currScale = 1 -(_currPageValue - index) * (1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);

     }
     else{
      var currScale= 0.8;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2 ,0);


     }
     

   //matrix4 is an api form flutter
    return Transform(transform: matrix,
    child:Stack(
      children: [
        Container(
            height:  Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color:
                    index.isEven ? AppColors.mainColor : AppColors.iconColor2,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food1.jpg")))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                          color:Color(0xffe8e8e8),
                          blurRadius:5.0,
                          offset:Offset(0,5)                                                 
                    ),
                    BoxShadow(
                      color:Colors.white,
                      offset: Offset(-5,0)
                    ),
                    BoxShadow(
                      color:Colors.white,
                      offset: Offset(5,0)
                    )
                  ]
                ),
                child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Beyaynet"),
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

                        ])),
                        ))
      ],
    )
 
    );
  }
  
  }
