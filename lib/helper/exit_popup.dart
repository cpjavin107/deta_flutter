import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/colors/appcolors.dart';

class ExitPopup{
  static Future<bool> showExitPopup(context) async{
    return await showDialog(

        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            content: SizedBox(
              height: MediaQuery.of(context).size.height*0.12,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Text("Do you want to exit an App?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.maroonColor),
                            child: Text("Yes" ,style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.maroonColor,
                              ),
                              child:Text("No" ,style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}