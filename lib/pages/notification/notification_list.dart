import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deta/controllers/notification_controller.dart';

import '../../res/colors/appcolors.dart';

class Notification_list extends StatefulWidget{
  String? value;
  Notification_list({Key? key,  this.value}) : super(key : key );

  @override
  State<Notification_list> createState() => _Notification_listState(value!);
}

class _Notification_listState extends State<Notification_list> {
  String value;
  _Notification_listState(this.value);
  NotificationController  notificationController = Get.put(NotificationController());


  @override
  void initState() {
    notificationController.getData(value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children:<Widget> [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Obx(
              ()=>notificationController.loading.value?Center(child: CircularProgressIndicator(color:AppColors.maroonColor ,)): Center(
                child:notificationController.data.length>0 ? ListView.builder(
                  itemCount: notificationController.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( "${notificationController.data[index].title}", style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                             SizedBox(height: 10,),

                            Text( "${notificationController.data[index].description}", style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              width: double.infinity,
                              child:   Text( " ${notificationController.data[index].insertDate}", textAlign: TextAlign.right,style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );

                  },
                ): Center(
                  child: Text(
                    "Notification Not Found!",style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ),
              ),
            ),
          )
        ],

      ),

    );
  }
}