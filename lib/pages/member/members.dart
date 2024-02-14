import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/member_filter_controller.dart';
import '../../controllers/members_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../widgets/bg_image.dart';
import 'package:deta/models/res_filter_data.dart';
import '../alphabetical_search/list_user_details.dart';
// ignore_for_file: prefer_const_constructors

class Members_List extends StatefulWidget{
  @override
  State<Members_List> createState() => _Members_ListState();
}
class _Members_ListState extends State<Members_List> with TickerProviderStateMixin{
  MemberFilterController memberFilterController=Get.put(MemberFilterController());
@override
  void initState() {
    super.initState();
    memberFilterController.getFilterMemberData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Members'),
          elevation: 0.0,
          backgroundColor: AppColors.maroonColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(
          fit: StackFit.expand,
          children:<Widget> [
            BgImage(),
            Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Obx(
                        ()=> memberFilterController.loading.value?Center(child: CircularProgressIndicator()):ListView.builder(
                            itemCount:memberFilterController.memberData.length,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
                                child: Column(
                                  children: [
                                    Card(
                                      color: AppColors.mainColor,
                                      elevation: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Alpha_detail_Page(value :memberFilterController.memberData[index].memberId,)),)
                                              .then((val)=>{});
                                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value :memberFilterController.memberData2[index].id,) ));
                                        },
                                        child: ClipPath(
                                          child:  Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(color: Colors.transparent, width: 1))),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                              borderRadius: BorderRadius.circular(40.0),
                                              // Border radius for individual images
                                              child: Image.network(
                                                memberFilterController.memberData[index].imageUrl,
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (BuildContext context, Object error, StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    'assets/images/profile_icon.png',
                                                    width: 60,
                                                    height: 60,
                                                  );
                                                },
                                              ),
                                          ),
                                            ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                memberFilterController.memberData[index].name??"",
                                                                maxLines: 2,
                                                                overflow: TextOverflow.clip,
                                                                style:
                                                                TextStyle(fontSize: 14,
                                                                    color: Colors.white,
                                                                    fontFamily: 'Bolds', fontWeight: FontWeight.w800)
                                                                ,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                memberFilterController.memberData[index].firmName??"",
                                                                maxLines: 2,
                                                                overflow: TextOverflow.clip,
                                                                style:
                                                                TextStyle(fontSize: 12,
                                                                    color: Colors.white,
                                                                    fontFamily: 'Bolds',)
                                                                ,
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text(
                                                                memberFilterController.memberData[index].designation??"",
                                                                maxLines: 2,
                                                                overflow: TextOverflow.clip,
                                                                style:
                                                                TextStyle(fontSize: 12,
                                                                    color: Colors.white,
                                                                    fontFamily: 'Bolds', fontWeight: FontWeight.w800)
                                                                ,
                                                              )
                                                            ],
                                                          ),
                                                          Padding(padding:EdgeInsets.only(right: 10,top: 10.0),child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.navigate_next,size: 30.0,color: Colors.white,))),
                                                        ],
                                                      ),
                                                    )
                                                  ],

                                                ),
                                              ],
                                            ),
                                          ),
                                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),
                      )
                    ),
                  ],
                )
            ),
          ],
        )
    );

  }
}

