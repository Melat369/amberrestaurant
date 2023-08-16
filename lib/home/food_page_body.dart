//creating a stateful class

import 'package:amberrestaurant/utils/colors.dart';
import 'package:flutter/material.dart';

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
  double _height = 220;
  

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
    return Column(children: [
      Container(

        //specifying the height is mandatory in order for the
        //horizontal scrolling to work
        height: 320,
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
  
     DotsIndicator(
  dotsCount: 5,
  position: _currPageValue,
  decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
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
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    index.isEven ? AppColors.mainColor : AppColors.iconColor2,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food1.jpg")))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 120,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Beyaynet"),
                          SizedBox(height: 10),
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
                              SizedBox(width: 10),
                              SmallText(text: "Comments"),
                            ],
                          )
                          ,
                          SizedBox(height:20),
                          Row(
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
  
  DotsDecorator({required Size size, required Size activeSize, required RoundedRectangleBorder activeShape}) {}
  
  DotsIndicator({required int dotsCount, required double position, required decorator}) {}
}
