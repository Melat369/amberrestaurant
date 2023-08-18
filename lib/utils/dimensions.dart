import 'package:get/get.dart';
class Dimensions{
 static double screenHeight = Get.context!.height;
 static double screenWidth = Get.context!.width;
 
 static double pageViewContainer = screenHeight/3.27;
 static double pageViewTextContainer = screenHeight/6;
 static double pageView = screenHeight/2.25;//for the entire container with the 320 of height


 static double height10 = screenHeight/72; ///720/10
 static double height20 = screenHeight/36; ///720/10
 static double height15 = screenHeight/48; ///720/10
 static double height30 = screenHeight/24; ///720/10
 static double height45 = screenHeight/16.2; ///720/10


 
 static double font20 = screenHeight/36;
 static double radius20 = screenHeight/36;
  static double radius15 = screenHeight/48;

 static double radius30 = screenHeight/24;

static double width10 = screenWidth/72; ///720/10
 static double width20 = screenWidth/36; ///720/10
 static double width15 = screenWidth/48; ///720/10
 static double width30 = screenWidth/24; ///720/10
  static double width45 = screenHeight/16.2; ///720/10

//for icon size
static double iconsize24 = screenHeight/30;

//List view size
static double listViewImg = screenWidth/3.25;
static double listViewTextCountSize = screenWidth/3.9;

}