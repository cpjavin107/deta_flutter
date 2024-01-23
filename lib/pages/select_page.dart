
import 'package:flutter/material.dart';

import '../res/colors/appcolors.dart';
import '../widgets/bg_image.dart';
import 'home/home_page.dart';
import 'login_pages.dart';
// ignore_for_file: prefer_const_constructors

class Select extends StatefulWidget {

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:<Widget> [
          BgImage(),
          Center(
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    Image.asset(
                      "assets/images/large_logo.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.btn_bg_Color),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Material(
                                    color: AppColors.btn_bg_Color,
                                    child:   InkWell(
                                      borderRadius: BorderRadius.circular(25),
                                      onTap:(){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage() ));

                                     //   Navigator.pushReplacement(context, MyRoutes.loginRoute);
                                        },
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        height: 40,
                                        alignment: Alignment.center,

                                        child: const Text(
                                           "LOGIN"
                                            , style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),
                                         ),


                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.btn_bg_Color),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Material(
                                    color: AppColors.btn_bg_Color,
                                    child:   InkWell(
                                      borderRadius: BorderRadius.circular(25),
                                      onTap:(){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_Page() ));

                                       // Navigator.pushNamed(context, MyRoutes.seleteHome);
                                        },
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "GUEST"
                                            ,style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),

                                        ),


                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

        ],
      ),

    );

  }
}