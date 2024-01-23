import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/pages/announcement/announcement.dart';

import '../../../res/colors/appcolors.dart';
import '../../../res/routes/my_routes.dart';
import '../../matrimonial/MatrimonialSignup.dart';
import '../../matrimonial/ShowAllUsersScreen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        InkWell(
          child:Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.person,size: 40, color:Colors.white),

                        Center(child: Text("MEMBERS", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)),
                      ]
                  ),
                ),
              ],
            ),
          ) ,
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.members);
          },
        ),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.supervisor_account,size: 40, color:Colors.white),
                        Center(child: Text("EXECUTIVE \nCOMMITTEE", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.committee);
          },
        ),
        InkWell(
          child:  Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.library_books,size: 40, color:Colors.white),
                        Center(child: Text("NEWS & EVENTS", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.newsevent);
          },
        ),
        InkWell(
          child:  Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.search,size: 40, color:Colors.white),
                        Center(child: Text("ALPHABETICAL \nSEARCH", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.alphasearch);
          },
        ),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.info,size: 40, color:Colors.white),
                        Text("USEFUL \nDETAILS", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.selectUseful);
          },
        ),
        InkWell(
          child:  Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.business,size: 40, color:Colors.white),
                        Text("HOLIDAY \nCALENDER", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                      ]
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.viewholiday);
          },
        ),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.question_answer,size: 40, color:Colors.white),
                        Text("ENQUIRY", style: TextStyle(fontSize: 12, color: Colors.white,
                            fontWeight: FontWeight.bold)
                          ,),
                      ]
                  ),
                ),
              ],
            ),
          ),

          onTap: () {
            Navigator.pushNamed(context, MyRoutes.seleteenquiry);
          },
        ),
      ],
    );
  }
}

