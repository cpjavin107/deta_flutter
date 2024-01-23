import 'package:flutter/material.dart';

import '../res/colors/appcolors.dart';

// ignore_for_file: prefer_const_constructors

class Big_Image extends StatelessWidget{

 String? value;
 Big_Image({ this.value});


   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Ads"), elevation: 0.0, backgroundColor:AppColors.maroonColor,
         iconTheme: IconThemeData(color: Colors.white),
       ),
       body: Stack(
           fit: StackFit.expand,
           children:<Widget> [
             Center(
                 child: Column(
                   children: [
                     Image.network(value!,),
                   ],
                 )
             )
           ]
       ),
     );
  }

}