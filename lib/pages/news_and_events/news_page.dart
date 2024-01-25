import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controllers/news_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/news_model.dart';
import '../../widgets/big_image.dart';
import 'events_image.dart';
// ignore_for_file: prefer_const_constructors

class News_Page extends StatefulWidget{
  @override
  State<News_Page> createState() => _News_PageState();
}

NewsController? newsController ;
late NewsModel newsData;

Future<dynamic> getMembers() async {
  newsController = Get.put(NewsController());
  return   newsController?.fetchProducts();
}



class _News_PageState extends State<News_Page> {
  @override
  void initState() {super.initState();}
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getMembers()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            newsData = snapshot.data[0];
            return Scaffold(
              appBar: AppBar(
                title: Text("Events & News"),
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
                      child: newsData.status != 0 ? ListView.builder(
                        itemCount: newsData.data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                newsData.data?[index].images?.length != 0 ?  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Event_Images(value :newsData.data?[index].images, title: newsData.data?[index].description,) ))
                                    :Text("News images not found!");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(newsData.data?[index].title??"", style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Date : "+ newsData.data![index].date! + "    Time : "+newsData.data![index].time!, style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text( newsData.data?[index].description??"", style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                    ),
                                    SizedBox(height: 10,),
                                    Visibility(
                                      visible: newsData.data?[index].images?.length == 0? false : true,
                                      child: Row(
                                        children: const [
                                          Icon(Icons.image,size: 30, color:Colors.grey),
                                          Text("  Images", style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ): Center(
                        child: Text(
                          "Events or News Not Found!",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                    ),
                  )
                ],

              ),

                bottomNavigationBar: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :newsData.ads?[0].bigImage??"",) ));

                  },
                    child: Image.network(newsData.ads?[0].smallImage??"",)),
              ),
            );
          }else{
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        }
    );

  }
}