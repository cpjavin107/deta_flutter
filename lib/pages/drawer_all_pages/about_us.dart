import 'package:flutter/material.dart';

import '../../res/colors/appcolors.dart';
import '../../widgets/bg_image.dart';
// ignore_for_file: prefer_const_constructors

class About_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
     body: Stack(
       fit: StackFit.expand,
         children:<Widget> [
          Center(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "DELHI ELECTRICAL TRADERS ASSOCIATION [REGD.]",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],

            ),


          )


      ]
     ),
    );

  }

}