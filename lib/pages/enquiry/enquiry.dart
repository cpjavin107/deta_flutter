
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/enquiry_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/getenquiry_model.dart';
import '../../widgets/bg_image.dart';
import 'add_enquiry_page.dart';
// ignore_for_file: prefer_const_constructors

class Enquiry extends StatefulWidget{
  @override
  State<Enquiry> createState() => _EnquiryState();
}

EnquiryController? enquiryController ;
late EnquiryModel enquiryData;

Future<dynamic> getHoliday() async {
  enquiryController = Get.put(EnquiryController());
  return   enquiryController?.fetchProducts();
}


class _EnquiryState extends State<Enquiry> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

 return FutureBuilder(
     future:Future.wait([getHoliday()]),
     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
       if(snapshot.hasData){
         enquiryData = snapshot.data[0];
         return Scaffold(
           appBar: AppBar(
             title: Text("Enquiry"),
             elevation: 0.0,
             backgroundColor: AppColors.maroonColor,
             iconTheme: IconThemeData(color: Colors.white),
           ),
           body: RefreshIndicator(
             onRefresh: () {
               return Future.delayed(
                 Duration(seconds: 1),
                     () {
                   setState(() {
                   });
                 },
               );
             },
             child: Stack(
               fit: StackFit.expand,
               children:<Widget> [
                 BgImage(),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:  Column(
                     children: [
                       Flexible(
                         child: enquiryData.status != 0 ?
                         ListView.builder(
                           itemCount: enquiryData.data?.length,
                           itemBuilder: (context, index) {
                             return
                               Card(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text( enquiryData.data?[index].name??"", style: TextStyle(
                                       fontSize: 15,
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                     ),
                                     SizedBox(height: 6,),

                                     Text( enquiryData.data?[index].mobile??"", style: TextStyle(
                                       fontSize: 12,
                                       color: Colors.black,
                                     ),
                                     ),
                                     SizedBox(height: 8,),

                                     Text( enquiryData.data?[index].description??"", style: TextStyle(
                                       fontSize: 10,
                                       color: Colors.black,
                                     ),
                                     ),
                                     SizedBox(height: 8,),

                                     Align(
                                       alignment: Alignment.bottomRight,
                                       child: Text( enquiryData.data?[index].createdAt??"", style: TextStyle(
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
                           },
                         ): Center(
                           child: Text( "Enquiry not found!", style: TextStyle(
                             fontSize: 15,
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                           ),
                           ),
                         ),

                       ),
                     ],
                   ),
                 )
               ],

             ),
           ),
           floatingActionButton: FloatingActionButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add_Enquiry() ));
             },
             backgroundColor: AppColors.maroonColor,
             tooltip: 'Add Enquiry',
             elevation: 5,
             splashColor: Colors.grey,
             child: Icon(Icons.add, color: Colors.white, size: 29,),
           ),
           floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,






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