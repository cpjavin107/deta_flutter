import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/models/resAnnouncement.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/announcement_controller.dart';
import '../../res/colors/appcolors.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  AnnouncementController announcementController =Get.put(AnnouncementController());
  @override
  void initState() {
    announcementController.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                child: Lottie.asset('assets/images/aa.json')),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              ()=>announcementController.loading.value?Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Align(alignment:Alignment.topCenter,child: CircularProgressIndicator()),
              ) : announcementController.data.length>0?Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView.builder(
                  itemCount: announcementController.data.length,
                  itemBuilder: (context, index) {
                    return CustomScreen( data: announcementController.data[index],);
                  },
                ),
              ):Center(child: Text("Data not found."),),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  Data data;
  CustomScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text( data.title??"", style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),



            // SizedBox(height: 10,),
            //
            // Text( "Type:  ${data["type"], style: TextStyle(
            //   fontSize: 15,
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            // ),
            // ),
            SizedBox(height: 8,),
            Text( data.description?? "", style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text( "${data.date} ${data.time}", style: TextStyle(
                fontSize: 10,
                color: Colors.red,
              ),
              ),
            ),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }
}

