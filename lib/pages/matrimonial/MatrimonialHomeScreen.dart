import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/members_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/member_model.dart';
import '../alphabetical_search/list_user_details.dart';
// ignore_for_file: prefer_const_constructors

class MatrimonialHomeScreen extends StatefulWidget {
  @override
  State<MatrimonialHomeScreen> createState() => _MatrimonialHomeScreenState();
}

class _MatrimonialHomeScreenState extends State<MatrimonialHomeScreen>
    with TickerProviderStateMixin {
  _MatrimonialHomeScreenState();

  final TextEditingController _typeAheadController = TextEditingController();

  _getRequests() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.maroonColor,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              color: AppColors.maroonColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      _buildRoundedImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTclBNN9eDwLvwUXKKlVNRM17KlxH4cQALEw&usqp=CAU'),
                      SizedBox(width: 10.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dr. Ram Kumar Sing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16.0),),
                          Text('New Delhi',style: TextStyle(color: Colors.white,fontSize: 12.0)),
                        ],
                      ),
                      Spacer(),
                      IconButton(iconSize:30,onPressed: (){}, icon: Icon(Icons.filter_alt_outlined ,color: Colors.white,)),
                      IconButton(iconSize:30,onPressed: (){}, icon: Icon(Icons.search_outlined,color: Colors.white,))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Find Your Life Partner',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150.0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.9,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))
                  ),
                  child: Column(
                    children: [
                      /*Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            onChanged: (value) {}
                            *//* {
                              List<Data> dummySearchList = [];
                              dummySearchList.addAll(memberData);
                              if(value.isNotEmpty) {
                                List<Data> dummyListData = [];
                                dummySearchList.forEach((item) {
                                  if(item.name!.contains(value)) {
                                    dummyListData.add(item);
                                  }
                                });
                                setState(() {
                                  memberData2.clear();
                                  memberData2.addAll(dummyListData);
                                  check = "2";

                                });
                                return ;
                              } else {
                                setState(() {
                                  memberData2.clear();
                                  memberData2.addAll(memberData);
                                  check = "2";
                                });
                              }
                            }*//*
                            ,
                            controller: _typeAheadController,
                            decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Normal',
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Normal',
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                          ),
                        ),
                      ),*/
                      Expanded(
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomDailyPage();
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildRoundedImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      // Border radius for individual images
      child: Image.network(
        imageUrl,
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
class CustomDailyPage extends StatelessWidget {
  CustomDailyPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        // Container background color
        borderRadius: BorderRadius.circular(
            16.0), // Border radius for rounded corners
      ),
      margin: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
      width: MediaQuery.of(context).size.width,
      child:  Column(
        children: [
          Row(
            children: [
              _buildRoundedImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTclBNN9eDwLvwUXKKlVNRM17KlxH4cQALEw&usqp=CAU'),
              SizedBox(width: 20.0,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Ram Kumar Sing',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 16.0),),
                  SizedBox(height: 5.0,),
                  Text('24 years 2 month',style: TextStyle(color: Colors.black87,fontSize: 14.0)),
                  SizedBox(height: 5.0,),
                  Text('MBBS, MS, DNB',style: TextStyle(color: Colors.black87,fontSize: 12.0)),
                  SizedBox(height: 5.0,),
                  Text('New Delhi',style: TextStyle(color: Colors.black87,fontSize: 12.0)),
                ],
              ))
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(left: 5.0, right: 2.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 30,
              width: MediaQuery.of(context).size.width*0.4,
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: const Text(
                      "Send Proposal",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildRoundedImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      // Border radius for individual images
      child: Image.network(
        imageUrl,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
    );
  }
}