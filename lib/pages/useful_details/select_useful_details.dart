import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:deta/pages/useful_details/useful_detail_page.dart';
// ignore_for_file: prefer_const_constructors

import '../../controllers/useful_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/useful_model.dart';
import 'package:get/get.dart';

class Useful_Page extends StatefulWidget{
  @override
  State<Useful_Page> createState() => _Useful_PageState();
}

UsefulController? linksController ;
late UsefulModel linksData ;

Future<dynamic> getlinks() async {
  linksController = Get.put(UsefulController());
  return linksController?.fetchProducts();
}


class _Useful_PageState extends State<Useful_Page> {

  @override
  void initState() {
    super.initState();

  }
 @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getlinks()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            linksData = snapshot.data[0];
            return Scaffold(
                appBar: AppBar(
                  title: Text("UserFul Details"),
                  elevation: 0.0,
                  backgroundColor: AppColors.maroonColor,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Center(
                        child: linksData.status != 0 ? ListView.builder(
                          itemCount: linksData.data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Useful_Detail_Page(value :linksData.data?[index].id??"",) ));
                                  },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Text(linksData.data?[index].uName??"", style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ):  Container(
                          color: Colors.white,
                          child: Center(child: Text("Useful details not found!")),
                        ),
                      ),
                    )
                  ],

                )

            );          }else{
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        }
    );

  }
}