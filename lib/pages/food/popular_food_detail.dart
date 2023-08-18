import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popular Foods',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PopularFoodDetail(),
    );
  }
}